using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using SDK_Demo.Resources;
using MicroMsg.sdk;
using System.Windows.Resources;
using System.IO;
using Microsoft.Xna.Framework.Media;
using Network;
using WeixinPay;
using System.Collections.Generic;
using Utils;

namespace SDK_Demo
{
    public class ConstString
    {
        //snsapi_userinfo 个人资料
        //snsapi_friend 加好友，关注微信公众号
        //snsnapi_message 发送消息
        //snsapi_contact 读取好友资料
        public const string SCOPE = "snsapi_userinfo,snsapi_friend,snsnapi_message,snsapi_contact";
        public const string STATE = "sdk_demo";

        // 微信SDK参数
        public const string APPID = "wxd930ea5d5a258f4f";
        public const string SECRET = "db426a9829e4b49a0dcac7b4162da6b6";
        public const string SECRET_KEY = "L8LrMqqeGRxST5reouB0K66CaYAWpqhAVsq7ggKkxHCOastWksvuX1uvmvQclxaHoYd3ElNBrNO2DHnnzgfVG9Qs473M3DTOZug5er46FhuGofumV8H2FVR9qkjSlC5K";

        // 财付通接口参数
        public const string PARTNER_ID = "1900000109";
        public const string PARTNER_KEY = "8934e7d15453e97507ef794cf7b0519d";
    }

    //发送消息给微信的Demo程序，程序演示各种内心数据的组装和发送
    public partial class MainPage : PhoneApplicationPage
    {
             
        // Constructor
        public MainPage()
        {
            InitializeComponent();
        }

        //第三方app先去财付通server提交订单信息
        private void btnGetOrder_Click(object sender, RoutedEventArgs e)
        {
            string productName = "product name";
            string productPrice = "1";
            Dictionary<string, string> args = new Dictionary<string, string>();
            args.Add("input_charset", "UTF-8");
            args.Add("partner", ConstString.PARTNER_ID);
            args.Add("spbill_create_ip", "196.168.1.1");
            args.Add("notify_url", "http://weixin.qq.com");
            args.Add("OutPutType", "JSON");//这个value都要大写，key的大小写要完全一致
            args.Add("fee_type", "1");
            args.Add("out_trade_no", Util.getNowSeconds().ToString());
            args.Add("body", productName);
            args.Add("total_fee", productPrice);

            WeixinPayManager payMgr = new WeixinPayManager();
            payMgr.payFor(ConstString.PARTNER_ID, args, payCb);
        }

        private Dictionary<string, string> mReqDict = null;
        private void payCb(Dictionary<string, string> reqDict)
        {
            if (reqDict == null || reqDict.Count == 0)
            {
                MessageBox.Show("get prepayid failed");
                return;
            }

            MessageBox.Show("get prepayid succeed, prepayid = " + reqDict["prepayid"] + " signsha1 = " + reqDict["signsha1"]);

            mReqDict = reqDict;
        }

        //拉起微信支付
        private void btnPay_Click(object sender, RoutedEventArgs e)
        {
            if (mReqDict == null || mReqDict.Count == 0)
            {
                MessageBox.Show("please get prepayid first");
                return;
            }
            string AppID = mReqDict["appid"];
            // Summary:
            //      随机串，防重发 
            string NonceStr = mReqDict["noncestr"];
            //
            // Summary:
            //      商家根据财付通文档填写的数据和签名 
            string Package = mReqDict["packageforsdk"];
            //
            // Summary:
            //      商家向财付通申请的商家id
            string PartnerId = ConstString.PARTNER_ID;
            //
            // Summary:
            //      预支付订单 预支付订单
            string PrepayId = mReqDict["prepayid"];
            //
            // Summary:
            //      商家根据微信开放平台文档对数据做的签名 
            string Sign = mReqDict["signsha1"]; 
            //
            // Summary:
            //      时间戳，防重发 
            uint TimeStamp = uint.Parse(mReqDict["timestamp"]);

            SendPay.Req req = new SendPay.Req(PartnerId, PrepayId, NonceStr, TimeStamp, Package, Sign);
            IWXAPI api = WXAPIFactory.CreateWXAPI(AppID);
            api.SendReq(req);
        }

        //所有发送数据的按钮的处理函数，根据点击不同，组织不同数据发送给微信
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("############################");
            System.Diagnostics.Debug.WriteLine("Button_Click_1 in");
            string AppID = ConstString.APPID;
            int scene = SendMessageToWX.Req.WXSceneSession; //发给微信朋友
            WXBaseMessage message = null;

