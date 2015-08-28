<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>操作中心--司机认证</title>
    
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
     <!-- <link rel="stylesheet"  href="http://192.168.2.50:8089/statics/css/zoom.css" media="all" /> -->
     
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
                            <li class="add_2"><b>
                                 <#if user.usertype == 1>
                                   <#if user.driver??>
                                      ${user.driver.driverName}</#if>
                                <#elseif user.usertype == 2>
                                   <#if user.companyInfo??>
                                   ${user.companyInfo.companyName}</#if>
                                </#if>
                            </b>
                            <span class="unpast">
                       <#if user.usertype == 1>
                                    <#if user.driver.sfzsfrz == 0 && user.driver.jszsfrz == 0 && user.driver.xszsfrz == 0>
                                          未认证
                                    <#elseif user.driver.sfzsfrz == 1 || user.driver.jszsfrz == 1 || user.driver.xszsfrz == 1 >
			认证中
									<#elseif user.driver.sfzsfrz == 10 && user.driver.jszsfrz == 10 && user.driver.xszsfrz == 2>
									未通过
									<#elseif user.driver.sfzsfrz == 10 && user.driver.jszsfrz == 2 && user.driver.xszsfrz == 10 >
									未通过
									<#elseif user.driver.sfzsfrz == 2 && user.driver.jszsfrz == 10 && user.driver.xszsfrz == 10>
									未通过
                                    <#elseif user.driver.sfzsfrz == 10 && user.driver.jszsfrz == 10 && user.driver.xszsfrz == 10>
			已认证
									<#else>
									认证中
                                    </#if>
                                <#elseif user.usertype == 2>
                                    <#if user.companyInfo.yyzzsfrz == 0 >
                                        未认证
                                    <#elseif user.companyInfo.yyzzsfrz == 1>
			认证中
                                    <#elseif user.companyInfo.yyzzsfrz == 10>
                                    未通过
                                    <#elseif user.companyInfo.yyzzsfrz == 2>
                                    未通过
                                    <#elseif user.companyInfo.yyzzsfrz == 10>
  已认证
                                    <#else>
                                    认证中
                                    </#if>
                                </#if>
                            </span> </li>
                            <li class="li_7_add"><strong>
								<#if Session["呼叫中心-用户认证-电话"]==1>
									${user.userName}
									 <#else>
									${(user.userName)[0..2]}****${(user.userName)[8..10]}
									</#if>
							
							</strong></li>
                           <li class="li_6">当前位置: 
                                <#if locationCity??>
                                ${locationCity}
                                <#else>
                                暂无数据
                                  </#if>
                                </li>     
                        </ul>
                        <ul class="clearfix">
                         <li class="add_1">车牌:&nbsp&nbsp${user.driver.carNumber}&nbsp&nbsp&nbsp
                                   <#if user.driver.carType==0>其它车型
                                   <#elseif user.driver.carType==7>箱式车
                                   <#elseif user.driver.carType==1>平板车
                                    <#elseif user.driver.carType==4>不限车型
                                     <#elseif user.driver.carType==11>高栏车
                                 <#else></#if>                                           
                                                                            &nbsp&nbsp 
                            <#if user.driver.carLength==0>其它车长
                                  <#elseif user.driver.carLength==1>9.6米
                                   <#elseif user.driver.carLength==2>13米
                                    <#elseif  user.driver.carLength==3>17.5米
                                     <#elseif user.driver.carLength==4>不限车长
                                 <#else></#if>  

                            </li>
                          <li class="add_2">信用：<span>接货${user.driver.jhds}次&nbsp;&nbsp;装货率${user.driver.zhl}%&nbsp;&nbsp;借款率${user.driver.jkl}%</span></li>
                            <li class="add_2">注册时间：<span>${user.operateTime?string("YYYY年MM月dd日    HH:mm")}</span></li>
                           
                            <li class="add_2">总运量：<span>暂无数据</span></li>
                            <li class="add_2">偏好：暂无数据</li>
                            <li class="add_2">最大装载量 ：暂无数据</li>
                        </ul>
                    </div>
                    <div class="bank">开户行 
                    <#if user.driver.yhkh??>: 
                    <#if user.driver.khyh == 0> <span class="bank_img_0">工商银行</span>
                    <#elseif user.driver.khyh ==1 > <span class="bank_img_1">建设银行</span> 
                    <#elseif user.driver.khyh ==2> <span class="bank_img_2">中国银行</span>                  
                      <#elseif user.driver.khyh ==3> <span class="bank_img_3">交通银行</span>               
                      <#elseif user.driver.khyh ==4> <span class="bank_img_4">农业银行</span>
                      <#elseif user.driver.khyh ==5> <span class="bank_img_5">招商银行</span>
                       <#elseif user.driver.khyh ==6> <span class="bank_img_6">中国邮政</span>
                     <#elseif user.driver.khyh ==7> <span class="bank_img_7">光大银行</span> 
                      <#elseif user.driver.khyh ==8> <span class="bank_img_8">民生银行</span>                   
                      <#elseif user.driver.khyh ==9> <span class="bank_img_9">平安银行</span>
                        <#elseif user.driver.khyh ==10> <span class="bank_img_10">浦发银行</span>
                        <#elseif user.driver.khyh ==11> <span class="bank_img_11">中信银行</span> 
                        <#elseif user.driver.khyh ==12> <span class="bank_img_12">华夏银行</span> 
                      <#elseif user.driver.khyh ==13> <span class="bank_img_13">兴业银行</span>
                       <#elseif user.driver.khyh ==14> <span class="bank_img_14">广发银行</span>
                       <#elseif user.driver.khyh ==15> <span >农村信用社</span>
                    <#else>
                    </#if>
                    &nbsp&nbsp卡号:&nbsp&nbsp<strong  style="color:#feb35a;">${user.driver.yhkh}</strong>
                    <#else>
                    <select name="" id="bankName">
                    <option value="">请选择</option>
                    <option value="0">工商银行</option>
                    <option value="1">建设银行</option>
                    <option value="2">中国银行</option>
                    <option value="3">交通银行</option>
                    <option value="4">农业银行</option>
                    <option value="5">招商银行</option>
                    <option value="6">中国邮政</option>
                    <option value="7">光大银行</option>
                    <option value="8">民生银行</option>
                    <option value="9">平安银行</option>
                    <option value="10">浦发银行</option>
                    <option value="11">中信银行</option>
                    <option value="12">华夏银行</option>
                    <option value="13">兴业银行</option>
                    <option value="14">广发银行</option>
                    <option value="15">农村信用社</option>
                    </select>卡号<input id="bankNuber" type="text" maxlength="24" > <button onclick="bankSbt()">保存</button>
                    </#if>
                    </div>
                    <div class="papers">
                        <ul class="clearfix">
                          <li>
                                <div class="img">
             <#if user.driver.jszzb?length gt 0>
                   <img class="imgclick" src="/img/downImg.htm?path=${user.driver.jszzb}" >
