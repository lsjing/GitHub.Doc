package sterning;

import java.io.*;
import java.net.*;
import java.util.*;

/*程序AppServer.java:  创建网络服务器应用 */
import java.io.*;
import java.awt.event.*;
import java.net.*;
//Customer类需要实现Serializable接口，串行化


public class PooledConnectionHandler implements Runnable {
    protected Socket connection;
    protected static List pool = new LinkedList();
    public PooledConnectionHandler() {}
    public void  handleConnection() {
        try {
            PrintWriter streamWriter = new PrintWriter(connection.getOutputStream()); 
            BufferedReader streamReader = new BufferedReader(new InputStreamReader(connection.getInputStream())); 
            String fileToRead = streamReader.readLine();
            BufferedReader fileReader = new BufferedReader(new FileReader(fileToRead));
            String line = null;
            while((line=fileReader.readLine())!=null)
                streamWriter.println(line); 
            fileReader.close();
            streamWriter.close();
            streamReader.close();
        }
        catch(FileNotFoundException e) {
            System.out.println("");
        }
        catch(IOException e) {
            System.out.println(""+e);
        }
    }
    public static void processRequest(Socket requestToHandle) {
        synchronized(pool) {
            pool.add(pool.size(), requestToHandle);
            pool.notifyAll();
        }
    }
    public void run() {
        while(true) {
            synchronized(pool) {
                while(pool.isEmpty()) {
                    try {
                        pool.wait();
                    }
                    catch(InterruptedException e) {
                        e.printStackTrace(); 
                    }
                }
                connection= (Socket)pool.remove(0); 
            }
            handleConnection();
        }
    }
}



class Customer implements Serializable
{
	String custName;
	String custPassword;
}
//服务器类AppServer实现线程
public class AppServer extends Thread
{
	ServerSocket server;
	//定义一个处理异常的方法fail()
	void fail(String message,Exception e)
	{
		System.out.print(message+"."+e);
	}
	//AppServer类的构造符AppServer()
	public AppServer()
	{
		try
		{
			//在端口8080上创建服务器套接字
			server=new ServerSocket(8080);
		}
		catch(IOException e)
		{
			//调用fail()方法显示异常信息
			fail("不能开始服务器!",e);
		}
		System.out.println("服务器开始...");
		this.start();		//开始线程
	}
	//重写run()方法，监听客户请求
	public void run()
	{
		try
		{
			while(true)
			{
				//ServerSocket类对象server调用accept()方法监听客户请求
				Socket netClient=server.accept();
				//在Connection类中实现客户与服务器的连接
				Connection con=new Connection(netClient);
			}
		}
		catch(IOException e)
		{
			fail("不能监听到客户",e);
		}
	}
	//在main()方法中，启动服务器
	public static void main(String[] args) 
	{
		new AppServer();
	}
}
//Connection类连接线程
class Connection extends Thread
{
	protected Socket netClient;
//	protected BufferedReader fromClient;
	protected ObjectInputStream fromClient;  
	protected PrintStream toClient; 
	public Connection(Socket client)
	{
		netClient=client;
		try
		{
//			fromClient =new BufferedReader(new InputStreamReader(netClient.getInputStream()));
			fromClient =new ObjectInputStream(netClient.getInputStream());
			toClient=new PrintStream(netClient.getOutputStream());
		}
		catch(IOException e)
		{
			try
			{
				netClient.close();
			}
			catch(IOException e1)
			{
				System.out.println("不能关闭客户套接字"+e1);
				return;
			}
		}
		this.start();		//开始线程
	}
    public void run()
	{
//		String Message;
		Customer Message;
		try
		{
			for(;;)
			{
		//		Message=fromClient.readLine();
				Message=(Customer)fromClient.readObject();
				if(Message==null)
					break;
		//		toClient.println("来自客户串："+Message);
		//		System.out.println("来自客户串："+Message);
				System.out.println("客户名称："+Message.custName);
				System.out.println("    密码："+Message.custPassword);
				toClient.println("客户名称："+Message.custName+"||密码："+Message.custPassword);

			}

		}
		catch(IOException e)
		{
			System.out.println("读客户流异常1"+e);
		}
		catch(ClassNotFoundException e1)
		{
			System.out.println("流类没有发现异常"+e1);
		}
		finally
		{
			try
			{
				netClient.close();
			}
			catch(IOException e)
			{
				System.out.println("不能关闭客户套接字"+e);
				return;
			}
		}
	}
}
