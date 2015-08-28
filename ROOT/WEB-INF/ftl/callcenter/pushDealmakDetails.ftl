<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>呼叫中心-发布货源</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/help_info_fill.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/laydate.js"></script>
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
                <p class="back"><a href="javascript:history.go(-1)">返回</a></p>
                <div class="compang_info clearfix">
                <a id="sendMsg" class="sbmt" href=#>发送安装短信</a>
                                           
                    <dl>
 <#if  user??>
                        <dt>${user.driver.driverName}<span>已认证</span> <strong>&nbsp</strong></dt>
                        <dd><strong>车牌：${user.driver.carNumber}</strong> </dd>
                        <dd>总运量 ：暂无数据</dd>
                        <dd>偏好位置: 成都 西安 广东  上海 <a class="address" onclick='addAddress()' href="#">增加地址</a></dd>
                    </dl>
                         
                    <dl>
                        <dt><strong>${user.driver.mobile}</strong></dt>
                        <dd>信用：拉货&nbsp${user.driver.jhds}&nbsp次&nbsp&nbsp装货率&nbsp${user.driver.zhl}&nbsp% &nbsp&nbsp结款率${user.driver.jkl}&nbsp%</dd>
                        <dd>偏好 ：暂无记录</dd>
                        <dd id="entry"></dd>
                    </dl>
                    <dl>
                    <dt class="site">当前位置: 
					<#if user.driver.provinceStr??>
                                   ${ user.driver.provinceStr} &nbsp&nbsp
								    ${ user.driver.cityStr}
									 <#else>
                                     暂无数据
                                    </#if>
					 &nbsp <strong>&nbsp</strong></dt>
                        <dd>注册时间：${user.operateTime?string("YYYY年MM月dd日")}</dd>
                        <dd>最大装载量：暂无数据</dd>
                    </dl>
                       </#if>
                                   
                </div>
                <h3> 推荐货源</h3>
                <div class="history">
                     
                     <ul class="clearfix">
                     <#if cargoList ??>
                                            <#list cargoList as cargo>
                        <li>
                            <p class="code">发货编码：<span>${cargo.cargoNo}</span></p>
                            <div class="table clearfix">
                                <div class="side_info">
                                    <table>
                                        <tr>
                                            <td width="80" height="25">${cargo.cityStr}</td>
                                            <td width="50"><img src="http://192.168.2.50:8089/statics/images/r1.png" alt=""></td>
                                            <td width="85" class="title">${cargo.arrivalCityStr}</td>
                                        </tr>
                                        <tr>
                                            <td height="20">${cargo.countyStr}</td>
                                            <td></td>
                                            <td>${cargo.arrivalCountyStr}</td>
                                        </tr>
                                        <tr>
                                            <td>${cargo.sendTimeStr}</td>
                                            <td></td>
                                            <td>${cargo.arrivalTimeStr}</td>
                                        </tr>
                                    </table>
                                    <p class="require">车型要求   <#if cargo.carLength==0>其它车长
                                  <#elseif cargo.carLength==1>9.6米
                                   <#elseif cargo.carLength==2>12米
                                    <#elseif  cargo.carLength==3>17.5米
                                     <#elseif cargo.carLength==4>不限车长
                                 <#else></#if>&nbsp&nbsp&nbsp<#if cargo.carType==0>其它车型
                                  <#elseif cargo.carType==7>箱式车
                                   <#elseif cargo.carType==1>平板车
                                    <#elseif cargo.carType==4>不限车型
                                     <#elseif cargo.carType==11>高栏车
                                 <#else></#if></p>
                                </div>
                                <div class="rside_info">
                                    <p class="price">RMB&nbsp${cargo.quote/100}<b>/吨</b></p>
                                    <p class="introduce">${cargo.cargoName}/${cargo.weight}吨/${cargo.square}立方</p>
                                    <p id="${cargo.id}ed" class="number"></p>
                                    <a id="bt${cargo.id}" class="sbmt" href="javascript:void(0);" onclick="sendMsg(${cargo.id})">推送</a>
                                </div>
                            </div>
                        </li>
                              </#list>
                                        </#if>
                        
                    </ul> 
                </div>
                <h3 style="border:none">推荐失败原因</h3>
                <div class="text">
                    <textarea name="" id="reason" cols="140" rows="5" ma></textarea>
                    <a class="sbmt" href="javascript:void(0);" onclick="reason()">保存</a>
                </div>
            </div>
        </div>
    </div>
               <#include "common/foot.ftl">
               <script>
               $(document).ready(function(){
               $(".li_7").addClass("active");
               showDialog();
               })            
  function sendMsg(cargoIdp){ 
  //$("#"+"bt"+cargoIdp).removeAttr('onclick');
  //$("#"+"bt"+cargoIdp).css('cursor','pointer');
                        var paras = {userId:${user.id},cargoId:cargoIdp};
                    $.ajax({
                        type: "POST",
                        url: "/ajax/pushCallerCargo.htm",
                        data:paras,
                        dataType:'json',
                        success: function(data) {   
                          var obj = data;
                            if (obj.flag == 1) {
                                setDialog('温馨提示', '推送成功！');
                                $("button").on("click",function(){
                                $("#"+cargoIdp+"ed").text("已推送");
                               $("#"+"bt"+cargoIdp).text("重新推送");
                             // window.location.href = "/pushDealmaking.htm";
                                });      
                            } else {
                           setDialog('温馨提示', obj.msg);
                            }
                            
                       //$("#"+"bt"+cargoIdp).css('cursor','pointer');
                       //$("#"+"bt"+cargoIdp).attr('onclick');
                        }
                    });  
                             }
    function reason(){
    var reasonText=$("#reason").val();
        var paras = {userId:${user.id},failReason:reasonText};
        if (reasonText.length>0) {
        $('.text .sbmt').removeAttr('onclick');
           $('.text .sbmt').css('cursor','default');
            $.ajax({
                 type: "POST",
                 url: "/ajax/pushCallerFailure.htm",
                data: paras,
                datatype:'json',
                 success: function(data) { 
                 var obj = eval('(' + data + ')');
                  if (obj.flag == 1) {
                    setDialog('温馨提示', '保存成功');
                    $("button").on("click",function(){
                       window.location.href = "/pushDealmaking.htm";

                    })
                                
                     } else {
                            setDialog('温馨提示', obj.msg);

                            }
        $('.text .sbmt').attr('onclick');
$('.text .sbmt').css('cursor','pointer');

                        }
            });
        };
    }
