/*
  ������Ϣ����
*/

//������ر���,����������ļ��и�ֵ,��������ҳ��ʱ,�Զ���ʾ����,��ֵ���ݷ���������
//���磺�̻�����涨Ϊ1000000������MERCHANTID�Ⱥŵ��ұߵ�����������1000000�ȿɣ�ˢ��ҳ����̻��������������ʾ1000000


var MERCHANTID ='105290045112144';              //�̻�����

var BRANCHID='310000000';                 //���д���
var POSID='100000037';                    //��̨��
var ORDERDATE='';                  //��������
var BEGORDERTIME='00:00:00';
var ENDORDERTIME='23:59:59';
//var BEGORDERID='';
//var ENDORDERID='';
var ORDERID='';
var QUPWD='111111';
var TXCODE='410408';
var TYPE='0';
var KIND='0';
var STATUS='1';
var SEL_TYPE='1';
var PAGE='1';
var bankURL='https://ibsbjstar.ccb.com.cn/app/ccbMain';
var OPERATOR="";
var CHANNEL="";


//�������ݲ�Ҫ���׸Ķ�
var strMD5;
var URL;
function setValue()
{
	window.MD5form.MERCHANTID.value=MERCHANTID;
	window.MD5form.BRANCHID.value=BRANCHID;
	window.MD5form.POSID.value=POSID;
	window.MD5form.ORDERDATE.value=ORDERDATE;
	window.MD5form.BEGORDERTIME.value=BEGORDERTIME;
	window.MD5form.ENDORDERTIME.value=ENDORDERTIME;
	//window.MD5form.BEGORDERID.value=BEGORDERID;
	//window.MD5form.ENDORDERID.value=ENDORDERID;
	window.MD5form.ORDERID.value=ORDERID;
	window.MD5form.QUPWD.value=QUPWD;
	window.MD5form.TXCODE.value=TXCODE;
	window.MD5form.TYPE.value=TYPE;
	window.MD5form.KIND.value=KIND;
	window.MD5form.STATUS.value=STATUS;
	window.MD5form.SEL_TYPE.value=SEL_TYPE;
	window.MD5form.bankURL.value=bankURL;
	window.MD5form.OPERATOR.value=OPERATOR;
	window.MD5form.PAGE.value=PAGE;
	window.MD5form.CHANNEL.value=CHANNEL;
	//����ύ��ť
	window.MD5form.sendB.disabled = true;

}

//https://ibsbjstar.ccb.com.cn/app/ccbMain?MERCHANTID=010419433&POSID=000000000&BRANCHID=110000000&ORDERID=058263341&PAYMENT=16.50&CURCODE=01&TXCODE=520100&REMARK1=&REMARK2=&MAC=bf1449435ccad57f7ba9b080edb873af
function make()
{
	var tmp;
	MERCHANTID=window.MD5form.MERCHANTID.value;
	BRANCHID=window.MD5form.BRANCHID.value;
	POSID=window.MD5form.POSID.value;
	ORDERDATE=window.MD5form.ORDERDATE.value;
	BEGORDERTIME=window.MD5form.BEGORDERTIME.value;
	ENDORDERTIME=window.MD5form.ENDORDERTIME.value;
	//BEGORDERID=window.MD5form.BEGORDERID.value;
	//ENDORDERID=window.MD5form.ENDORDERID.value;
	ORDERID=window.MD5form.ORDERID.value;
	QUPWD=window.MD5form.QUPWD.value;
	TXCODE=window.MD5form.TXCODE.value;
	TYPE=window.MD5form.TYPE.value;
	KIND=window.MD5form.KIND.value;
	STATUS=window.MD5form.STATUS.value;
	SEL_TYPE=window.MD5form.SEL_TYPE.value;
	bankURL=window.MD5form.bankURL.value;
	OPERATOR=window.MD5form.OPERATOR.value;
	PAGE=window.MD5form.PAGE.value;
	CHANNEL=window.MD5form.CHANNEL.value;
	
    tmp ='MERCHANTID='+MERCHANTID+'&BRANCHID='+BRANCHID+'&POSID='+POSID+'&ORDERDATE='+ORDERDATE+'&BEGORDERTIME='+BEGORDERTIME+'&ENDORDERTIME='+ENDORDERTIME+'&ORDERID='+ORDERID+'&QUPWD=&TXCODE='+TXCODE+'&TYPE='+TYPE+'&KIND='+KIND+'&STATUS='+STATUS+'&SEL_TYPE='+SEL_TYPE+'&PAGE='+PAGE+'&OPERATOR='+OPERATOR+'&CHANNEL='+CHANNEL;
	strMD5=hex_md5(tmp);

    URL = bankURL+'?'+tmp+'&MAC='+strMD5;
    window.MD5form.MAC.value=strMD5;
    window.MD5form.result.value=URL;
   

  //���ύ��ť
  
	window.MD5form.sendB.disabled = false;

  //���MD5���ɰ�ť
    window.MD5form.makeMd5.disabled = true;
}

function go( sendUrl)
{
   //window.open(sendUrl,"result");
   var i=0;
   var nTest=1;
   for( i=0;i<nTest;i++ ){
   	window.MD5form.method="post";
   	window.MD5form.action=window.MD5form.bankURL.value;
   	window.MD5form.submit();
   
  }
  return false;
}

function newRest()
{
   window.MD5form.sendB.disabled =true ;
   window.MD5form.makeMd5.disabled = false;
	window.MD5form.MERCHANTID.value=MERCHANTID;
	window.MD5form.BRANCHID.value=BRANCHID;
	window.MD5form.POSID.value=POSID;
	window.MD5form.ORDERDATE.value=ORDERDATE;
	window.MD5form.BEGORDERTIME.value=BEGORDERTIME;
	window.MD5form.ENDORDERTIME.value=ENDORDERTIME;
	//window.MD5form.BEGORDERID.value=BEGORDERID;
	//window.MD5form.ENDORDERID.value=ENDORDERID;
	window.MD5form.ORDERID.value=ORDERID;
	window.MD5form.QUPWD.value=QUPWD;
	window.MD5form.TXCODE.value=TXCODE;
	window.MD5form.TYPE.value=TYPE;
	window.MD5form.KIND.value=KIND;
	window.MD5form.STATUS.value=STATUS;
	window.MD5form.SEL_TYPE.value=SEL_TYPE;
	window.MD5form.bankURL.value=bankURL;
	window.MD5form.OPERATOR.value=OPERATOR;
	window.MD5form.PAGE.value=PAGE;
	window.MD5form.CHANNEL.value=CHANNEL;
	window.MD5form.result.value='';
   //window.MD5form.reset();
}
