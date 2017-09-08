package sterning;

import java.io.*;
import java.net.*;
import java.util.*;

/*����AppClient.java:  ��������ͻ�Applet */
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
//Customer����Ҫʵ��Serializable�ӿڣ����л�
class Customer extends Object implements Serializable
{
	String custName;
	String custPassword;
}
//����ͻ���AppClient


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
		//��ʼ�����ֺ�����
		gl=new GridBagLayout();
		gbc=new GridBagConstraints();
//		panelObject=(JPanel)getContentPane();
		panelObject=new JPanel();
		getContentPane().add(panelObject);
		panelObject.setLayout(gl);
		//��ʼ���ؼ�
		labelCustName=new JLabel("�ͻ����ƣ� ");   
		textCustName=new JTextField(15);
		labelCustPassword=new JLabel("���룺 ");
		textCustPassword=new JPasswordField(15);
		buttonLogin=new JButton("��½(L)");
		panelObject.add(labelCustName);
		panelObject.add(textCustName);
		panelObject.add(labelCustPassword);
		panelObject.add(textCustPassword);
		panelObject.add(buttonLogin);
		//���ֱ�ǩ�ؼ�������
		gbc.anchor=GridBagConstraints.EAST;
		gbc.gridx=1;
		gbc.gridy=1;
		gl.setConstraints(labelCustName,gbc);
		gbc.gridy=2;
		gl.setConstraints(labelCustPassword,gbc);
		//�����ı��༭��ؼ�������
		gbc.anchor=GridBagConstraints.WEST;
		gbc.gridx=2;
		gbc.gridy=1;
		gl.setConstraints(textCustName,gbc);
		gbc.gridy=2;
		gl.setConstraints(textCustPassword,gbc);
		//���ְ�ť�ؼ�������
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
	//������ť���¼���
	class LoginAction implements ActionListener
	{
		//����һ�������쳣�ķ���fail()
		void fail(String message,Exception e)
		{
			getAppletContext().showStatus(message+"."+e);
		}
		public void actionPerformed(ActionEvent evt)
		{
			Object obj=evt.getSource();
			if(obj==buttonLogin)
			{
				//��Ҫ�ͻ�����
				Customer data=new Customer();
				data.custName=textCustName.getText();
				data.custPassword=new String(textCustPassword.getPassword());
		//		String toServerStr=data.custName+" : "+data.custPassword;				
				try
				{
					//���ӵ�������
					Socket clientSocket;
					clientSocket=new Socket("127.0.0.1",8080);
					getAppletContext().showStatus("�ͻ�����ʼ��");
					//д�ͻ����ݵ�������Socket	
			//		PrintStream	toServer=new PrintStream(clientSocket.getOutputStream());
			//		toServer.println("���͵�����������"+toServerStr);
					ObjectOutputStream toServer;
					toServer=new ObjectOutputStream(clientSocket.getOutputStream());				
					toServer.writeObject((Customer)data);							
					//�ӷ�����Socket��һ���ַ���			      
					BufferedReader fromServer=new BufferedReader
						(new InputStreamReader(clientSocket.getInputStream()));
					String message=fromServer.readLine();
					getAppletContext().showStatus(message);
					//�ر����������
					toServer.close();
					fromServer.close();
				}
				catch(InvalidClassException e)
				{
					fail("�ͻ����쳣!",e);
				}
				catch(NotSerializableException e)
				{
					fail("�ͻ���û�д��л�!",e);
				}
				catch(IOException e)
				{
					fail("����д��������!",e);
				}
			}
		}
	}
}