function setDialog(title, info) {
document.getElementById('mydialogtitle').innerHTML = title;
document.getElementById('mydialoginfo').innerHTML = info;
$(".opacity-bg,.sure_box").show();
$(".sure_box h3 b,.sure_box button").click(function(){
$(".opacity-bg,.sure_box").hide();
})
};
$("#sendMsg").bind("click",function(){

      $.ajax({  
              url:"/ajax/pushSMSAppDown.htm",  
              type:"post", 
              data:{userId:${user.id}},
              dataType:"json",
              success:function(data) { 
                if (data.flag > 0) {
                  alert("发送成功")
                } else {
                  alert(data.msg); }
              },
              error:function(data) {  
              alert(data.flag)
                cancelIssue = true;
                  alert("系统繁忙，请稍后再试");  
              }  
          });
      });
function addAddress(){
  var add='<input type="text"><button onclick="removeAddress()">确定</button>';
   $("#entry").html(add);
}
function removeAddress(){
  $("#entry").empty();
}

function showDialog() {
light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;padding-bottom:30px;border: 1px solid #cccccc;border-radius: 5px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;cursor: pointer;\"></b></h3><p style=\"text-align: center;padding: 30px 20px;font-size: 20px;color: #575757;max-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
$(".footer").after(light_box1);
};





               </script>
</body>

</html>

</#escape> </#compress>