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
var PUB32='30819c300d06092a864886f70d0101';
**********************************************/

var MERCHANTID ='105290045112144';              //上海商户代码
var POSID='100000037'; 
var BRANCHID='310000000';

var INTER_FLAG='0';						//接口类型，若为'1'则表示新接口，新接口必需有商户公钥的前30位PUB32
var PUB32='30819c300d06092a864886f70d0101';
var tem  ='30819c300d06092a864886f70d0101';

//var ORDERID=Math.round(Math.random()*100000)+1;//'001';

var PAYMENT='0.01';
var CURCODE='01';
var TXCODE='520105';

var AUTHID='';
var REMARK1='';
var REMARK2='';
var CLIENTIP='';
var REGINFO='';
var PROINFO='';


//var bankURL='http://128.128.96.175:8001/app/ccbMain'; //sit
//var bankURL='http://128.128.96.29:8001/app/ccbMain';  //uat
var bankURL='https://ibsbjstar.ccb.com.cn/app/ccbMain';  //生产
var EPAY_NO='';//E付卡卡号
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
	
	
	var objPOSID=document.getElementById("POSID");
	objPOSID.value=POSID;
	
	
	
	
	var objBRANCHID=document.getElementById("BRANCHID");
	objBRANCHID.value=BRANCHID;	
	
	
	var objPAYMENT=document.getElementById("PAYMENT");
	objPAYMENT.value=PAYMENT;

	var index=document.getElementById("INTER_FLAG").value;
	if (index=='2')
	{
		var objLIMIT=document.getElementById("LIMIT");
		objLIMIT.value=LIMIT;
	}
	
	
	var objCURCODE=document.getElementById("CURCODE");
	objCURCODE.value=CURCODE;
	
	
	var objTXCODE=document.getElementById("TXCODE");
	objTXCODE.value=TXCODE;

	
	
	
	var objREMARK1=document.getElementById("REMARK1");
	objREMARK1.value=REMARK1;
	
	
	var objREMARK2=document.getElementById("REMARK2");
	objREMARK2.value=REMARK2;
	
	var objCLIENTIP=document.getElementById("CLIENTIP");
	objCLIENTIP.value=CLIENTIP;

	var objREGINFO=document.getElementById("REGINFO");
	objREGINFO.value=REGINFO;

	var objPROINFO=document.getElementById("PROINFO");
	objPROINFO.value=PROINFO;
	
	var objbankURL=document.getElementById("bankURL");
	objbankURL.value=bankURL;
	
   
	//var objEPAYNO=document.getElementById("EPAYNO");
	//objEPAYNO.value=EPAYNO;
	
	var objPUB32=document.getElementById("PUB32");
	objPUB32.value=PUB32;


    document.getElementById("PUB32").value=gongyao;

	document.getElementById("INTER_FLAG").value=INTER_FLAG;;
	//封闭提交按钮
	//window.MD5form.sendB.disabled = true;
	var objsendB=document.getElementById("sendB");
	objsendB.disabled=true;

}

//https://ibsbjstar.ccb.com.cn/app/ccbMain?MERCHANTID=010419433&POSID=000000000&BRANCHID=110000000&ORDERID=058263341&PAYMENT=16.50&CURCODE=01&TXCODE=520105&REMARK1=&REMARK2=&MAC=bf1449435ccad57f7ba9b080edb873af

function asc(s)
{
execScript('c = Asc("'+s+'")','vbscript');
return c;
}

function hex(n)
{   
execScript('c = Hex("'+n+'")','vbscript');
return c;
}

