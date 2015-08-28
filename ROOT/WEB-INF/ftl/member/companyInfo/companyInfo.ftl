<#compress >
    <#escape x as x?html>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>修改企业个人信息</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/info.css">
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
           
</head>

<body>
<#include "common/head.ftl"/>
    <div class="content">
        <div class="logo">
             <a href="/index.htm"> <img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
        </div> 
        <div class="main">
            <h3>设置</h3>
            <p class="title">我的资料</p>
            <div class="info">
                <div class="basic_set">
                   <p>企业名称 :&nbsp&nbsp&nbsp&nbsp${allCompanyInfo.companyInfo.companyName}
                  <input class="name" id="compName" type="text" value="${allCompanyInfo.companyInfo.companyName}" style="display: none;"> 
                   <p class="change_pws"> <a href="/updatepwd.htm">修改密码</a></p>
                </div>
                <h4>我的认证</h4>
                <div class="text">
                    <p>1“点击上传 ”找到电脑中的相关证件照片 。</p>
                    <p class="number"></p>
                </div>
                <div class="paper">
                    <ul class="ul_2 clearfix">
                        <li>
                        <form id="yyzzImgImgform"  action="/ajax/uploadYyzzImg.htm"  method="post" enctype="multipart/form-data" >
                            <#if allCompanyInfo.companyInfo.yyzzsfrz?? && allCompanyInfo.companyInfo.yyzzsfrz !=""&& allCompanyInfo.companyInfo.yyzzsfrz !="0">
													<#if allCompanyInfo.companyInfo.yyzzsfrz == 10>
														  <p>已认证</p>
														  
														  <p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_6.png" alt=""></p>
														     <p> 营业执照副本</p>
													<#elseif allCompanyInfo.companyInfo.yyzzsfrz == 1>
														<p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击重新上传
														<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_6.png" alt=""></p>
														</a></p>
														   <p> 营业执照副本</p>
                                                      <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
													<#elseif allCompanyInfo.companyInfo.yyzzsfrz == 2>
														<p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击重新上传
														<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_6.png" alt=""></p>
														</a></p>
														   <p> 营业执照副本</p>
														    <p style="position: relative;top: 15px;color:#6f6f6f">审核未通过</p>
													<#else>
														<p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击上传
														<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_6.png" alt=""></p>
														</a></p>
														   <p> 营业执照副本</p>
													</#if>
												<#else>
													<p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击上传
														<p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_6.png" alt=""></p>
														</a></p>
														   <p> 营业执照副本</p>
							</#if>
                            <input type="file" name="yyzzfile" id="yyzzImgSelect" class="file" style="display: none;">
							<input type="hidden" name="companyId" id="companyId" value="${allCompanyInfo.companyInfo.id}"/>
						</form>
						 <div class="loading" id="yyzzloading"><img alt="" src="http://192.168.2.50:8089/statics/images/loading.gif"></div>
                        </li>
                    </ul>
                    <p class="bttn">
                        <button class="cancel"  onclick="returnperson();">取消</button>
                        <button class="sure"id="checkfr" onclick="savecomp();">确定</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 蜀ICP备15006511号-1</p>
        </div>
    </div>
    <script type="text/javascript">
    $("#checkfr").attr("disabled", true);
    var tempname='${allCompanyInfo.companyInfo.companyName}';
    function yyzzclick(){
    	document.getElementById("yyzzImgSelect").click(); 
    }
    $(document).ready(function(){
    	$("#compName").bind("keyup",function(){
   		   if($("#compName").val()==tempname){
   			$("#checkfr").attr("disabled", true);
   		   }else{
   			 $("#checkfr").removeAttr("disabled");
   		   }
     	 });
    	
    	var imgLock = true;
		$('#yyzzImgSelect').bind("click",function(e){
			  	if (!imgLock) {
			  		var event = window.event || e;
			  		event.preventDefault();
			  	}
		  });
    	$('#yyzzImgSelect').change(function(){
		  	  if (imgLock && $(this).val() != "") {
		  	  	imgLock = false;
		  	  $("#yyzzloading").show();
				$("#yyzzImgImgform").ajaxSubmit({  
		            url:"/ajax/uploadYyzzImg.htm",  
		            type:"post",  
		            enctype:'multipart/form-data',  
		            dataType:'json',
		            success:function(data) { 
		            	if (data.flag == 1) {
		            		 $("#yyzzloading").hide();
		            		alert("上传成功");
		            		 window.location.href="/companyInfo/toCompanyInfo.htm";
		            	}  else if(data.flag == -2){
		            		 $("#yyzzloading").hide();
		            		alert("上传失败,格式错误或大小超过2M！");
		            	} else {
		            		 $("#yyzzloading").hide();
		            		 $.showErrorAlert('上传失败！');
		            	}
		            	imgLock = true;
		            },error:function(data) {  
		           	 $("#yyzzloading").hide();
		            	alert('系统或网络出错！');
		                imgLock = true;
		            }  
		        });
	        }
		});
    	
    });
    function returnperson(){
   	 window.location.href="/orders/cargoerOrdersList.htm";
	 }
    
   function savecomp(){
	   if($("#compName").val()==null || ($("#compName").val()).trim()==""){
		   alert("企业名称不能为空!");
	   }
	   $("#checkfr").attr("disabled", true);
		$.post("/ajax/updateCompanyInfo.htm",{id:'${allCompanyInfo.companyInfo.id}',companyName:$("#compName").val()},
				  function(data){
				    if(data.flag == 1){
				    	alert(data.msg);
				    	window.location.reload();
				    }else{
				    	alert(data.msg);
				    	 $("#checkfr").removeAttr("disabled");
				    }
				  },
				  "json");
   }
    
    </script>
</body>

</html>

    </#escape>
</#compress>