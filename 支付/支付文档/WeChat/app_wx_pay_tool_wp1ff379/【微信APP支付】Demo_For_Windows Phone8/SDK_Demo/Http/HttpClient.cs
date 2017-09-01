using System;
using System.IO;
using System.Net;
using System.Windows;

using System.Net.Sockets;
using System.Threading;
using System.Text;
using System.Diagnostics;
using System.Collections.Generic;

namespace Network
{

    public delegate void DefineHttpHeaderDelegate(HttpWebRequest request);
    public delegate void OnHttpReceivedProgressDelegate(int length);

    /// <summary>
    ///  Http Client
    /// </summary>
    /// <returns></returns>
    public class HttpClient
    {
        public const int BUFFER_SIZE = 1024*8;

        private const int STATUS_GET_NULL = 0;   //未开始
        private const int STATUS_GET_DOING = 1;  //接受中
        private const int STATUS_GET_DONE = 2;   //数据已收完毕
        

        #region HttpRequestContext define 
        //This class stores the context of the request.
        public class HttpRequestContext
        {
            public int mStatus = STATUS_GET_NULL;

            public byte[] mBufferInput = null;                         //发送数据
            //public byte[] mBufferRead = new byte[BUFFER_SIZE];         //中间临时buffer
            public byte[] mBufferOutput = null;// = new byte[BUFFER_SIZE*2];     //输出数据

            public int mOutputLength = 0;

            public HttpWebRequest mRequest = null;
            public HttpWebResponse mResponse = null;
            public Stream mStreamResponse = null;
            public Stream mStreamRequest = null;

            public IAsyncResult mAsyncRequestStreamResult = null;
            public IAsyncResult mAsyncResponseResult = null;
            public IAsyncResult mAsyncReadResult = null;

            public event OnHttpReceivedProgressDelegate mProgress = null;

            public int mSeqID = 0;
            public string mCmdUri;
            public string mHost;
            
            public void setProgress(int len)
            { 
                if (mProgress != null)
                 {
                     mProgress(len);
                 }
            }

            /// <summary>
            ///  Release the HttpWebResponse resource.
            /// </summary>
            /// <returns></returns>
            public void release()
            {
                try
                {
                    if (mStreamResponse != null)
                    {
                        mStreamResponse.Close();
                        mStreamResponse = null;
                    }

                    if (mResponse != null)
                    {
                        mResponse.Close();
                        mResponse = null;
                    }
                }
                catch (Exception e)
                {
                }
            }
        }

        #endregion

        public HttpRequestContext mHttpContext ;
        public event DefineHttpHeaderDelegate mDefineHeader = null;

        Action<byte[]> rspCallback = null;

        static int gHttpSeq = 0;
        public int httpSeq =0;

        //构造
        public HttpClient( string cmdUri, int seq, string host)
        {
            mHttpContext = new HttpRequestContext();
            mHttpContext.mCmdUri = cmdUri;
            mHttpContext.mSeqID = seq;
            mHttpContext.mHost = host;

            httpSeq = gHttpSeq++;
        }

        public void close()
        {
            if (mHttpContext != null)
            {
                mHttpContext.release();
                mHttpContext = null;
            }
        }

        /// <summary>
        ///  获取已接收到的数据长度
        /// </summary>
        public int getReceivedLength()
        {
            if (mHttpContext != null)
            {
                return mHttpContext.mOutputLength;
            }
            return 0;
        }

        /// <summary>
        ///  外部接口，查询数据是否返回
        /// </summary>
        /// <returns></returns>
        public SocketError receive(ref byte[] outBuf,ref int seq,ref string cmdUri)
        {
            
            if (mHttpContext.mStatus != STATUS_GET_DONE)
            {
                return SocketError.NoData;
            }
           
            seq = mHttpContext.mSeqID;
            cmdUri = mHttpContext.mCmdUri;

            if (mHttpContext.mOutputLength <= 0)
            {
                return SocketError.SocketError;
            }
            int count = mHttpContext.mOutputLength;
            outBuf = new byte[count];
            Buffer.BlockCopy(mHttpContext.mBufferOutput, 0, outBuf, 0, count);

            mHttpContext.mStatus = STATUS_GET_NULL;
            mHttpContext.mOutputLength = 0;

            return SocketError.Success;
        }