<!--          <a href="/img/downImg.htm?path=${user.driver.jszzb}" title="jquery.flyout">
              <img src="/img/downImg.htm?path=${user.driver.jszzb}">
            </a>  -->
              <#else>
              <img src="http://192.168.2.50:8089/statics/images/login_07.gif" >
      </#if>
                                </div> 
                               <p class="state">驾驶证
                               <#if user.driver.jszsfrz == 0>
                                                                                         未认证
                                    <#elseif user.driver.jszsfrz == 1>
      认证中
                  <#elseif user.driver.jszsfrz == 2>
                  未通过
                                    <#elseif user.driver.jszsfrz == 10>
      已认证
                  <#else>
                  认证中
                                    </#if>
                                
                                </p>
                                  <form action="">
                                    <label for="">输入驾驶证号
                                        <br>
                                        <input id="jszhm" type="text" value="${user.driver.jszhm}">
                                    </label>
                                </form>
                              <p  style="margin-top:118px;" class="btn">
                                    <button class="back" onclick="certificationSet('jsz','2');">驳 回</button>
                                    <button class="past" onclick="certificationSet('jsz','10');">通过审核</button>
                                </p>
                            </li>
                              <li>
                                <div class="img">
       <#if user.driver.sfzzp?length gt 0>
        <img class="imgclick"  src="/img/downImg.htm?path=${user.driver.sfzzp}" >
        <!--  <a href="/img/downImg.htm?path=${user.driver.sfzzp}" title="jquery.flyout">
          
              <img src="/img/downImg.htm?path=${user.driver.sfzzp}" >
            </a> -->
              <#else>
              <img src="http://192.168.2.50:8089/statics/images/login_07.gif" >
      </#if>
                                </div>
                                <p class="state">驾驶证副本
                               <#if user.driver.sfzsfrz == 0>
                                                                                           未认证
                                    <#elseif user.driver.sfzsfrz == 1>
      认证中
                  <#elseif user.driver.sfzsfrz == 2>
                  未通过
                                    <#elseif user.driver.sfzsfrz == 10>
      已认证
                  <#else>
                  认证中
                                    </#if>
                                 </p>
                                 <form action="">
                                    <label for="">输入档案编号
                                        <br>
                                        <input id="jszfbhm" type="text" value="${user.driver.sfzhm}">
                                    </label>
                                </form>
                             <p style="margin-top:116px;"  class="btn">
                                    <button class="back" onclick="certificationSet('sfz','2');">驳 回</button>
                                    <button class="past" onclick="certificationSet('sfz','10');">通过审核</button>
                                </p>
                            </li>
                            <li>
                                <div class="img">
                                
                                   <#if user.driver.xszzb?length gt 0>
                                       	<img  class="imgclick"  src="/img/downImg.htm?path=${user.driver.xszzb}" >
	    	<!-- 	<a href="/img/downImg.htm?path=${user.driver.xszzb}" title="jquery.flyout">
	        		<img src="/img/downImg.htm?path=${user.driver.xszzb}" >
	        	</a> -->
	        	<#else>
	        		<img src="http://192.168.2.50:8089/statics/images/login_07.gif" >
	    </#if>
                                </div>
                                <p class="state">行驶证
                                   <#if user.driver.xszsfrz == 0>
                                                                                           未认证
                                    <#elseif user.driver.xszsfrz == 1>
			认证中
									<#elseif user.driver.xszsfrz == 2>
									未通过
                                    <#elseif user.driver.xszsfrz == 10>
			已认证
									<#else>
									认证中
                                    </#if>
                                 
                                 </p>
                                <form action="">
                                   <!--  <label for="">输入车牌号码
                                        <br>
                                        <input id="xszcphm" type="text" value="${user.driver.xszhm}">
                                    </label>
                                    <br>
                                    <label for="">输入所有人
                                        <br>
                                        <input id="xszuser" type="text" value='${user.driver.xszuser}'>
                                    </label>
                                    <br> -->
                                    <label for="">车辆识别代码
                                        <br>
                                        <input id="xszdisnum" type="text" value='${user.driver.xszdisnum}'>
                                    </label>
                                </form> 
                                <p style="margin-top:116px;"  class="btn">
                                    <button class="back" onclick="certificationSet('xsz','2');">驳 回</button>
                                    
                                    <button class="past" onclick="certificationSet('xsz','10');">通过审核</button>
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
    <div id="box_h1" class="opacity-bg"></div>
    <div id="box_h1_1" class="opacity-bg"></div>
    <div id="box_h2" class="lightbox lightbox_2">
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
    <div id="box_h3"  class="lightbox lightbox_3">
        <img id="img7" src="" alt=""  style="width:auto;height:auto;max-width:880px;max-height:880px;display:block;margin:0 auto; cursor: pointer;">
    </div>
      <!-- // <script src="http://192.168.2.50:8089/statics/js/zoom.min.js"></script> -->
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
  // 限制银行卡只能输入数字
