<%'###########################################################'%>
<%'#             　　      SocketClient                      #'%>
<%'###########################################################'%>
	
<%	
class SocketClient
public socket
public err_msg
public err_code

'---------------------------------
'	通过tcp连接通信
'---------------------------------
function exeSign(IPAddr,port,signStr)
on error resume next
dim signRetVal
Set socket = CreateObject("ASPSocket.MySocket")
	socket.Create 
	socket.Connect IPAddr,port		
	socket.SendTimeOut = 10000
	socket.RecvTimeOut = 10000
	
	socket.Send signStr&vbcrlf   '在发送报文尾部添加换行符后，发送报文

	signRetVal=socket.Receive(2048)  '接收回应报文
	
	socket.Close
	
	exeSign=signRetVal
    err_code=0
end function

end class
%>