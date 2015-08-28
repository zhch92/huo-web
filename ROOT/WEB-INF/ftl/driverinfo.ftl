<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>用户管理--司机详细信息</title>
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
                <p class="back"><a href="javascript:history.go(-1)">返回</a></p>
                    <div class="table_complain table_active" style="position:relative">
                        <div class="info">
                         <#if user.driver??>
                            <ul class="clearfix ul_1">
                                <li class="li_7_add"><b>${user.driver.driverName}
                             </b><span class="unpast">
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
                             </span> </li>
                                <li class="li_7_add"><strong>
								<#if Session["用户管理-司机-电话"]==1>
									${user.driver.mobile}
									 <#else>
									${(user.driver.mobile)[0..2]}****${(user.driver.mobile)[8..10]}
									</#if>
								</strong></li>
                                <li class="li_6">当前位置: 
                                <#if locationCity??>
                                ${locationCity}&nbsp&nbsp${locationTime}
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
                            <li class="add_2">信用：发货${user.driver.jhds}次&nbsp&nbsp&nbsp装货率
                                 <#if user.driver.jhds == 0 >
                                  100%&nbsp&nbsp&nbsp交付率100%
                                <#else>
                  ${user.driver.zhl}%&nbsp&nbsp交付率${user.driver.jkl}%
                                    </#if>
                                </li>
                                <li class="add_2">注册时间：<span>${user.driver.operateTime?string("YYYY年MM月dd日")}</span></li>
                                <li class="add_2">总运量：${user.driver.jhds}次</li>
                                <li class="add_2">偏好：暂无数据</li>
                                <li class="add_2">最大装载量 ：暂无数据</li>
                            </ul>
                            </#if>
                        </div>
                                  <div class="bank">开户行
                    <#if user.driver.yhkh??  && user.driver.yhkh!="">:
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
              
                    &nbsp&nbsp卡号:&nbsp&nbsp<strong style="color:#feb35a;">${user.driver.yhkh}</strong>
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
                     <form action="/usermanagementdriver.htm" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <input name="uid" id="uid" type="hidden" value="${user.id}">
                        <table border="1" cellspacing="0" rules="all" style="margin-top:30px;">
                            <thead>
                                <tr>
                                    <th width="16%">交易编号</th>
                                    <th width="13%"><span>成交时间<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="10%"><span>出发地<a class="down_1" href="#"></a></span></th>
                                    <th width="10%"><span>目的地<a class="down_1" href="#"></a></span></th>
                                    <th width="13%"><span>重量<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="11%"><span>单价<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="14%"><span>总价<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="13%"><span>状态<a class="down_1" href="#"></a></span></th>
                                </tr>
                            </thead>
                            <tbody>
                                  <#if orderslist??>
                        <#list orderslist as orders>
                                <tr>
                                    <td>${orders.orderNo}</td>
                                        <#if orders.status==5>
                                          <td>--</td>
                                        <#else> 
                                  <#if orders.ensureTradeTime??>
                            <td>${orders.ensureTradeTime?string("YYYY年MM月dd日")} </td>
                                    <#else> <td> -- </td>
                                  </#if>
                                
                            	</#if>
                                    <td style="padding-left:10px;text-align:left;">${orders.cityStr}</td>
                                    <td style="padding-left:10px;text-align:left;">${orders.arrivalCityStr}</td>
                                    <td style="padding-left:10px;text-align:left;">${orders.count}吨/${((orders.square/orders.weight)*orders.count)?int}方</td>
                                    <td style="padding-left:10px;text-align:left;">${orders.money/100}元/吨</td>
                                    <td style="padding-left:30px;text-align:left;">${orders.total/100}元</td>
                                    <td  style="padding-left:30px;text-align:left;"><a href="#"><span>
                                     <#if orders.status==5>
                                         申请中
                                     <#elseif orders.status==-2>
                                     取消交易
                                         <#elseif orders.status==-4>
                                    申请失败
                                         <#elseif orders.status==100>
                                          <#if orders.dispute==1>
                                          司机装货投诉
                                          <#elseif orders.dispute==2>
                                               司机结款投诉
                                           <#elseif orders.dispute==5>
                                             货主装货投诉
                                            <#elseif orders.dispute==6>
                                                  货主结款投诉
                                           <#else>
                            		   交易中
                            	</#if>
                                 
                                         <#elseif orders.status==101>
                              交易完成
                                         <#elseif orders.status==-2>
                                     取消交易
                                        <#else>
                            		  无
                            	</#if>
                                   </span></a></td>
                                </tr>
                                    
                         </#list>
                         <#else>
                                <tr><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td>
                              </#if>    
                            </tbody>
                        </table>
                            <#if pageSum gte 1>
                        <div class="page clearfix" style="text-align:right;line-height: 25px;">
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/14)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                            <ul class="clearfix">
                              <#if page != 0 >
                                <li class="home" >
                                    <a href="javascript:;" onclick="javascript:goPage(0)">&nbsp;&nbsp;</a>
                                </li>
                                 </#if>
                                  <#if page-1 gte 0 >
                                <li class="pgup"  >
                                    <a href="javascript:;" onclick="javascript:goPage(${page}-1)">&nbsp;&nbsp;</a>
                                </li>
                                  </#if>
                                <#if page+1 lte pageSum >
                                <li class="end" >
                                    <a href="javascript:;" onclick="javascript:goPage(${page}+1)">&nbsp;&nbsp;</a>
                                </li>
                                 </#if>
                                 <#if page != pageSum >
                                <li class="pgdn" >
                                    <a href="javascript:;" onclick="javascript:goPage(${pageSum})">&nbsp;&nbsp;</a>
                                </li>
                                  </#if>
                            </ul>
                        </div>
                         </#if>
                         </form>
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
    <script type="text/javascript">
    $(document).ready(function () {
    	$(".li_1").addClass("active");
        $("#page").val('${page}');
    });
    // 银行卡只能输入数字
     // window.onload =function() {
     //        document.getElementById("bankNuber").onkeyup =function() {
     //              this.value =this.value.replace(/\s/g,'').replace(/\D/g,'').replace(/(\d{4})(?=\d)/g,"$1 ");;
     //        };
     //    };
    function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    };
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
