function switchgoods(){
	//a 对象
	var oAcn=document.getElementById("aCn");
	var oAUsa=document.getElementById("aUsa");
	var oAHg=document.getElementById("aHg");
	var oAJp=document.getElementById("aJp");
	// li对象
	var oliCN=document.getElementById("liCN");
	var oliUSA=document.getElementById("liUSA");
	var oliHG=document.getElementById("liHG");
	var oliJP=document.getElementById("liJP");
	 //---上面是连接对象 下面是 Div对象---
	var oOuMei=document.getElementById("oumei");
	var oCn=document.getElementById("cn");
	var oHg=document.getElementById("hgdiv");
	var oJp=document.getElementById("jpdiv");
	 //添加响应事件
	 oAcn.onclick=function(){
	 	oCn.style.display="block";
	 	/*
	 	oCn.style.height="30px";
	 	oCn.style.color="white";
	 	oliCN.style.background="black";
	 	oliCN.style.height="30px";
	 	*/
	 	oOuMei.style.display="none";
	 	oHg.style.display="none";
	 	oJp.style.display="none";
	 }
	 oAUsa.onclick=function(){
	 	oCn.style.display="none";
	 	oOuMei.style.display="block";
	 	oHg.style.display="none";
	 	oJp.style.display="none";
	 }
	 oAHg.onclick=function(){
	 	oCn.style.display="none";
	 	oOuMei.style.display="none";
	 	oHg.style.display="block";
	 	oJp.style.display="none";
	 }
	 oAJp.onclick=function(){
	 	oCn.style.display="none";
	 	oOuMei.style.display="none";
	 	oHg.style.display="none";
	 	oJp.style.display="block";
	 }
	 document.getElementById("region").onmouseover=function(){
		document.getElementById("region").style.background="white";
	 }
}