        /// <summary>
        ///  外部接口，发送请求
        /// </summary>
        /// <returns></returns>
        public bool send(byte[] data = null, int count = 0, Action<byte[]> cb = null)
        {
            try
            {
                rspCallback = cb;
                System.Uri uriHttp = new Uri(mHttpContext.mCmdUri);

                // Create a HttpWebrequest object to the desired URL.
                mHttpContext.mRequest = (HttpWebRequest)WebRequest.Create(uriHttp);
                if (mDefineHeader == null)
                {
                    mHttpContext.mRequest.Method = "GET";
                    mHttpContext.mRequest.UserAgent = " HTTP Client";
                    mHttpContext.mRequest.Accept = "*/*";
                    mHttpContext.mRequest.Headers["Cache-Control"] = "no-cache";
                }
                else
                {
                    //支持自定义head
                    mDefineHeader(mHttpContext.mRequest);                   
                }

                mHttpContext.mStatus = STATUS_GET_DOING;

                //save data
                if (data != null && count != 0)
                {
                    mHttpContext.mBufferInput = new byte[count];
                    Buffer.BlockCopy(data, 0, mHttpContext.mBufferInput, 0, count);

                    // Start the asynchronous request.
                    mHttpContext.mAsyncRequestStreamResult = (IAsyncResult)mHttpContext.mRequest.BeginGetRequestStream(
                                            new AsyncCallback(onGetRequestStreamCallback), mHttpContext);
                }
                else
                {
                    // Start the asynchronous request.
                    mHttpContext.mAsyncResponseResult = (IAsyncResult)mHttpContext.mRequest.BeginGetResponse(
                                         new AsyncCallback(onRecvHttpCallback), mHttpContext);
                }
                
                return true;
            }
            catch (Exception e)
            {
                // Need to handle the exception
                mHttpContext.mStatus = STATUS_GET_DONE;
                mHttpContext.release();

                //异常情况也要调用回调函数
                if (rspCallback != null)
                {
                    Deployment.Current.Dispatcher.BeginInvoke(() =>
                    {
                        rspCallback(null);
                    });
                } 
            }

            return false;
        }

        /// <summary>
        ///  内部接口，处理发送http body数据
        /// </summary>
        /// <returns></returns>
        private void onGetRequestStreamCallback(IAsyncResult asynchronousResult)
        {
            // State of request is asynchronous.
            HttpRequestContext context = (HttpRequestContext)asynchronousResult.AsyncState;

            try
            {
                HttpWebRequest httpRequest = context.mRequest;
                context.mStreamRequest = httpRequest.EndGetRequestStream(asynchronousResult);

                //write body
                context.mStreamRequest.Write(context.mBufferInput, 0, context.mBufferInput.Length);
                context.mStreamRequest.Close();

                // Start the asynchronous request.
                context.mAsyncResponseResult = (IAsyncResult)context.mRequest.BeginGetResponse(
                                         onRecvHttpCallback, context);

            }
            catch (Exception e)
            {
                // Need to handle the exception
                context.mStatus = STATUS_GET_DONE;
                context.release();

                //异常情况也要调用回调函数
                if (rspCallback != null)
                {
                    Deployment.Current.Dispatcher.BeginInvoke(() =>
                    {
                        rspCallback(null);
                    });
                } 
            }
        }

        /// <summary>
        ///  内部接口，处理HTTP返回数据
        /// </summary>
        /// <returns></returns>
        private void onRecvHttpCallback(IAsyncResult asynchronousResult)
        {
            // State of request is asynchronous.
            HttpRequestContext context = (HttpRequestContext)asynchronousResult.AsyncState;
            
            try
            {
                HttpWebRequest httpRequest = context.mRequest;
                context.mResponse = (HttpWebResponse)httpRequest.EndGetResponse(asynchronousResult);
                
                 Stream streamResult = context.mResponse.GetResponseStream();

                int bufffer_len = (int)streamResult.Length + BUFFER_SIZE;
                 byte[]  buffer = new byte[bufffer_len];
                 int read_total = streamResult.Read(buffer, 0, (int)streamResult.Length);                 
                 int read_bytes = 0;
                 context.setProgress(read_total);
                 
                 do //基本上不会进入下面这个循环
                 {
                    read_bytes = streamResult.Read(buffer, read_total, bufffer_len - read_total);
                    if (read_bytes > 0)
                    {
                        read_total += read_bytes;                        
                        if(bufffer_len - read_total < BUFFER_SIZE)
                        {
                            bufffer_len += BUFFER_SIZE;
                            Array.Resize(ref buffer, bufffer_len);
                        }
                        context.setProgress(read_total);
                    }
                 } while (read_bytes > 0); //read_bytes <= 0 下载完成

                context.mOutputLength = (int)read_total;
                context.mBufferOutput = buffer;
                context.mStatus = STATUS_GET_DONE;

                if (rspCallback != null)
                {
                    Deployment.Current.Dispatcher.BeginInvoke(() =>
                    {
                        rspCallback(context.mBufferOutput);
                    });
                }                                                                                       
            }
            catch (Exception e)
            {
                // Need to handle the exception
                context.mStatus = STATUS_GET_DONE;
                context.release();

                //异常情况也要调用回调函数
                if (rspCallback != null)
                {
                    Deployment.Current.Dispatcher.BeginInvoke(() =>
                    {
                        rspCallback(null);
                    });
                } 
            }
        }

    }
}

