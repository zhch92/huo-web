<#compress>
    <#escape x as x?html>
  <!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>操作中心</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
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
                <div class="table">
                    <p class="back" style="height:30px;margin-bottom:35px; border-bottom: 1px dashed #dbdbdb;"><a href="javascript:history.go(-1)">返回</a></p>
                    <div class="table_complain table_active" style="position:relative">
                          <#if driver??>
                        <div class="info">
                            <ul class="clearfix ul_1">
                                <li class="li_7_add"><b>${driver.driverName}
                             </b><span class="unpast">  
         <#if driver.sfzsfrz == 0 && driver.jszsfrz == 0 && driver.xszsfrz == 0>
                                          未认证
                                    <#elseif driver.sfzsfrz == 1 || driver.jszsfrz == 1 || driver.xszsfrz == 1 >
            认证中
                                    <#elseif driver.sfzsfrz == 10 && driver.jszsfrz == 10 && driver.xszsfrz == 2>
                                    未通过
                                    <#elseif driver.sfzsfrz == 10 && driver.jszsfrz == 2 && driver.xszsfrz == 10 >
                                    未通过
                                    <#elseif driver.sfzsfrz == 2 && driver.jszsfrz == 10 && driver.xszsfrz == 10>
                                    未通过
                                    <#elseif driver.sfzsfrz == 10 && driver.jszsfrz == 10 && driver.xszsfrz == 10>
            已认证
                                    <#else>
                                    认证中
                                    </#if>
                             </span> </li>
                                <li class="li_7_add"  style="width:320px;"><strong>
                                 <#if Session["用户管理-司机-电话"]==1>
                                    ${driver.mobile}
                                     <#else>
                                    ${(driver.mobile)[0..2]}****${(user.driver.mobile)[8..10]}
                                    </#if>
                                </strong></li>
                                <li class="li_6" style="width:235px;"> 当前位置:
                                <#if locationCity??>
                                ${locationCity}
                                <#else>
                                暂无数据
                                  </#if>
                                </li>
                            </ul>
                            <ul class="clearfix">
                            <li class="add_1">车牌:&nbsp&nbsp${driver.carNumber}&nbsp&nbsp&nbsp
  <#if driver.carType==0>其它车型
                                  <#elseif driver.carType==7>箱式车
                                   <#elseif driver.carType==1>平板车
                                    <#elseif driver.carType==4>不限车型
                                     <#elseif driver.carType==11>高栏车
                                 <#else></#if>                                           
                                                                            &nbsp&nbsp 
                            <#if driver.carLength==0>其它车长
                                  <#elseif driver.carLength==1>9.6米
                                   <#elseif driver.carLength==2>13米
                                    <#elseif  driver.carLength==3>17.5米
                                     <#elseif driver.carLength==4>不限车长
                                 <#else></#if>  

                            </li>
                            <li class="add_2"  style="width:320px;">信用：发货${driver.jhds}次&nbsp&nbsp&nbsp装货率
                                 <#if driver.jhds == 0 >
                                  100%&nbsp&nbsp&nbsp交付率100%
                                <#else>
                  ${driver.zhl}%&nbsp&nbsp交付率${driver.jkl}%
                                    </#if>
                                </li>
                                <li class="add_2"  style="width:235px;">注册时间：<span>${driver.operateTime?string("YYYY年MM月dd日")}</span></li>
                                <li class="add_2">总运量：暂无数据</li>
                                <li class="add_2"  style="width:320px;">偏好：暂无数据</li>
                                <li class="add_2"  style="width:235px;">最大装载量 ：暂无数据</li>
                            </ul>
                         </#if>
                        </div>
                         <div class="bank">开户行
                    <#if driver.yhkh??>:
                    <#if driver.khyh == 0> <span class="bank_img_0">工商银行</span>
                    <#elseif driver.khyh ==1 > <span class="bank_img_1">建设银行</span> 
                    <#elseif driver.khyh ==2> <span class="bank_img_2">中国银行</span>                  
                      <#elseif driver.khyh ==3> <span class="bank_img_3">交通银行</span>               
                      <#elseif driver.khyh ==4> <span class="bank_img_4">农业银行</span>
                      <#elseif driver.khyh ==5> <span class="bank_img_5">招商银行</span>
                       <#elseif driver.khyh ==6> <span class="bank_img_6">中国邮政</span>
                     <#elseif driver.khyh ==7> <span class="bank_img_7">光大银行</span> 
                      <#elseif driver.khyh ==8> <span class="bank_img_8">民生银行</span>                   
                      <#elseif driver.khyh ==9> <span class="bank_img_9">平安银行</span>
                        <#elseif driver.khyh ==10> <span class="bank_img_10">浦发银行</span>
                        <#elseif driver.khyh ==11> <span class="bank_img_11">中信银行</span> 
                        <#elseif driver.khyh ==12> <span class="bank_img_12">华夏银行</span> 
                      <#elseif driver.khyh ==13> <span class="bank_img_13">兴业银行</span>
                       <#elseif driver.khyh ==14> <span class="bank_img_14">广发银行</span>
                       <#elseif driver.khyh ==15> <span >农村信用社</span>
                    <#else>
                    </#if>
              
                    &nbsp&nbsp卡号:&nbsp&nbsp<strong style="color:#feb35a;">${driver.yhkh}</strong>
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
                            <table border="1" cellspacing="0" rules="all" style="margin-top:30px;text-align:center;">
                                <thead>
                                    <tr>
                                        <th width="10%">交易编号</th>
                                        <th width="12%">成交时间</th>
                                        <th width="10%">出发地</th>
                                        <th width="10%">目的地</th>
                                        <th width="12%">重量</th>
                                        <th width="10%">单价</th>
                                        <th width="12%">总价</th>
                                        <th width="12%">交易详情</th>
                                        <th width="12%">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <#if amuList??>
                                <#list amuList as activityMUser>
                                    <tr>
                                        <td>${activityMUser.orders.orderNo}</td>
                                        <td>${activityMUser.orders.ensureTradeUseTimeStr}</td>
                                        <td style="padding-left:10px;text-align:left;">${activityMUser.orders.cityStr}</td>
                                        <td style="padding-left:10px;text-align:left;">${activityMUser.orders.arrivalCityStr}</td>
                                        <td style="padding-left:10px;text-align:left;">${activityMUser.orders.count}吨/${((activityMUser.orders.square/activityMUser.orders.weight)*activityMUser.orders.count)?int}方</td>
                                        <td style="padding-left:10px;text-align:left;">${activityMUser.orders.money/100}元/吨</td>
                                        <td style="padding-left:30px;text-align:left;">${activityMUser.orders.total/100}元</td>
                                        <td style="padding-left:30px;text-align:left;"><a href="/payment.htm?orderId=${activityMUser.orders.id}"  target="_Blank"2> 查看详情</a></td>
                                        <td>
                                        <#if activityMUser.status==0>
                                       <#if  Session["活动列表-付款按钮"]==1>
                                        <a href="javascript:void(0);" style="color:#585858;;" onclick="payment(${activityMUser.status},${activityMUser.id})">
                                        <span style="color:#feb35a;">付款</span></a>
										<#else>
										 <span style="color:#feb35a;">待付款</span>
										</#if>
                                        <#else>
                                        已付款
                                        </#if>
                                        </td>
                                        </tr>
                                        </#list>
                                        <#else>
                                           <tr><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td></tr>

                                        </#if>
                                </tbody>
                            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <#include "common/foot.ftl">
 <script>
    $(document).ready(function() {
    $(".lside .li_9").addClass("active"); 
    })
   function payment(cho,val){
if(cho==0){
      if(confirm("确认付款")){
        $.ajax({
              url:"/ajax/setyhkmoney.htm",
              type:"post",
              data:{amuId:val},
              dataType:"json",
              success:function(data){
                  if(data.flag==1){
               alert("付款成功");
               location.reload();
                   }else{
               alert(data.msg);
             }  
         },
        error:function(data){
               alert("系统繁忙或未登录，请稍后再试或登录");  
           }
    });
 }
 }
    }
    </script> 
</body>
</html>
    </#escape>
</#compress>
