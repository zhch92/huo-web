<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>个人信息-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/info.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/style.css">
       <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
         <script type="text/javascript" src="http://192.168.2.50:8089/static/js/jquery.form.js"></script>
         <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?39f1eef3f577e574e809dcb29d873fd2";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
         
      <style type="text/css">
.file{
                    opacity: 0;
                    filter:Alpha(opacity=0);
                }
      </style>   
        
</head>

<body>
<#include "common/head.ftl"/>
    <div class="content">
        <div class="logo">
            <a href="/index.htm"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
        </div> 
        <div class="main">
            <h3>设置</h3>
            <p class="title">我的货车</p>
            <div class="info">
                <ul class="car_info clearfix">
                    <li class="li_1">
                        <div class="img img_1"></div>
                        <input type="radio" name="cartype" onClick="ontype('7');" value="7">箱式车
                    </li>
                    <li class="li_1">
                        <div class="img img_2"></div>
                        <input type="radio" name="cartype" onClick="ontype('11');"  value="11">高栏车
                    </li>
                    <li class="li_1">
                        <div class="img img_3"></div>
                        <input type="radio" name="cartype" onClick="ontype('1');"  value="1">平板车
                    </li>
                    <li class="li_1">
                        <div class="img img_4"></div>
                        <input type="radio" name="cartype" onClick="ontype('0');"  value="0">其它
                    </li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  onClick="onlong('1');" value="1">9.6 m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  onClick="onlong('2');" value="2">&nbsp12 m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  onClick="onlong('3');" value="3">17.5m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  onClick="onlong('0');" value="0">其它</li>
                </ul>
                <div class="table">
                    <ul class="clearfix">
                        <li>车牌
                            <input type="text" id="carnum" name="carnum" value="${driver.carNumber}">
                        </li>
                        <li class="mar_l">手机
                            <input type="text" id="mobile" name="mobile" value="${driver.mobile}" readonly="readonly">
                        </li>
                        <li>姓名
                            <input type="text" id="name" name="name" value="${driver.driverName}">
                        </li>
                        <a href="/updatepwd.htm">修改密码</a>
                    </ul>
                </div>
                <h4>我的认证</h4>
                <div class="text">
                    <p>上传方式： 1、 打开“货管家”app, 进入“我的信息”“上传证件照”.</p>
                    <p class="number">2,“点击上传 ”找到电脑中的相关证件照片 。</p>
                </div>
                <div class="paper">
                    <ul class="clearfix">
                        <li>
                          <form id="sfzform"  action="/ajax/uploadSfzImg.htm"  method="post" enctype="multipart/form-data" target="if">
													<#if driver.sfzsfrz == 10>
													<p>已认证</p>
													<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_2.png" alt=""></p>
													<#elseif driver.sfzsfrz == 1>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="sfzclick();">点击重新上传
													  <p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_1.png" alt=""></p>
													</a></p>
													 <p> 身份证 </p>
													  <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
													<#elseif driver.sfzsfrz == 2>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="sfzclick();">点击重新上传
													 <p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_1.png" alt=""></p>
													</a></p>
													<p> 身份证 </p>
													 <p style="position: relative;top: 15px;color:#6f6f6f">审核未通过</p>
													<#else>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="sfzclick();">点击上传
													 <p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_1.png" alt=""></p>
													</a></p>
													<p> 身份证 </p>
													</#if>												
                              <input type="file" class="file" name="sfzfile" id="sfzImgSelect" style="display: none;"/>
		                      <input type="hidden" name="sfzid" id="driverId" value="${driver.id}"/>
                      </form>
                        <div class="loading" id="sfzloading"><img alt="" src="http://192.168.2.50:8089/statics/images/loading.gif"></div>
                        </li>
                      
                        <li>
                          <form id="jszform"  action="/ajax/uploadJszImg.htm"  method="post" enctype="multipart/form-data" target="if">
													<#if driver.jszsfrz == 10>
														<p>已认证</p>
														<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_2.png" alt=""></p>
													<#elseif driver.jszsfrz == 1>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="jszclick();">点击重新上传
													<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_2.png" alt=""></p>
													</a></p>
													 <p>驾驶证</p>
													  <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
													<#elseif driver.jszsfrz == 2>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="jszclick();">点击重新上传
													<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_2.png" alt=""></p>
													</a></p>
													 <p>驾驶证</p>
												    <p style="position: relative;top: 15px;color:#6f6f6f">审核未通过</p>
													<#else>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="jszclick();">点击上传
													<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_2.png" alt=""></p>
													</a></p>
													 <p>驾驶证</p>
													</#if>
                            	<input type="file" name="jszfile" id="jszImgSelect" class="file" style="display: none;">
								<input type="hidden" name="sfzid" id="driverId" value="${driver.id}"/>
						</form>
						 <div class="loading" id="jszloading"><img alt="" src="http://192.168.2.50:8089/statics/images/loading.gif"></div>
                        </li>
                        <li>
                          <form id="xszform"  action="/ajax/uploadXszImg.htm"  method="post" enctype="multipart/form-data" target="if">
													<#if driver.xszsfrz == 10>
													<p>已认证</p>
													<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_2.png" alt=""></p>
													<#elseif driver.xszsfrz == 1>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="xszclick();">点击重新上传
													 <p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_3.png" alt=""></p>
													</a></p>
													 <p>行驶证</p>
													 <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
													<#elseif driver.xszsfrz == 2>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="xszclick();">点击重新上传
													<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_3.png" alt=""></p>
													</a></p>
													 <p>行驶证</p>
													 <p style="position: relative;top: 15px;color:#6f6f6f">审核未通过</p>
													<#else>
											    	<p><a style="position: relative;" href="javascript:void(0)" onClick="xszclick();">点击上传
											    	<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_3.png" alt=""></p>
													</a></p>
													 <p>行驶证</p>
													</#if>
                            <input type="file" name="xszfile" id="xszImgSelect" class="file" style="display: none;">
							<input type="hidden" name="sfzid" id="driverId" value="${driver.id}"/>
						</form>
						 <div class="loading" id="xszloading"><img alt="" src="http://192.168.2.50:8089/statics/images/loading.gif"></div>
                        </li>
                    </ul>
                    <p class="bttn">
                        <button class="cancel" onclick="returnperson();">返回</button>
                        <button class="sure" id="checkfr" onclick="checkfrom();">确定</button>
                    </p>
                    
                </div>
            </div>
        </div>
    </div>
    <div class="footer" style="margin-top:0;">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 蜀ICP备15006511号-1</p>
        </div>
    </div>
    <script type="text/javascript">
    var tempname='${driver.driverName}';
    var temptype='${driver.carType}';
    var templength='${driver.carLength}';
    var tempphone='${driver.mobile}';
    var tempcarnum='${driver.carNumber}';
    
    function sfzclick(){
    	document.getElementById("sfzImgSelect").click(); 
    }
    function jszclick(){
    	document.getElementById("jszImgSelect").click(); 
    }
    function xszclick(){
    	document.getElementById("xszImgSelect").click(); 
    }
    
    $(document).ready(function () {
    	
    	if('${driver.sfzsfrz}'!==10){
    		$('#carnum').val();
    		$('#mobile').val();
    		$('#name').val();
    	}
    	
    	var imgLock = true;	
    	  $('#sfzImgSelect,#xszImgSelect,#jszImgSelect').bind("click",function(e){
    		  	if (!imgLock) {
    		  		var event = window.event || e;
    		  		event.preventDefault();
    		  	}
    	  });
    			  $('#sfzImgSelect').change(function(){
    			  	  if (imgLock && $(this).val() != "") {
    			  	  	imgLock = false;
    			  	  $("#sfzloading").show();
    					$("#sfzform").ajaxSubmit({  
    			            url:"/ajax/uploadSfzImg.htm",  
    			            type:"post",  
    			            enctype:'multipart/form-data',  
    			            dataType:'json',
    			            success:function(data) { 
    			            	if (data.flag == 1) {
    			            		$("#sfzloading").hide();
    			            		alert("上传成功");
    			            		 window.location.href="/driver/getDriverInfo.htm";
    				            	var path = data.msg;
    			            	}else if(data.flag == -2){
    			            		$("#sfzloading").hide();
    			            		alert("上传失败,格式错误或大小超过2M！");
    			            	} else {
    			            		$("#sfzloading").hide();
    			            		alert("上传失败");
    			            	}
    			            	imgLock = true;
    			            },error:function(data) {  
    			            	$("#sfzloading").hide();
    			            	alert("系统或网络出错!");
    			                 imgLock = true;
    			            }  
    			        });  
    		        }
    			  });
    			  $('#jszImgSelect').change(function(){
    			  	  if (imgLock && $(this).val() != "") {
    			  	  	imgLock = false;
    			  	  $("#jszloading").show();
    					$("#jszform").ajaxSubmit({  
    			            url:"/ajax/uploadJszImg.htm",  
    			            type:"post",  
    			            enctype:'multipart/form-data',  
    			            dataType:'json',
    			            success:function(data) { 
    			            	if (data.flag == 1) {
    			            		$("#jszloading").hide();
    			            		alert("上传成功");
    			            		 window.location.href="/driver/getDriverInfo.htm";
    				            	var path = data.msg;
    			            	}else if(data.flag == -2){
    			            		$("#jszloading").hide();
    			            		alert("上传失败,格式错误或大小超过2M！");
    			            	}  else {
    			            		$("#jszloading").hide();
    			            		alert("上传失败");
    			            	}
    			                imgLock = true;
    			            },error:function(data) {  
    			            	$("#jszloading").hide();
    			            	alert("系统或网络出错!"); 
    			               imgLock = true;
    			            }  
    			        });
    		        }
    			  });
    			  $('#xszImgSelect').change(function(){
    			  	  if (imgLock && $(this).val() != "") {
    			        imgLock = false;
    			        $("#xszloading").show();
    					$("#xszform").ajaxSubmit({  
    			            url:"/ajax/uploadXszImg.htm",  
    			            type:"post",  
    			            enctype:'multipart/form-data',  
    			            dataType:'json',
    			            success:function(data) { 
    			            	if (data.flag == 1) {
    			            		$("#xszloading").hide();
    			            		alert("上传成功");
    			            		 window.location.href="/driver/getDriverInfo.htm";
    				            	var path = data.msg;
    			            	} else if(data.flag == -2){
    			            		$("#xszloading").hide();
    			            		alert("上传失败,格式错误或大小超过2M！","提示",{fontSize:18});
    			            	} else {
    			            		$("#xszloading").hide();
    			            		alert("上传失败","提示",{fontSize:18});
    			            	}
    			                imgLock = true;
    			            },error:function(data) { 
    			            	$("#xszloading").hide();
    			            	alert("系统或网络出错!","错误");   
    			                imgLock = true;
    			            }  
    			        });			 
    		        }
    			  });
    			  
    	
    	
    	$("#checkfr").attr("disabled", true);
    	
    	 $("#name").bind("keyup",function(){
  		   if($("#name").val()==tempname){
  			$("#checkfr").attr("disabled", true);
  		   }else{
  			 $("#checkfr").removeAttr("disabled");
  		   }
    	 });
    	 $("#mobile").bind("keyup",function(){
    		   if($("#mobile").val()==tempname){
    			$("#checkfr").attr("disabled", true);
    		   }else{
    			 $("#checkfr").removeAttr("disabled");
    		   }
      	 });
    	 $("#carnum").bind("keyup",function(){
    		   if($("#carnum").val()==tempname){
    			$("#checkfr").attr("disabled", true);
    		   }else{
    			 $("#checkfr").removeAttr("disabled");
    		   }
      	 });
    	 
      //车长
 	   var checkzone = document.all("car_long");
	      for(var i=0;i<checkzone.length;i++){  
	         if(checkzone[i].value=='${driver.carLength}'){  
	        	 checkzone[i].checked=true;
	             break;
	       }
	    }
	  //车形
	  var checkzone = document.all("cartype");
		 for(var i=0;i<checkzone.length;i++){  
		    if(checkzone[i].value=='${driver.carType}'){  
		        checkzone[i].checked=true;
		        break;
		       }
		    }  
   
        });
    
    function boxdivs(val){
    	if(val==="1"){
    		$("#sfzrzboxdiv").show();
    	}else if(val==="2"){
    		$("#jszrzboxdiv").show();
    	}else if(val==="3"){
    		$("#xszrzboxdiv").show();
    	}
    }
    function boxdivhide(val){
    	if(val==="1"){
    		$("#sfzrzboxdiv").hide();
    	}else if(val==="2"){
    		$("#jszrzboxdiv").hide();
    	}else if(val==="3"){
    		$("#xszrzboxdiv").hide();
    	}
    }
    
    function ontype(val){
		 if(val===temptype){
			 $("#checkfr").attr("disabled", true); 
		 }else{
			 $("#checkfr").removeAttr("disabled");
		 }
	 }
    function returnperson(){
    	 window.location.href="/orders/driverOrdersList.htm";
	 }
	function onlong(val){
		 if(val===templength){
			 $("#checkfr").attr("disabled", true); 
		 }else{
			 $("#checkfr").removeAttr("disabled");
		 } 
	 }

	//车型
	function checkfrom(){
		var carType=0;
	    var checkzone1 = document.all("cartype");
	      for(var i=0;i<checkzone1.length;i++){  
	         if(checkzone1[i].checked){
	        	 carType=checkzone1[i].value;
	       }
	    }
	      var car_long=0;
		    var checkzone = document.all("car_long");
		      for(var i=0;i<checkzone.length;i++){  
		         if(checkzone[i].checked){
		        	 car_long=checkzone[i].value;
		       }
		    }
		  var paras= {driverId:'${driver.id}',driverName:$('#name').val(),carNumber:$('#carnum').val(),carType:carType,carLength:car_long,mobile:$('#mobile').val(),sex:1};
	  	$.ajax({
	            type: "POST",
	            url: "/ajax/updateDriverInfo.htm",
	            data:paras,
	            datatype:"json",
	            success: function(data){
	            	  var obj=eval('('+data+')'); 
	                if(obj.flag == 1){
				    	alert("修改成功！");
				    }else{
				    	alert(obj.msg);
				    }
	            }
	            });
		
	}
    
    
    </script>
</body>

</html>
</#escape> </#compress>