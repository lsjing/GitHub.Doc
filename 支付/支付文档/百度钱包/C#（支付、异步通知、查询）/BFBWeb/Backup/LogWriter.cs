using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace BFBWeb
{
    class LogWriter
    {
        /// <summary>
        /// ����Ϣд����־
        /// </summary>
        /// <param name="msg">��Ϣ</param>
        /// <param name="logPath">��־�ļ�</param>
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
        /// ����Ϣд����־
        /// </summary>
        /// <param name="msg">��Ϣ</param>
        /// <param name="currentMethd">��ǰִ�еķ���</param>
        /// <param name="logPath">��־�ļ�</param>
        public void appendToLog(string msg, string currentMethd, string logPath)
        {
            try
            {
                StreamWriter logWriter = new StreamWriter(logPath, true);
                string message = DateTime.Now + " " + "ִ��" + currentMethd + "��������" + msg;
                logWriter.WriteLine(message);
                logWriter.Close();

            }
            catch
            {

            }

        }

    }
}