            //拉起微信
            if (btnLaunch == sender)
            {
                WXAPIFactory.CreateWXAPI(AppID).OpenWXApp();
                return;
            }
            
            //读取实例数据，示例数据都是从res中读取，实现时根据你的应用实际情况取得数据
            byte[] png = readRes("Res/1.png");//thumb
            byte[] jpg = readRes("Res/1.jpg");//pic
            byte[] gif = readRes("Res/1.gif");//emoji
            byte[] txt = readRes("Res/1.txt");//text
            byte[] doc = readRes("Res/1.doc");//word file

            //发送到朋友圈，设置scene为WXSceneTimeline
            if (sender == btnTxtSns || sender == btnImgSns || sender == btnUrlSns || sender == btnMusicSns)
            {
                scene = SendMessageToWX.Req.WXSceneTimeline;
            }

            //用户选择发给好友还是朋友圈，设置scene为WXSceneChooseByUser
            if (sender == btnTxt_ChooseByUser)
            {
                scene = SendMessageToWX.Req.WXSceneChooseByUser; 
            }

            //文本数据的组装
            if (sender == btnTxt || sender == btnTxtSns )
            {
                WXTextMessage msg = new WXTextMessage();
                msg.Title = "text";
                msg.ThumbData = null;
                msg.Text = "this is a text";
                message = msg;
            }

            //图片数据的组装
            if (sender == btnImg || sender == btnImgSns)
            {
                WXImageMessage msg = new WXImageMessage();
                msg.Title = "picture";
                msg.Description = "this is a picture";
                msg.ThumbData = png;

                //图片的byte[]数据
                //msg.ImageData = jpg;

                //图片的网络链接，ImageUrl和ImageData二者取其一，不要同时都填值
                msg.ImageUrl = "http://soso7.gtimg.cn/sosopic/0/4085165533549977883/150";

                message = msg;
            }

            //动态表情数据的组装
            if (sender == btnEmj)
            {
                WXEmojiMessage msg = new WXEmojiMessage();
                msg.Title = "Gif";
                msg.Description = "this is a Gif";
                msg.ThumbData = png;

                msg.EmojiData = gif;

                message = msg;
            }

            //文件数据的组装
            if (sender == btnFile)
            {
                WXFileMessage msg = new WXFileMessage();
                msg.Title = "file";
                msg.Description = "this is a file";
                msg.ThumbData = png;

                msg.FileData = doc;
                msg.FileName = "1.doc";

                message = msg;
            }

            //链接数据的组装
            if (sender == btnUrl || sender == btnUrlSns)
            {
                WXWebpageMessage msg = new WXWebpageMessage();
                msg.Title = "qq homepage";
                msg.Description = "goto qq homepage";
                msg.ThumbData = png;

                msg.WebpageUrl = "http://www.qq.com";

                message = msg;
            }

            //音乐数据的组装
            if (sender == btnMusic || sender == btnMusicSns || sender == btnTxt_ChooseByUser)
            {
                WXMusicMessage msg = new WXMusicMessage();
                msg.Title = "music";
                msg.Description = "by XXX";
                msg.ThumbData = png;

                msg.MusicUrl = "http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A2220E998BFE5A3ABE58CB9E781B5222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696334382E74632E71712E636F6D2F586B30305156374F4141414134674141414250657376594E4D7A55327A4441784E654D35586A4A63366F76484F415942443174754251414F4347384439394B343965776F6244733D2F31313134383332342E6D34613F7569643D3233343931313534393826616D703B63743D3026616D703B636869643D30222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31312E71716D757369632E71712E636F6D2F33313134383332342E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E88BB1E79A87E7B2BEE9808932303038222C22736F6E675F4944223A313134383332342C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E99988E5A595E8BF85222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31376C414141415977414141442F6954452B656E7A457A6D6A59324D4D55314F444C5230483937504B344142713850446D3550476C56436366394D536661644D5464704E7A3163665451344D673D3D2F33313134383332342E6D70333F7569643D3233343931313534393826616D703B63743D3026616D703B636869643D3026616D703B73747265616D5F706F733D35227D";
                msg.MusicLowBandUrl = "http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A2220E998BFE5A3ABE58CB9E781B5222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696334382E74632E71712E636F6D2F586B30305156374F4141414134674141414250657376594E4D7A55327A4441784E654D35586A4A63366F76484F415942443174754251414F4347384439394B343965776F6244733D2F31313134383332342E6D34613F7569643D3233343931313534393826616D703B63743D3026616D703B636869643D30222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31312E71716D757369632E71712E636F6D2F33313134383332342E6D7033222C226E657454797065223A2263617272696572222C22736F6E675F416C62756D223A22E88BB1E79A87E7B2BEE9808932303038222C22736F6E675F4944223A313134383332342C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E99988E5A595E8BF85222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31376C414141415977414141442F6954452B656E7A457A6D6A59324D4D55314F444C5230483937504B344142713850446D3550476C56436366394D536661644D5464704E7A3163665451344D673D3D2F33313134383332342E6D70333F7569643D3233343931313534393826616D703B63743D3026616D703B636869643D3026616D703B73747265616D5F706F733D35227D";

                message = msg;
            }

