<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>操作中心--货主认证</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.rotate.min.js"></script> 

</head>

<body>
    <div class="header">
        <div class="head">
            <div class="logo"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></div>
        </div>
    </div>
    <div class="content">
        <div class="main clearfix">
              <#include "common/leftbar.ftl">
            <div class="rside">
                <div class="particulars" style="margin-top:0px;">
                   <p class="title"><a href="javascript:history.go(-1)">返回</a></p>
                    <div class="info">
                        <ul class="clearfix ul_1">
                            <li><b>
                                 <#if user.usertype == 1>
                                   <#if user.driver??>
                                      ${user.driver.driverName}</#if>
                                <#elseif user.usertype == 2>
                                   <#if user.companyInfo??>
                                   ${user.companyInfo.companyName}</#if>
                                </#if>
                            </b>
                            <span class="unpast">
                                    <#if user.companyInfo.yyzzsfrz == 0 >
                                        未认证
                                    <#elseif user.companyInfo.yyzzsfrz == 1>
			认证中
                                    <#elseif user.companyInfo.yyzzsfrz == 2>
                                    未通过
                                    <#elseif user.companyInfo.yyzzsfrz == 10>
  已认证
                                    <#else>
                                    认证中
                                    </#if>
                            </span> </li>
                            <li class="li_1">
								<#if Session["呼叫中心-用户认证-电话"]==1>
									${user.userName}
									 <#else>
									${(user.userName)[0..2]}****${(user.userName)[8..10]}
									</#if>
							
							</li>
                            <li class="li_2">信用：<span>暂无数据</span></li>
                            <li class="li_3">注册时间：<span>${user.operateTime?string("YYYY年MM月dd日 HH:mm")}</span></li>
                        </ul>
                        <ul class="clearfix">
                            <li>总运量：<span>暂无数据</span></li>
                            <li class="li_4">偏好：暂无数据</li>
                            <li class="li_5">最大装载量 ：暂无数据</li>
                        </ul>
                    </div>
                    <div class="papers">
                        <ul class="clearfix">
                            <li class="business">
                                <div class="img">
                 <#if user.companyInfo.yyzzzp?length gt 0>
	    		<!-- <a href="/img/downImg.htm?path=${user.companyInfo.yyzzzp}" title="jquery.flyout">
	        		<img src="/img/downImg.htm?path=${user.companyInfo.yyzzzp}" >
	        	</a> -->
	        	                	<img  class="imgclick"  src="/img/downImg.htm?path=${user.companyInfo.yyzzzp}" >
	        	<#else>
	        		<img src="http://192.168.2.50:8089/statics//images/login_07.gif" >
	    </#if>
                                </div>
                                 <p class="state">
                                   <#if user.companyInfo.yyzzsfrz == 0>
                                                                                           未认证
                                    <#elseif user.companyInfo.yyzzsfrz == 1>
			认证中
									<#elseif user.companyInfo.yyzzsfrz == 2>
									未通过
                                    <#elseif user.companyInfo.yyzzsfrz == 10>
			已认证
									<#else>
									认证中
                                    </#if>
                                 
                                 </p>
                                  <p class="btn">
                                    <button class="back" onclick="certificationSet('yyzz','2');">驳 回</button>
                                    
                                    <button class="past" onclick="certificationSet('yyzz','10');">通过审核</button>
                                </p>
                                <input type="hidden" id="certype">
                                 <input type="hidden" id="cerval">
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
        </div>
    </div>
    <div class="opacity-bg">
    </div>
    <div class="lightbox lightbox_2">
        <ul class="clearfix">
            <li class="title">驳回理由</li>
        </ul>
        <div class="text">
        <textarea name="" cols="57" rows="7" id="remark"></textarea>
        </div>
        <p class="bttn">
            <button class="back">取消</button>
            <button class="past" onclick="sendCer()">提交申请</button>
        </p>
    </div>
    <div id="box_h1_1" class="opacity-bg"></div>
<div id="box_h3"  class="lightbox lightbox_3">
        <img id="img7" src="" alt=""  style="width:auto;height:auto;max-width:880px;max-height:880px;display:block;margin:0 auto; cursor: pointer;">
    </div> 
<script type="text/javascript">
$(document).ready(function () {
	  $(".li_7").addClass("active");
      $(".img .imgclick").on("click",function(){
      var imgSrc=$(this).attr('src');
   $("#box_h1_1,#box_h3").show();
   $("#box_h3 img").attr("src",imgSrc)
    })
    var value2 = 0
     $("#img7").rotate({
            bind: {
                click: function() {
                    value2 += 90;
                    $(this).rotate({
                        animateTo: value2
                    })
                }
            }

        });
});
$(document).click(function(){
$("#box_h1_1,#box_h3").hide();
     });
     $(function(){ 
$("#box_h3 img,.img img").click(function(event){ 
event.stopPropagation(); 
}); 
});
function subt(){
 $.ajax({  
            url:"/ajax/setcertification.htm",  
            type:"post", 
            data:{certype:$("#certype").val(),cerval:$("#cerval").val(),id:'${user.id}',remark: $("#remark").val()},
            dataType:"json",
            success:function(data) { 
                if(data.flag==1){
                    alert(data.msg);
                    location.reload();
                }else{
                    alert(data.msg);
                }
            },error:function(data) {  
                alert("系统繁忙或未登录，请稍后再试或登录");  
            }  
        });
}
function certificationSet(para,val){
	$("#certype").val(para);
	$("#cerval").val(val);
	if(val=="10"){
	subt();	
	}
}
function sendCer(){
    var text=$(".text textarea").val();
    if (text!="") {
	 subt();
    }else{
        alert(" 驳回理由不能为空");
    };
}
    </script>
</body>

</html>
