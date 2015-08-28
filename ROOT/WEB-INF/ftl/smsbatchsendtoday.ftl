<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>短信批量发送</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
</head>

<body>
    <div class="header">
        <div class="head">
            <div class="logo">
                <a href="#"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
            </div>
        </div>
    </div>
    <div class="content ">
        <div class="main clearfix">
        <#include "common/leftbar.ftl">
            <div class="rside">
                <div class="table">
                    <div class="chose  clearfix">
                       <ul class="chose_item clearfix">
                           
							   <#if Session["操作中心-手机APK"]==1><li><a href="/mobilelist.htm">手机APK</a></li></#if> 
							
							<#if Session["操作中心-交易投诉"]==1><li  class="l_side" id="complain"><a href="/tradecomplaints.htm">交易投诉</a></li></#if> 
							 <li class="l_side chose_active"><a href="/smsbatchsendtoday.htm">批量发送短信</a></li>
                        </ul>
                    </div>
                    <p>输入电话号码<span>多个电话号码用英文(,)隔开</span></p>
                    <div class="text">
                     <textarea id="sendphones" cols="124" rows="10"></textarea>  
                    </div>
                    <p>输入发送短信内容</p>
                    <div class="text">
                      <textarea id="sendcontent"  cols="124" rows="10"></textarea>  
                    </div>
<div class="send"><button onclick="sendSMS()">发送</button></div>
                    
               
                </div>
                
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
        </div>
    </div>
    <script type="text/javascript">

$(document).ready(function () {
    $(".li_4").addClass("active");
});
function sendSMS(){
	  //alert($("#sendphones").val());
	// alert($("#sendcontent").val());
		$.ajax({  
	        url:"/ajax/sendBaSMS.htm",  
	        type:"post", 
	        data:{sendphones:$("#sendphones").val(),sendcontent:$("#sendcontent").val()},
	        dataType:"json",
	        success:function(data) { 
	        	
	      		if(data.flag==1){
	      			alert(data.msg);
	      		}else{
	      			alert(data.msg);
	      		}
	        },error:function(data) {  
	            alert("系统繁忙或未登录，请稍后再试或登录");  
	        }  
	    });
	}
</script>
</body>

</html>