function UrlEncode(str)
{
	var string = "";
	var strSpecial="!\"#$%&'()*+,/:;<=>?[]^`{|}~%";
	var s="";
	var c= "";
	var high = "";
	var low = "";
	for(var i = 0; i < str.length; i++)
	{
		var chr=str.charAt(i);
		c = asc(chr);
		if(Math.abs(c) < 0xFF)
		{
			if(chr==" ") 
				string +="+"; 
			else if(strSpecial.indexOf(chr)!=-1) 
				string +="%"+c.toString(16);
			 else
				string += chr;
		}
		else
		{
		   if(c < 0) c += 0x10000;
		   high = ((c & 0xFF00) >> 8) & 0x00FF;
		   low = c & 0xFF;
		   string += "%" + hex(high) + "%" + hex(low);
		}
	}
	string=string.replace(new RegExp("\\+","gm")," ");
	return string;
}

function make()
{
	var tmp;
	var tmp0;
	var tmp1;
 
document.getElementById("sendB").disabled=false;

  MERCHANTID=document.getElementById("MERCHANTID").value;
  
	
	POSID=document.getElementById("POSID").value;
	
	
	BRANCHID=document.getElementById("BRANCHID").value;
	
	
	//ORDERID=document.getElementById("ORDERID").value;
	
	
	PAYMENT=document.getElementById("PAYMENT").value;

	LIMIT=document.getElementById("LIMIT").value;
	
	CURCODE=document.getElementById("CURCODE").value;
	
	
	TXCODE=document.getElementById("TXCODE").value;
	
	AUTHID=document.getElementById("AUTHID").value;

	REMARK1=document.getElementById("REMARK1").value;
	
	
	REMARK2=document.getElementById("REMARK2").value;

	CLIENTIP=document.getElementById("CLIENTIP").value;

	REGINFO=document.getElementById("REGINFO").value;

	PROINFO=document.getElementById("PROINFO").value;
	
	
	bankURL=document.getElementById("bankURL").value;
	

	UName=document.getElementById("UName").value;
	//UName="%C1%F5%B5%C2%BB%AA";

    //转换成16进字
    UName=UrlEncode(UName);

	IdType=document.getElementById("IdType").value;
	IdNumber=document.getElementById("IdNumber").value;

	EPAYNO=document.getElementById("EPAYNO").value;
	OTHER1=document.getElementById("OTHER1").value;

	CLIENTIP=document.getElementById("CLIENTIP").value;
    
	tmp ='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&PAYMENT='+PAYMENT+'&CURCODE='+CURCODE+'&TXCODE='+TXCODE+'&UName='+UName+'&IdType='+IdType+'&IdNumber='+IdNumber+'&EPAYNO='+EPAYNO+'&OTHER1='+OTHER1+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2;
	tmp0='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&PAYMENT='+PAYMENT+'&CURCODE='+CURCODE+'&TXCODE=520105'+'&UName='+UName+'&IdType='+IdType+'&IdNumber='+IdNumber+'&EPAYNO='+EPAYNO+'&OTHER1='+OTHER1+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2;
	tmp1='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&PAYMENT='+PAYMENT+'&CURCODE='+CURCODE+'&TXCODE=NE4100'+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2+'&UName='+UName+'&IdType='+IdType+'&IdNumber='+IdNumber+'&EPAYNO=' +EPAYNO;
	index=document.getElementById("INTER_FLAG").value;
	temp_New=tmp;
	//alert("接口类型为："+index+"  (1为新接口类型，其他为旧接口类型)");
	if(index=="0"){
		tmp ='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&AUTHID='+AUTHID+'&PAYMENT='+PAYMENT+'&CURCODE='+CURCODE+'&TXCODE='+TXCODE+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2;
		temp_New=tmp+'&PUB32='+document.getElementById("PUB32").value;
		document.getElementById('REM1').value=document.getElementById('REMARK1').value;
		document.getElementById('REM2').value=document.getElementById('REMARK2').value;
	}
	else if(index=='1'){		
		tmp ='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&AUTHID='+AUTHID+'&PAYMENT='+PAYMENT+'&CURCODE='+CURCODE+'&TXCODE='+TXCODE+'&UName='+UName+'&IdType='+IdType+'&IdNumber='+IdNumber+'&EPAYNO='+EPAYNO+'&OTHER1='+OTHER1+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2;
		temp_New=tmp+'&PUB32='+document.getElementById("PUB32").value;
		document.getElementById('REM1').value=document.getElementById('REMARK1').value;
		document.getElementById('REM2').value=document.getElementById('REMARK2').value;
	}else if (index=='2')
	{
		tmp ='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&AUTHID='+AUTHID+'&PAYMENT='+PAYMENT+'&LIMIT='+LIMIT+'&CURCODE='+CURCODE+'&TXCODE='+TXCODE+'&UName='+UName+'&IdType='+IdType+'&IdNumber='+IdNumber+'&EPAYNO='+EPAYNO+'&OTHER1='+OTHER1+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2;
		temp_New=tmp+'&PUB32='+document.getElementById("PUB32").value;
		document.getElementById('REM1').value=document.getElementById('REMARK1').value;
		document.getElementById('REM2').value=document.getElementById('REMARK2').value;
	}else if (index=='3'){
		tmp ='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&AUTHID='+AUTHID+'&PAYMENT='+PAYMENT+'&LIMIT='+LIMIT+'&CURCODE='+CURCODE+'&TXCODE='+TXCODE+'&UName='+UName+'&IdType='+IdType+'&IdNumber='+IdNumber+'&EPAYNO='+EPAYNO+'&OTHER1='+OTHER1+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2+'&CLIENTIP='+CLIENTIP+'&REGINFO='+REGINFO+'&PROINFO='+PROINFO;
		//tmp ='MERCHANTID='+MERCHANTID+'&POSID='+POSID+'&BRANCHID='+BRANCHID+'&AUTHID='+AUTHID+'&PAYMENT='+PAYMENT+'&LIMIT='+LIMIT+'&CURCODE='+CURCODE+'&TXCODE='+TXCODE+'&REMARK1='+REMARK1+'&REMARK2='+REMARK2+'&CLIENTIP='+CLIENTIP+'&REGINFO='+REGINFO+'&PROINFO='+PROINFO;
		
		temp_New=tmp+'&PUB32='+document.getElementById("PUB32").value;
		
		document.getElementById('REM1').value=document.getElementById('REMARK1').value;
		document.getElementById('REM2').value=document.getElementById('REMARK2').value;
	}
	

	strMD5=hex_md5(temp_New);

    URL = bankURL+'?CCB_IBSVersion=V5'+'&'+tmp+'&MAC='+strMD5;
	URL0 = bankURL+'?CCB_IBSVersion=V5'+'&'+tmp0+'&MAC='+hex_md5(tmp0);
	URL1 = bankURL+'?CCB_IBSVersion=V5'+'&'+tmp1+'&MAC='+hex_md5(tmp1);

    
    document.getElementById("result").value=URL;

	
	document.getElementById("MAC").value=strMD5;
	
	
	document.getElementById("URL01").value=URL0+'||'+URL1;

  //打开提交按钮
  
	
	document.getElementById("sendB").disabled=false;

  //封闭MD5生成按钮
    
    document.getElementById("makeMd5").disabled=true;

	//重新赋值
	REGINFO=document.getElementById("REGINFO").value;

	PROINFO=document.getElementById("PROINFO").value;

	UName=document.getElementById("UName").value;
}

