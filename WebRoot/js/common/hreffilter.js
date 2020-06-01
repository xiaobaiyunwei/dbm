$().ready(function() {
	setA();
});
function setA()
{
	//声明一个变量ahrefstr
	var ahrefstr="";
	//先得到ID为"ahref"的div中每个A标签（会是一个数组）
	var myahref=document.getElementsByTagName('a');	
	//循环得到每个a的href
	for(i=0;i<myahref.length;i++)
	{  
		//将得到的每一个ahref追加到全局变量ahrefstr中  
		ahrefstr=myahref[i].href;
		if(ahrefstr.indexOf("www.chinatet.com") < 0 
		&& ahrefstr.indexOf("www.chinaacc.com") < 0  
		&& ahrefstr.indexOf("www.med66.com") < 0  
		&& ahrefstr.indexOf("www.jianshe99.com") < 0  
		&& ahrefstr.indexOf("www.chinalawedu.com") < 0  
		&& ahrefstr.indexOf("www.chinatat.com") < 0  
		&& ahrefstr.indexOf("www.g12e.com") < 0  
		&& ahrefstr.indexOf("www.zikao365.com") < 0  
		&& ahrefstr.indexOf("www.chengkao365.com") < 0  
		&& ahrefstr.indexOf("www.cnedu.cn") < 0  
		&& ahrefstr.indexOf("www.for68.com") < 0  
		&& (ahrefstr.indexOf("http://")>=0  || ahrefstr.indexOf("www.")>=0)
		) 
		{ 
			myahref[i].href="javascript:void(0)";
			myahref[i].target="";
		}
	}
}