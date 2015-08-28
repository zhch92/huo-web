<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>用户管理--企业详细信息</title>
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
                <div class="table" >
                   <p class="back"><a href="javascript:history.go(-1)">返回</a></p>
                    <div class="table_complain table_active" style="position:relative">
                        <div class="info">
                         <#if user.companyInfo??>
                            <ul class="clearfix ul_1">
                                <li  class="li_7_add"><b>${user.companyInfo.companyName}
                             </b><span class="unpast">
                              <#if user.companyInfo.yyzzsfrz == 0 >
                                          未认证
                                    <#elseif user.companyInfo.yyzzsfrz == 1  >
			认证中
									<#elseif user.companyInfo.yyzzsfrz  ==  2 >
									未通过
                                    <#elseif user.companyInfo.yyzzsfrz == 10>
			已认证
									<#else>
								        未认证
                                    </#if>
                             </span> </li>
                                <li  class="li_7_add"><strong>
								
								<#if Session["用户管理-企业-电话"]==1>
									${user.companyInfo.linkMobile}
									 <#else>
									${(user.companyInfo.linkMobile)[0..2]}****${(user.companyInfo.linkMobile)[8..10]}
									</#if>
								</strong></li> 
                            </ul>
                            <ul class="clearfix">
                            <li class="add_2">信用：发货${user.companyInfo.fhds}次&nbsp&nbsp装货率
                                 <#if user.companyInfo.fhds == 0 >
                                  100%&nbsp&nbsp结款率100%
                                <#else>
                  ${user.companyInfo.zhl}%&nbsp&nbsp结款率${user.companyInfo.jkl}%
                                    </#if>
                                <li class="add_2">注册时间：<span>${user.operateTime?string("YYYY年MM月dd日")}</span></li>
                                 <li class="add_2">&nbsp</li>
                                <li class="add_2">总运量：暂无数据</li>

                                <li  class="add_2">偏好：暂无数据</li>
                                <li  class="add_2">最大装载量 ：暂无数据</li>
                            </ul>
                            </#if>
                        </div>
                     <form action="/usermanagementcomp.htm" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <input name="uid" id="uid" type="hidden" value="${user.id}">
                        <table border="1" cellspacing="0" rules="all">
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
                            		  <td><#if orders.ensureTradeTime??>${orders.ensureTradeTime?string("YYYY年MM月dd日")}<#else>&nbsp;</#if></td>
                            	</#if>
                                    <td  style="padding-left:15px;text-align:left;">${orders.cityStr}</td>
                                    <td  style="padding-left:15px;text-align:left;">${orders.arrivalCityStr}</td>
                                    <td  style="padding-left:30px;text-align:left;">${orders.count}吨/${((orders.square/orders.weight)*orders.count)?int}方</td>
                                    <td  style="padding-left:20px;text-align:left;">${orders.money/100}元/吨</td>
                                    <td  style="padding-left:30px;text-align:left;">${orders.total/100}元</td>
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
                                 <tr><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td></tr>
                              </#if>    
                            </tbody>
                        </table>
                            <#if pageSum gte 1>
                       <div class="page clearfix" style="text-align:right;line-height: 25px;">
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/12)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
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
    function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    }
    </script>
</body>

</html>