function go( sendUrl)
{
	var objMD5form=document.getElementById("MD5form");
	
	objMD5form.method="post";
    var index=document.getElementById("INTER_FLAG").value;
 	if(index==2)
		objMD5form.action=bankURL+'?CCB_IBSVersion=V5';
 	else
		objMD5form.action=bankURL+'?CCB_IBSVersion=V5';
	objMD5form.submit();
}

function newRest()
{
   window.MD5form.sendB.disabled =true ;
   window.MD5form.makeMd5.disabled = false;

   window.MD5form.MERCHANTID.value=MERCHANTID;
   window.MD5form.POSID.value=POSID;
   window.MD5form.BRANCHID.value=BRANCHID;
   //window.MD5form.ORDERID.value=ORDERID;
   window.MD5form.PAYMENT.value=PAYMENT;
   window.MD5form.CURCODE.value=CURCODE;
	//window.MD5form.TXCODE.value=TXCODE;
	//window.MD5form.REMARK1.value=REMARK1;
	window.MD5form.REMARK1.value=REMARK1;
	window.MD5form.REMARK2.value=REMARK2;
	window.MD5form.CLIENTIP.value=CLIENTIP;
	window.MD5form.REGINFO.value=REGINFO;
	window.MD5form.PROINFO.value=PROINFO;
	window.MD5form.bankURL.value=bankURL;
   //window.MD5form.reset();
}

