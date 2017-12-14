/*
  基础信息配置
*/

//定义相关变量,如果在配置文件中赋值,则在启动页面时,自动显示出来,赋值内容放在引号内
//例如：商户代码规定为1000000，则在MERCHANTID等号的右边的引号内输入1000000既可，刷新页面后，商户代码输入框内显示1000000
//sit虚拟卡测试数据
/*
https://payment.chinapay.com/pay/CcbBack.jsp  生产地址
var MERCHANTID ='105210189990001';              //商户代码  辽宁
var POSID='000000000'; 
var BRANCHID='211000000';



var MERCHANTID ='105110089991035';              //商户代码 一点接入商户
var POSID='000000001'; 
var BRANCHID='110000000';

var MERCHANTID ='288042975';              //上海商户代码
var POSID='000000000'; 
var BRANCHID='310000000';


var MERCHANTID ='105140170110092';              //商户代码 山西分行商户
var POSID='140828008'; 
var BRANCHID='140000000';


生产数据
var MERCHANTID ='105330148162892'
var POSID='000000000'
var BRANCHID='330000000'
*/


//UAT数据－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
/*
var MERCHANTID ='288042975';              //商户代码
var BRANCHID='310000000';                 //分行代码
var POSID='000000000';                    //柜台号
var INTER_FLAG='0';						//接口类型，若为'1'则表示新接口，新接口必需有商户公钥的前30位PUB32
var PUB32='';

//***************************************

var MERCHANTID ='310000001';              //商户代码
var BRANCHID='310000001';                 //分行代码
var POSID='000000000';                    //柜台号
var INTER_FLAG='0';						//接口类型，若为'1'则表示新接口，新接口必需有商户公钥的前30位PUB32
var PUB32='';
//***************************************
var MERCHANTID ='288042975';              //商户代码
var BRANCHID='310000000';                 //分行代码
var POSID='123456789';                    //柜台号
var INTER_FLAG='0';						//接口类型，若为'1'则表示新接口，新接口必需有商户公钥的前30位PUB32
var PUB32='';


var MERCHANTID ='540030013';              //商户代码
var BRANCHID='420000000';                 //分行代码
var POSID='000000000';                    //柜台号
var INTER_FLAG='1';						//接口类型，若为'1'则表示新接口，新接口必需有商户公钥的前30位PUB32
var PUB32='30819c300d06092a864886f70d0101';

*/
//UAT数据－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
/********************************************************


var MERCHANTID ='105140170110092';              //商户代码
var BRANCHID='140000000';                 //分行代码
var POSID='140828009';                    //柜台号
var INTER_FLAG='0';						//接口类型，若为'1'则表示新接口，新接口必需有商户公钥的前30位PUB32
var PUB32='';


/*
var MERCHANTID ='105140153112995';              //商户代码
var BRANCHID='140000000';                 //分行代码
var POSID='000000000';                    //柜台号
var INTER_FLAG='1';						//接口类型，若为'1'则表示新接口，新接口必需有商户公钥的前30位PUB32
var PUB32='30819d300d06092a864886f70d0101';
**********************************************/

var MERCHANTID ='105290045112144';              //上海商户代码
var POSID='100000037'; 
var BRANCHID='310000000';

var PUB32='30819c300d06092a864886f70d0101';
var tem  ='30819c300d06092a864886f70d0101';

//var ORDERID=Math.round(Math.random()*100000)+1;//'001';

var TXCODE='520119';

var AUTHID='';
var REMARK1='';
var REMARK2='';


//var bankURL='http://128.128.96.175:8001/app/ccbMain'; //sit
//var bankURL='http://128.128.96.29:8001/app/ccbMain';  //uat
var bankURL='http://128.128.96.175:8001/app/ccbMain';  //生产

var gongyao='30819c300d06092a864886f70d0101';

//以下内容不要轻易改动
var strMD5;
var URL;
var URL0;//网上银行支付
var URL1;//E付卡支付

function setValue()
{
	
	var objMERCHANTID=document.getElementById("MERCHANTID");
	objMERCHANTID.value=MERCHANTID;
	
	//var objTXCODE=document.getElementById("TXCODE");
	//objTXCODE.value=TXCODE;

	var objPOSID=document.getElementById("POSID");
	objPOSID.value=POSID;
	
	var objBRANCHID=document.getElementById("BRANCHID");
	objBRANCHID.value=BRANCHID;
	
	
	var objREMARK1=document.getElementById("REMARK1");
	objREMARK1.value=REMARK1;
	
	
	var objREMARK2=document.getElementById("REMARK2");
	objREMARK2.value=REMARK2;
	
	
	var objbankURL=document.getElementById("bankURL");
	objbankURL.value=bankURL;
	
   
	//var objEPAYNO=document.getElementById("EPAYNO");
	//objEPAYNO.value=EPAYNO;
	
	var objPUB32=document.getElementById("PUB32");
	objPUB32.value=PUB32;


    document.getElementById("PUB32").value=gongyao;

	//封闭提交按钮
	//window.MD5form.sendB.disabled = true;
	var objsendB=document.getElementById("sendB");
	objsendB.disabled=true;

}

function newRest()
{
   document.MD5form.sendB.disabled =true ;
   document.MD5form.makeMd5.disabled = false;

   document.MD5form.MERCHANTID.value=MERCHANTID;
   document.MD5form.POSID.value=POSID;
   document.MD5form.BRANCHID.value=BRANCHID;
   document.MD5form.REMARK1.value=REMARK1;
	document.MD5form.REMARK2.value=REMARK2;
	document.MD5form.bankURL.value=bankURL;
   //window.MD5form.reset();
}

//https://ibsbjstar.ccb.com.cn/app/ccbMain?MERCHANTID=010419433&POSID=000000000&BRANCHID=110000000&ORDERID=058263341&PAYMENT=16.50&CURCODE=01&TXCODE=520105&REMARK1=&REMARK2=&MAC=bf1449435ccad57f7ba9b080edb873af
function make()
{
	var tmp;
	var tmp0;
	var tmp1;
 
    MERCHANTID=document.getElementById("MERCHANTID").value;

	POSID=document.getElementById("POSID").value;	
	
	BRANCHID=document.getElementById("BRANCHID").value;
  
	TXCODE=document.getElementById("TXCODE").value;
	
	AUTHID=document.getElementById("AUTHID").value;

	REMARK1=document.getElementById("REMARK1").value;
	
	
	REMARK2=document.getElementById("REMARK2").value;
	
	
	bankURL=document.getElementById("bankURL").value;
			
		tmp ='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&AUTHID='+AUTHID+'&TXCODE='+TXCODE+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2;
		temp_New=tmp+'&PUB32='+document.getElementById("PUB32").value;
		document.getElementById('REM1').value=document.getElementById('REMARK1').value;
		document.getElementById('REM2').value=document.getElementById('REMARK2').value;
	

	strMD5=hex_md5(temp_New);
    
	 URL = bankURL+'?CCB_IBSVersion=V5'+'&'+tmp+'&MAC='+strMD5;

    document.getElementById("result").value=URL;

	
	document.getElementById("MAC").value=strMD5;
	

  //打开提交按钮
  
	
	document.getElementById("sendB").disabled=false;

  //封闭MD5生成按钮
    
    document.getElementById("makeMd5").disabled=true;
}

function go( sendUrl)
{
	var objMD5form=document.getElementById("MD5form");
	
	objMD5form.method="post";
 
		objMD5form.action=bankURL+'?CCB_IBSVersion=V5';

	objMD5form.submit();
 	
 

}

