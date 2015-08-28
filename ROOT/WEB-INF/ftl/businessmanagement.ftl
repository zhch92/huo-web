<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>操作中心--交易投诉</title>
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
            <div class="rside">
                <div class="record">
                    <p class="title">交易编号：${orders.orderNo} <a href="javascript:history.go(-1)">返回</a></p>
                    <div class="table_3 clearfix">
                        <div class="table_l">
                            <table>
                                <tr>
                                    <td width="80"><span>${orders.cityStr}</span></td>
                                    <td width="60"><img src="http://192.168.2.50:8089/statics/images/r.png" alt=""></td>
                                    <td><span>${orders.arrivalCityStr}</span></td>
                                </tr>
                                <tr>
                                    <td>${orders.countyStr}</td>
                                    <td></td>
                                    <td>${orders.arrivalCountyStr}</td>
                                </tr>
                                <tr>
                                    <td>${orders.sendTimeStr}</td>
                                    <td></td>
                                    <td>${orders.arrivalTimeStr}</td>
                                </tr>
                            </table>
                            <p>车型要求：&nbsp&nbsp
                              <#if  orders.carLength==0>其它车长
                                  <#elseif  orders.carLength==1>9.6米
                                   <#elseif  orders.carLength==2>12米
                                    <#elseif   orders.carLength==3>17.5米
                                     <#elseif orders.carLength==4>不限车长
                                 <#else></#if> 
                           
                             <#if orders.carType==0>其它车型
                                  <#elseif orders.carType==7>箱式车
                                   <#elseif orders.carType==1>平板车
                                    <#elseif orders.carType==4>不限车型
                                     <#elseif orders.carType==11>高栏车
                                 <#else></#if>
                            &nbsp&nbsp 
                           
                           </p>
                            <p>发货${orders.fhdsStr}笔 &nbsp&nbsp 装货率 &nbsp&nbsp${orders.zhlStr}% &nbsp&nbsp 结款率 &nbsp&nbsp ${orders.jklStr}%</p>
                            <p>出发地：${orders.cityStr}${orders.countyStr}${orders.startAdd} </p>
                            <p>目的地：${orders.arrivalCityStr}${orders.arrivalCountyStr}${orders.arrivalAdd}</p>
                        </div>
                        <div class="table_m">
                            <p>结款时间：${orders.ensureTradeTime}</p>
                            <p>价格：${orders.money/100}元/吨 &nbsp&nbsp${orders.count}吨 / ${(orders.square/orders.weight)*orders.count}立方</p>
                            <p>投诉时间：2015年5月6日 &nbsp&nbsp 10:20</p>
                            <p>投诉：车方/ 装货投诉 </p>
                        </div>
                        <div class="table_r">
                            <table>
                                <tr>
                                    <td width="60">投诉记录:</td>
                                    <td>2015年5月6日</td>
                                    <td>货方/装货投诉</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>2015年5月6日</td>
                                    <td>货方/装货投诉</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>2015年5月6日</td>
                                    <td>货方/装货投诉</td>
                                </tr>
                            </table>
                        </div>
                        <div class="bttn">
                            <button class="back">撤销</button>
                            <button class="past">投诉审核</button>
                        </div>
                    </div>
                    <div class="info">
                        <ul class="clearfix ul_1">
                            <li><b>${orders.driver.driverName}</b><span class="unpast">
                           <#if orders.driver.sfzsfrz == 0 && orders.driver.jszsfrz == 0 && orders.driver.xszsfrz == 0>
                                          未认证
                                    <#elseif orders.driver.sfzsfrz == 1 || orders.driver.jszsfrz == 1 || orders.driver.xszsfrz == 1 >
			认证中
									<#elseif orders.driver.sfzsfrz == 10 && orders.driver.jszsfrz == 10 && orders.driver.xszsfrz == 2>
									未通过
									<#elseif orders.driver.sfzsfrz == 10 && orders.driver.jszsfrz == 2 && orders.driver.xszsfrz == 10 >
									未通过
									<#elseif orders.driver.sfzsfrz == 2 && orders.driver.jszsfrz == 10 && orders.driver.xszsfrz == 10>
									未通过
                                    <#elseif orders.driver.sfzsfrz == 10 && orders.driver.jszsfrz == 10 && orders.driver.xszsfrz == 10>
			已认证
									<#else>
									认证中
                                    </#if>
                            </span> </li>
                            <li class="li_1">${orders.driver.mobile}</li>
                            <li class="li_2">信用：<span>发货${orders.driver.jhds}次   装货率${orders.driver.zhl}%   交付率${orders.driver.jkl}% </span></li>
                            <li class="li_3">注册时间：<span>${orders.registeredTime}</span></li>
                        </ul>
                        <ul class="clearfix">
                            <li>总运量：<span>暂无数据</span></li>
                            <li class="li_4">偏好：暂无数据</li>
                            <li class="li_5">最大装载量 ：暂无数据</li>
                        </ul>
                    </div>
                    <div class="info">
                        <ul class="clearfix ul_1">
              
                                            <li><b>${orders.companyInfo.companyName}</b><span class="unpast">
 <#if orders.companyInfo.yyzzsfrz == 0 >
                                        未认证
                                    <#elseif orders.companyInfo.yyzzsfrz == 1>
			认证中
                                    <#elseif orders.companyInfo.yyzzsfrz== 2>
                                    未通过
                                    <#elseif orders.companyInfo.yyzzsfrz == 10>
  已认证
                                    <#else>
                                    认证中
                                    </#if>      
</span> </li>
                            <li class="li_1">${orders.companyInfo.linkMobile}</li>
                            <li class="li_2">信用：<span>发货${orders.companyInfo.fhds}次   装货率${orders.companyInfo.zhl}%   交付率${orders.companyInfo.jkl}%</span></li>
                            <li class="li_3">注册时间：<span>${orders.registeredcompTime}</span></li>
                        </ul>
                        <ul class="clearfix">
                            <li>总运量：<span>暂无数据</span></li>
                            <li class="li_4">偏好：暂无数据</li>
                            <li class="li_5">最大装载量 ：暂无数据</li>
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
    <div class="lightbox lightbox_1">
        <div class="parent">
            <ul class="clearfix">
                <li class="title">审核投诉意见</li>
                <li><a class="opinion_1" href="#">处理意见1</a></li>
                <li><a href="#">处理意见2</a></li>
                <li><a href="#">处理意见3</a></li>
                <li><a href="#">处理意见4</a></li>
                <li class="last"><a href="#">处理意见5</a></li>
            </ul>
            <div class="text">
                <textarea name="" id="textarea" cols="80" rows="7" onfocus="if(value=='请填写投诉处理说明意见'){value=''}" onblur="if (value==''){value='请填写投诉处理说明意见'}">请填写投诉处理说明意见</textarea>
            </div>
            <p class="bttn">
                <button class="back">取消</button>
                <button class="past">提交申请</button>
            </p>
            <div class="child">
                <p class="title">投诉意见1</p>
                <div class="text_show">
                    <p>中途反回不来拉货</p>
                </div>
                <p class="bttn"><a href="#">返回</a></p>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function () {
  	  $(".li_4").addClass("active");
  });
    </script>
</body>
    
</html>