            //视频数据的组装
            if (sender == btnVedio)
            {
                WXVideoMessage msg = new WXVideoMessage();
                msg.Title = "music";
                msg.Description = "by XXX";
                msg.ThumbData = png;

                msg.VideoUrl = "http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A2220E998BFE5A3ABE58CB9E781B5222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696334382E74632E71712E636F6D2F586B30305156374F4141414134674141414250657376594E4D7A55327A4441784E654D35586A4A63366F76484F415942443174754251414F4347384439394B343965776F6244733D2F31313134383332342E6D34613F7569643D3233343931313534393826616D703B63743D3026616D703B636869643D30222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31312E71716D757369632E71712E636F6D2F33313134383332342E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E88BB1E79A87E7B2BEE9808932303038222C22736F6E675F4944223A313134383332342C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E99988E5A595E8BF85222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31376C414141415977414141442F6954452B656E7A457A6D6A59324D4D55314F444C5230483937504B344142713850446D3550476C56436366394D536661644D5464704E7A3163665451344D673D3D2F33313134383332342E6D70333F7569643D3233343931313534393826616D703B63743D3026616D703B636869643D3026616D703B73747265616D5F706F733D35227D";
                msg.VideoLowBandUrl = "http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A2220E998BFE5A3ABE58CB9E781B5222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696334382E74632E71712E636F6D2F586B30305156374F4141414134674141414250657376594E4D7A55327A4441784E654D35586A4A63366F76484F415942443174754251414F4347384439394B343965776F6244733D2F31313134383332342E6D34613F7569643D3233343931313534393826616D703B63743D3026616D703B636869643D30222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31312E71716D757369632E71712E636F6D2F33313134383332342E6D7033222C226E657454797065223A2263617272696572222C22736F6E675F416C62756D223A22E88BB1E79A87E7B2BEE9808932303038222C22736F6E675F4944223A313134383332342C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E99988E5A595E8BF85222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31376C414141415977414141442F6954452B656E7A457A6D6A59324D4D55314F444C5230483937504B344142713850446D3550476C56436366394D536661644D5464704E7A3163665451344D673D3D2F33313134383332342E6D70333F7569643D3233343931313534393826616D703B63743D3026616D703B636869643D3026616D703B73747265616D5F706F733D35227D";

                message = msg;
            }

            //把数据发送给微信，数据错误或发送错误，会抛出WXException，调试时，可从WXException中得知是什么错误。
            //发布应用时，可直接向用户提示错误，也可以根据自己实际需要定制错误的处理
            try
            {
                SendMessageToWX.Req req = new SendMessageToWX.Req(message, scene);
                IWXAPI api = WXAPIFactory.CreateWXAPI(AppID);

                Console.WriteLine("api.SendReq in");
                api.SendReq(req);
            }
            catch (WXException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private byte[] readRes(string path)
        {
            StreamResourceInfo info = App.GetResourceStream(new Uri(path, UriKind.Relative));
            if (info == null) return null;
            Stream stream = info.Stream;
            byte[] data = new byte[stream.Length];
            stream.Read(data, 0, (int)stream.Length);
            return data;
        }

        static public double getNowMilliseconds()
        {
            DateTime d1 = DateTime.Now.ToUniversalTime();
            DateTime d2 = new DateTime(1970, 1, 1);
            double d = d1.Subtract(d2).TotalMilliseconds;
            return d;
        }
    }
}