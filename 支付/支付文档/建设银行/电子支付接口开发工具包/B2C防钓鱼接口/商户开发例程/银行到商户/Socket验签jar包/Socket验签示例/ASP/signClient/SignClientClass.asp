<%'###########################################################'%>
<%'#             ����      SocketClient                      #'%>
<%'###########################################################'%>
	
<%	
class SocketClient
public socket
public err_msg
public err_code

'---------------------------------
'	ͨ��tcp����ͨ��
'---------------------------------
function exeSign(IPAddr,port,signStr)
on error resume next
dim signRetVal
Set socket = CreateObject("ASPSocket.MySocket")
	socket.Create 
	socket.Connect IPAddr,port		
	socket.SendTimeOut = 10000
	socket.RecvTimeOut = 10000
	
	socket.Send signStr&vbcrlf   '�ڷ��ͱ���β����ӻ��з��󣬷��ͱ���

	signRetVal=socket.Receive(2048)  '���ջ�Ӧ����
	
	socket.Close
	
	exeSign=signRetVal
    err_code=0
end function

end class
%>