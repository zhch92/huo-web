<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>业务管理--交易详情</title>
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
    <div class="content ">
        <div class="main clearfix">
              <#include "common/leftbar.ftl">
               <#if "${orderInfo}">
            <div class="rside">
                <div class="record">
                    <p class="title">交易编号：${orderInfo.order.orderNo}<a href="javascript:history.go(-1)">返回</a></p>
                    <div class="table_3 clearfix">
                        <div class="table_l">
                            <table>
                                <tr>
                                    <td width="80"><span>
                                        	<#if orderInfo.order.province??>
	                            		<#if orderInfo.order.province!=110000&&orderInfo.order.province!=310000&&orderInfo.order.province!=120000&&orderInfo.order.province!=500000>
	                            			${dict("citryMap",orderInfo.order.city)}
	                            		<#else>
	                            			${dict("citryMap",orderInfo.order.province)}
	                            		</#if>
	                            	</#if>
                                    
                                    </span></td>
                                    <td width="60"><img src="http://192.168.2.50:8089/statics/images/r.png" alt=""></td>
                                    <td><span>
                                    <#if orderInfo.order.arrivalProvince??>
	                            		<#if orderInfo.order.arrivalProvince!=110000&&orderInfo.order.arrivalProvince!=310000&&orderInfo.order.arrivalProvince!=120000&&orderInfo.order.arrivalProvince!=500000>
	                            			${dict("citryMap",orderInfo.order.arrivalCity)}
	                            		<#else>
	                            			${dict("citryMap",orderInfo.order.arrivalProvince)}
	                            		</#if>
	                            	</#if>
                                    </span></td>
                                </tr>
                                <tr>
                                    <td>${dict("citryMap",orderInfo.order.county)}</td>
                                    <td></td>
                                    <td>${dict("citryMap",orderInfo.order.arrivalCounty)}</td>
                                </tr>
                                <tr>
                                    <td>${orderInfo.order.sendTime?string("MM月dd日")}</td>
                                    <td></td>
                                    <td>${orderInfo.order.arrivalTime?string("MM月dd日")}</td>
                                </tr>
                            </table>
                            <p>车型要求：&nbsp&nbsp
                             <#if orderInfo.order.carLength==0>其它车长
                                  <#elseif orderInfo.order.carLength==1>9.6米
                                   <#elseif orderInfo.order.carLength==2>13米
                                    <#elseif  orderInfo.order.carLength==3>17.5米
                                     <#elseif orderInfo.order.carLength==4>不限车长
                                 <#else></#if>         
                             &nbsp&nbsp
                               <#if orderInfo.order.carType==0>其它车型
                                  <#elseif orderInfo.order.carType==7>箱式车
                                   <#elseif orderInfo.order.carType==1>平板车
                                    <#elseif orderInfo.order.carType==4>不限车型
                                     <#elseif orderInfo.order.carType==11>高栏车
                                 <#else></#if>
                             </p>
                            <p>发货&nbsp${orderInfo.companyInfo.fhds} 笔&nbsp 装货率&nbsp ${orderInfo.companyInfo.zhl}% &nbsp 结款率 &nbsp${orderInfo.companyInfo.jkl}%</p>
                            <p>备注：${orderInfo.order.remark}</p>
                        </div>
                        <div class="table_m">
                            <!-- <p>结款时间：${orderInfo.order.ensureTradeTime}</p> -->
                             <p>货主报价：${(orderInfo.order.quote)/100}元/吨 &nbsp&nbsp ${orderInfo.order.weight}吨 /${orderInfo.order.square?int}立方&nbsp&nbsp&nbsp&nbsp总价&nbsp&nbsp${(orderInfo.order.quote)/100*orderInfo.order.weight}元</p>
                          <p>成交单价：${(orderInfo.order.money)/100}元/吨 &nbsp&nbsp ${orderInfo.order.count}吨 /${((orderInfo.order.square/orderInfo.order.weight)*orderInfo.order.count)?int}立方&nbsp&nbsp&nbsp&nbsp总价&nbsp&nbsp${(orderInfo.order.money)/100*orderInfo.order.count}元</p>
                            <p></p>
                            <p> </p>
                           
                        </div>
                        <!-- <div class="table_r">
                            <table>
                               
                            </table>
                        </div> -->
                       
                    </div>
                     <div class="info">
                        <ul class="clearfix ul_1">
                            <li class="add_2"><b>${orderInfo.companyInfo.companyName}  </b><span class="unpast">
                             <#if orderInfo.companyInfo.yyzzsfrz== 0 >
                                          未认证
                                    <#elseif orderInfo.companyInfo.yyzzsfrz== 1  >
            认证中
                                    <#elseif orderInfo.companyInfo.yyzzsfrz ==  2 >
                                    未通过
                                    <#elseif orderInfo.companyInfo.yyzzsfrz == 10>
            已认证
                                    <#else>
                                        未认证
                                    </#if>
                            </span> </li>
                            <li class="li_7_add"><strong>${orderInfo.companyInfo.linkMobile}</strong></li>
                           
                        </ul>
                        <ul class="clearfix">
                         <li class="add_2">信用：<span>发货${orderInfo.companyInfo.fhds}次 &nbsp&nbsp&nbsp&nbsp  装货率${orderInfo.companyInfo.zhl}%&nbsp&nbsp&nbsp&nbsp   结款率${orderInfo.companyInfo.jkl}% </span></li>
                            <li class="add_2">注册时间：<span>${orderInfo.shipUser.operateTime?string("YYYY年MM月dd日")}</span></li>
                            <li class="add_2">&nbsp</li>
                            <li class="add_2">总运量：<span>暂无数据</span></li>
                            <li class="add_2">偏好：暂无数据</li>
                            <li class="add_2">最大装载量 ：暂无数据</li>
                        </ul>
                    </div>
                   <div class="info">
                        <ul class="clearfix ul_1">
                            <li class="add_2"><b>${orderInfo.driver.driverName} </b><span class="unpast">
                           <#if orderInfo.driver.sfzsfrz == 0 && orderInfo.driver.jszsfrz == 0 && orderInfo.driver.xszsfrz == 0>
                                          未认证
                                    <#elseif orderInfo.driver.sfzsfrz == 1 || orderInfo.driver.jszsfrz == 1 || orderInfo.driver.xszsfrz == 1 >
            认证中
                                    <#elseif orderInfo.driver.sfzsfrz == 10 && orderInfo.driver.jszsfrz == 10 && orderInfo.driver.xszsfrz == 2>
                                    未通过
                                    <#elseif orderInfo.driver.sfzsfrz == 10 && orderInfo.driver.jszsfrz == 2 && orderInfo.driver.xszsfrz == 10 >
                                    未通过
                                    <#elseif orderInfo.driver.sfzsfrz == 2 && orderInfo.driver.jszsfrz == 10 && orderInfo.driver.xszsfrz == 10>
                                    未通过
                                    <#elseif orderInfo.driver.sfzsfrz == 10 && orderInfo.driver.jszsfrz == 10 && orderInfo.driver.xszsfrz == 10>
            已认证
                                    <#else>
                                    认证中
                                    </#if>
                            </span> </li>
                            <li class="li_7_add"><strong>${orderInfo.driver.mobile}</strong></li>
                            <li class="li_6">当前位置: <#if locationCity??>
                                ${locationCity}
                                <#else>
                                暂无数据
                                  </#if>
                                  </li>
                          
                        </ul>
                        <ul class="clearfix">
                          <li class="add_2">信用：<span>拉货${orderInfo.driver.jhds}次 &nbsp&nbsp&nbsp&nbsp  装货率${orderInfo.driver.zhl}%&nbsp&nbsp&nbsp&nbsp   结款率${orderInfo.driver.jkl}%             </span></li>
                            <li class="add_2">注册时间：<span>${orderInfo.driverUser.operateTime?string("YYYY年MM月dd日")}</span></li>
                            <li class="add_2">&nbsp</li>
                            <li class="add_2">总运量: 暂无数据</li>
                            <li class="add_2">偏好：暂无数据</li>
                            <li class="add_2">最大装载量 ：暂无数据</li>
                        </ul>
                    </div>
                </div>
            </div>
              </#if>
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
        </div>
    </div>
<script type="text/javascript">
$(document).ready(function () {
	  $(".li_2").addClass("active");
});
</script>
</body>

</html>