function DOTYPE_onclick()
{
var index=document.getElementById('INTER_FLAG').selectedIndex;
var value=document.getElementById('INTER_FLAG').options[index].value;
if (value==1)
{
document.getElementById("a0").style.display='none';
document.getElementById("a1").style.display='';
document.getElementById("a2").style.display='';
document.getElementById("a3").style.display='';
document.getElementById("a4").style.display='';
document.getElementById("a5").style.display='';
document.getElementById("a6").style.display='none';
document.getElementById("CLIENTIP").disabled=true;
document.getElementById("a7").style.display='none';
document.getElementById("REGINFO").disabled=true;
document.getElementById("a8").style.display='none';
document.getElementById("PROINFO").disabled=true;
window.MD5form.sendB.disabled =true ;
window.MD5form.makeMd5.disabled = false;
//window.document.MD5form.EPAY_NO.value="";
//window.document.all.epay.style.display="";
//document.getElementById("TXCODE").value="520105";

}else if(value==2){
	document.getElementById("a0").style.display='';	
	document.getElementById("a1").style.display='';
	document.getElementById("a2").style.display='';
	document.getElementById("a3").style.display='';
	document.getElementById("a4").style.display='';
	document.getElementById("a5").style.display='';
	document.getElementById("a6").style.display='none';
	document.getElementById("LIMIT").value='0.02';
	document.getElementById("CLIENTIP").disabled=true;
	document.getElementById("a7").style.display='none';
	document.getElementById("REGINFO").disabled=true;
	document.getElementById("a8").style.display='none';
	document.getElementById("PROINFO").disabled=true;
	window.MD5form.sendB.disabled =true ;
	window.MD5form.makeMd5.disabled = false;
}else if(value==3){
	document.getElementById("a0").style.display='';	
	document.getElementById("a1").style.display='';
	document.getElementById("a2").style.display='';
	document.getElementById("a3").style.display='';
	document.getElementById("a4").style.display='';
	document.getElementById("a5").style.display='';
	document.getElementById("a6").style.display='';
	document.getElementById("LIMIT").value='0.02';
	document.getElementById("CLIENTIP").disabled=false;
	document.getElementById("a7").style.display='';
	document.getElementById("REGINFO").disabled=false;
	document.getElementById("a8").style.display='';
	document.getElementById("PROINFO").disabled=false;
	window.MD5form.sendB.disabled =true ;
	window.MD5form.makeMd5.disabled = false;
}
else {
document.getElementById("a0").style.display='none';
document.getElementById("a1").style.display='none';
document.getElementById("a2").style.display='none';
document.getElementById("a3").style.display='none';
document.getElementById("a4").style.display='none';
document.getElementById("a5").style.display='none';
document.getElementById("a6").style.display='none';
document.getElementById("CLIENTIP").disabled=true;
document.getElementById("a7").style.display='none';
document.getElementById("REGINFO").disabled=true;
document.getElementById("a8").style.display='none';
document.getElementById("PROINFO").disabled=true;
window.MD5form.sendB.disabled =true ;
window.MD5form.makeMd5.disabled = false;
}


}