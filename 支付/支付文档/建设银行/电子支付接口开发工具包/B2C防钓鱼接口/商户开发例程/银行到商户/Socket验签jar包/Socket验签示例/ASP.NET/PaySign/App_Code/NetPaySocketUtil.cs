using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Sockets;
using System.Net;
using System.Text;

/// <summary>
/// Summary description for NetPaySocketUtil
/// </summary>
public class NetPaySocketUtil
{
    public NetPaySocketUtil()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string exeSign(string IPAddr, int port, string signStr)
    {
        Socket newclient = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        IPEndPoint ie = new IPEndPoint(IPAddress.Parse(IPAddr), port); // 服务器的IP和端口 
        try
        {
            newclient.Connect(ie);
        }
        catch (SocketException e)
        {
            //e.ToString();
            return null;
        }

        signStr = signStr + "\r\n"; //在发送报文尾部添加换行符

        newclient.Send(Encoding.ASCII.GetBytes(signStr));

        byte[] data = new byte[2048];
        int recv = newclient.Receive(data);

        newclient.Shutdown(SocketShutdown.Both);
        newclient.Close();

        return Encoding.ASCII.GetString(data, 0, recv);
    }
}