// window.onload =function() {
//   var leng=$("#bankNuber").length;
//   if (leng>0) {
//             document.getElementById("bankNuber").onkeyup =function() {
//                   this.value =this.value.replace(/\s/g,'').replace(/\D/g,'').replace(/(\d{4})(?=\d)/g,"$1 ");
//             };
//           };
//         };
function subt(){
   $.ajax({  
          url:"/ajax/setcertification.htm",  
          type:"post", 
          data:{certype:$("#certype").val(),cerval:$("#cerval").val(),id:'${user.id}',remark: $("#remark").val(),jszhm: $("#jszhm").val(),jszfbhm: $("#jszfbhm").val(),xszcphm: $("#xszcphm").val(),xszuser: $("#xszuser").val(),xszdisnum: $("#xszdisnum").val()},
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
     var jszhm=$("#jszhm").val();
      var jszfbhm=$("#jszfbhm").val();
      // var xszcphm=$("#xszcphm").val();
      // var xszuser=$("#xszuser").val();
      var xszdisnum=$("#xszdisnum").val();
if(val=="10"){
  if (para=='sfz') {
    if (jszfbhm=='') {
alert("档案编号不能为空");
 return false;
}}
if (para=='jsz') {
  if ( jszhm=="") {
  alert("请填写驾驶证号码");
  return false;
}}
if (para=='xsz') {if (xszdisnum=="") {
  alert("请完整信息");
  return false;
}}
      if (confirm("确认通过审核？")) {
       subt();
          }
	}
}
function sendCer(){
  var text =$(".text textarea").val();
  if (text!="") {
   subt();
  } else{
    alert("驳回理由不能为空");
  };
	 
}
function bankSbt(){
  var bankName=$.trim($("#bankName").val());
  var bankNumber=$("#bankNuber").val();
  if (bankName=="") {
    alert("请选择开户行");
    return;
  } 
  if( bankNumber==""){
    alert("请输入卡号");
    return;
  }
$.ajax({
  url:"/ajax/setUserCard.htm",
  type:"post",
  data:{userId:${user.id},khyh:bankName,yhkh: bankNumber},
  dataType:"json",
  success:function(data){
    if(data.flag==1){
              alert("保存成功");
              location.reload();
            }else{
              alert(data.msg);
            }
  },error:function(data){
    alert("系统繁忙或未登录，请稍后再试或登录");  
  }
});
}
    </script>
</body>

</html>
