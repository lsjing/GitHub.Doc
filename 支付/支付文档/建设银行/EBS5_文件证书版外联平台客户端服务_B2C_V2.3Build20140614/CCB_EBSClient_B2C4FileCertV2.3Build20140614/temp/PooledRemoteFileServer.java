package sterning;

import java.io.*;
import java.net.*;
import java.util.*;

/*程序AppClient.java:  创建网络客户Applet */
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
//Customer类需要实现Serializable接口，串行化
class Customer extends Object implements Serializable
{
	String custName;
	String custPassword;
}
//网络客户类AppClient


public class PooledRemoteFileServer {
    protected int maxConnections;
    protected int listenPort;
    protected ServerSocket serverSocket;
    public PooledRemoteFileServer(int aListenPort, int maxConnections) {
        listenPort= aListenPort;
        this.maxConnections = maxConnections;
    }
    public void acceptConnections() {
        try {
            ServerSocket server = new ServerSocket(listenPort, 5);
            Socket incomingConnection = null;
            while(true) {
                incomingConnection = server.accept();
                handleConnection(incomingConnection);
            }
        }
        catch(BindException e) {
            System.out.println("");
        }
        catch(IOException e) {
            System.out.println(""+listenPort);
        }
    }
    protected void handleConnection(Socket connectionToHandle) {
        PooledConnectionHandler.processRequest(connectionToHandle);
    }
    public void setUpHandlers() {
        for(int i=0; i<maxConnections; i++) {
            PooledConnectionHandler currentHandler = new PooledConnectionHandler();
            new Thread(currentHandler, "Handler " + i).start();
        }
    }
    public static void main(String args[]) {
        PooledRemoteFileServer server = new PooledRemoteFileServer(1001, 3);
        server.setUpHandlers(); 
        server.acceptConnections();
    }
}


public class AppClient extends JApplet
{
	JPanel panelObject;
	JLabel labelCustName;
	JTextField textCustName;	
	JLabel labelCustPassword;
	JPasswordField textCustPassword;	
	JButton buttonLogin;
	GridBagLayout gl;
	GridBagConstraints gbc;
	public AppClient() 
	{
		//初始化布局和容器
		gl=new GridBagLayout();
		gbc=new GridBagConstraints();
//		panelObject=(JPanel)getContentPane();
		panelObject=new JPanel();
		getContentPane().add(panelObject);
		panelObject.setLayout(gl);
		//初始化控件
		labelCustName=new JLabel("客户名称： ");   
		textCustName=new JTextField(15);
		labelCustPassword=new JLabel("密码： ");
		textCustPassword=new JPasswordField(15);
		buttonLogin=new JButton("登陆(L)");
		panelObject.add(labelCustName);
		panelObject.add(textCustName);
		panelObject.add(labelCustPassword);
		panelObject.add(textCustPassword);
		panelObject.add(buttonLogin);
		//布局标签控件到容器
		gbc.anchor=GridBagConstraints.EAST;
		gbc.gridx=1;
		gbc.gridy=1;
		gl.setConstraints(labelCustName,gbc);
		gbc.gridy=2;
		gl.setConstraints(labelCustPassword,gbc);
		//布局文本编辑框控件到容器
		gbc.anchor=GridBagConstraints.WEST;
		gbc.gridx=2;
		gbc.gridy=1;
		gl.setConstraints(textCustName,gbc);
		gbc.gridy=2;
		gl.setConstraints(textCustPassword,gbc);
		//布局按钮控件到容器
		gbc.anchor=GridBagConstraints.EAST;
		gbc.gridy=4;
		gl.setConstraints(buttonLogin,gbc);
	}
	public void init()
	{
		new AppClient();
		LoginAction la=new LoginAction();
		buttonLogin.addActionListener(la);
	}
	//单击按钮的事件类
	class LoginAction implements ActionListener
	{
		//定义一个处理异常的方法fail()
		void fail(String message,Exception e)
		{
			getAppletContext().showStatus(message+"."+e);
		}
		public void actionPerformed(ActionEvent evt)
		{
			Object obj=evt.getSource();
			if(obj==buttonLogin)
			{
				//需要客户数据
				Customer data=new Customer();
				data.custName=textCustName.getText();
				data.custPassword=new String(textCustPassword.getPassword());
		//		String toServerStr=data.custName+" : "+data.custPassword;				
				try
				{
					//连接到服务器
					Socket clientSocket;
					clientSocket=new Socket("127.0.0.1",8080);
					getAppletContext().showStatus("客户机开始！");
					//写客户数据到服务器Socket	
			//		PrintStream	toServer=new PrintStream(clientSocket.getOutputStream());
			//		toServer.println("发送到服务器串："+toServerStr);
					ObjectOutputStream toServer;
					toServer=new ObjectOutputStream(clientSocket.getOutputStream());				
					toServer.writeObject((Customer)data);							
					//从服务器Socket读一行字符串			      
					BufferedReader fromServer=new BufferedReader
						(new InputStreamReader(clientSocket.getInputStream()));
					String message=fromServer.readLine();
					getAppletContext().showStatus(message);
					//关闭输出输入流
					toServer.close();
					fromServer.close();
				}
				catch(InvalidClassException e)
				{
					fail("客户类异常!",e);
				}
				catch(NotSerializableException e)
				{
					fail("客户类没有串行化!",e);
				}
				catch(IOException e)
				{
					fail("不能写到服务器!",e);
				}
			}
		}
	}
}

