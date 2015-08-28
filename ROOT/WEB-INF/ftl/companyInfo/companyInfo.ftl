<#compress >
    <#escape x as x?html>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>设置</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/info.css">
      <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
</head>

<body>
     <#include "common/head.ftl"/>
    <div class="content">
        <div class="logo">
              <a href="/index.htm"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
        </div> 
        <div class="main">
            <h3>设置</h3>
            <p class="title">我的资料</p>
            <div class="info">
                <div class="basic_set">
                   <p>企业名称<input class="name" id="compName" type="text" value="${allCompanyInfo.companyInfo.companyName}"></p> 
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
                            <p><a href="#">已认证</a></p>
                            <p class="img"><img src="http://192.168.2.50:8089/statics/images/papers_6.png" alt=""></p>
                            <p> 营业执照副本</p>
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
    $(document).ready(function(){
    	$("#compName").bind("keyup",function(){
   		   if($("#compName").val()==tempname){
   			$("#checkfr").attr("disabled", true);
   		   }else{
   			 $("#checkfr").removeAttr("disabled");
   		   }
     	 });
    	
    	$('#yyzzImgSelect').change(function(){
		  	  if (imgLock && $(this).val() != "") {
		  	  	imgLock = false;
		  	  	$("#jhcc").css("display", "block");
		  	  	$('#yyzzImg').attr('src','http://192.168.2.50:8089/static/images/zt1.jpg');
				$("#yyzzImgImgform").ajaxSubmit({  
		            url:"/ajax/uploadYyzzImg.htm",  
		            type:"post",  
		            enctype:'multipart/form-data',  
		            dataType:'json',
		            success:function(data) { 
		            	if (data.flag == 1) {
		            		$.showMsgAlert("上传成功");		            	 
				            $('#yyzzImg').attr('src','http://192.168.2.50:8089/static/images/zt2.jpg');
				            $("#jhcc").css("display", "none");			            				            
		            	}  else if(data.flag == -2){
		            		$.showErrorAlert("上传失败,格式错误或大小超过2M！","提示",{fontSize:18});
		            		$("#jhcc").css("display", "none");
		            	} else {
		            		 $.showErrorAlert('上传失败！',"错误",{fontSize:18});
		            		 $("#jhcc").css("display", "none");
		            	}
		            	imgLock = true;
		            },error:function(data) {  
		                $.showErrorAlert('系统或网络出错！',"错误",{fontSize:18});
		                $("#jhcc").css("display", "none");
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