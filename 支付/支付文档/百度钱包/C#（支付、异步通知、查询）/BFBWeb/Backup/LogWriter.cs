using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace BFBWeb
{
    class LogWriter
    {
        /// <summary>
        /// 将信息写入日志
        /// </summary>
        /// <param name="msg">消息</param>
        /// <param name="logPath">日志文件</param>
        public void appendToLog(string msg, string logPath)
        {
            try
            {
                StreamWriter logWriter = new StreamWriter(logPath, true);
                string message = DateTime.Now + " " + msg;
                logWriter.WriteLine(message);
                logWriter.Close();

            }
            catch
            {

            }
        }
        /// <summary>
        /// 将信息写入日志
        /// </summary>
        /// <param name="msg">消息</param>
        /// <param name="currentMethd">当前执行的方法</param>
        /// <param name="logPath">日志文件</param>
        public void appendToLog(string msg, string currentMethd, string logPath)
        {
            try
            {
                StreamWriter logWriter = new StreamWriter(logPath, true);
                string message = DateTime.Now + " " + "执行" + currentMethd + "方法出错：" + msg;
                logWriter.WriteLine(message);
                logWriter.Close();

            }
            catch
            {

            }

        }

    }
}
