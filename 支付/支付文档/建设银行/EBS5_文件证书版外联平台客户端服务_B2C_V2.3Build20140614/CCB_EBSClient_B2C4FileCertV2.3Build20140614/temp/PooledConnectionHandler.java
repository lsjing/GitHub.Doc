package sterning;

import java.io.*;
import java.net.*;
import java.util.*;

/*����AppServer.java:  �������������Ӧ�� */
import java.io.*;
import java.awt.event.*;
import java.net.*;
//Customer����Ҫʵ��Serializable�ӿڣ����л�


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
//��������AppServerʵ���߳�
public class AppServer extends Thread
{
	ServerSocket server;
	//����һ�������쳣�ķ���fail()
	void fail(String message,Exception e)
	{
		System.out.print(message+"."+e);
	}
	//AppServer��Ĺ����AppServer()
	public AppServer()
	{
		try
		{
			//�ڶ˿�8080�ϴ����������׽���
			server=new ServerSocket(8080);
		}
		catch(IOException e)
		{
			//����fail()������ʾ�쳣��Ϣ
			fail("���ܿ�ʼ������!",e);
		}
		System.out.println("��������ʼ...");
		this.start();		//��ʼ�߳�
	}
	//��дrun()�����������ͻ�����
	public void run()
	{
		try
		{
			while(true)
			{
				//ServerSocket�����server����accept()���������ͻ�����
				Socket netClient=server.accept();
				//��Connection����ʵ�ֿͻ��������������
				Connection con=new Connection(netClient);
			}
		}
		catch(IOException e)
		{
			fail("���ܼ������ͻ�",e);
		}
	}
	//��main()�����У�����������
	public static void main(String[] args) 
	{
		new AppServer();
	}
}
//Connection�������߳�
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
				System.out.println("���ܹرտͻ��׽���"+e1);
				return;
			}
		}
		this.start();		//��ʼ�߳�
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
		//		toClient.println("���Կͻ�����"+Message);
		//		System.out.println("���Կͻ�����"+Message);
				System.out.println("�ͻ����ƣ�"+Message.custName);
				System.out.println("    ���룺"+Message.custPassword);
				toClient.println("�ͻ����ƣ�"+Message.custName+"||���룺"+Message.custPassword);

			}

		}
		catch(IOException e)
		{
			System.out.println("���ͻ����쳣1"+e);
		}
		catch(ClassNotFoundException e1)
		{
			System.out.println("����û�з����쳣"+e1);
		}
		finally
		{
			try
			{
				netClient.close();
			}
			catch(IOException e)
			{
				System.out.println("���ܹرտͻ��׽���"+e);
				return;
			}
		}
	}
}
