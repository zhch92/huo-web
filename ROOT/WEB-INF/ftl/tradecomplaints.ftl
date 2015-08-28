<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title> 操作中心--交易投诉</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css"/>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css"/>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
</head>
<body>

  <div class="header">
        <div class="head">
            <div class="logo"><a href="#"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a></div>
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
							  <li  class="l_side chose_active" id="complain"><a href="/tradecomplaints.htm">交易投诉</a></li>
							<#if Session["操作中心-批量发送短信"]==1><li class="l_side"><a href="/smsbatchsendtoday.htm">批量发送短信</a></li></#if> 
                             
                               
                        </ul>
                    </div>
                      <form action="/tradecomplaints.htm" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0"/>
                     <div class="table_p">
                                            <table border="1" cellspacing="0" rules="all">
                            <thead>
                               <tr>
                                    <th width="15%">交易编号</th>
                                    <th width="15%">成交时间</th>
                                    <th width="11%">出发地</th>
                                    <th width="11%">目的地</th>
                                    <th width="11%">重量</th>
                                    <th width="10%">单价</th>
                                    <th width="10%">总价</th>
                                    <th width="10%">状态</th>
                                    <th width="8%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                             <#if orderslist??>
                        <#list orderslist as orders>
                        <tr>
                                    <td>${orders.orderNo}</td>
                                    <td>${orders.ensureTradeTime?string("YYYY年MM月dd日")}</td>
                                    <td>${orders.cityStr}</td>
                                    <td>${orders.arrivalCityStr}</td>
                                    <td>${orders.weight}吨/${orders.square}方</td>
                                    <td>${orders.quote/100}元</td>
                                    <td>${orders.quote/100*orders.weight}元</td>
              
                                    <td><a href="#"><span>
                                    <#if orders.dispute== 1>
                                      司机发货投诉
                                    <#elseif orders.dispute==2>
			司机结款投诉
                                    <#elseif orders.dispute== 5>
                              货主发货投诉
                                    <#elseif orders.dispute== 6>
货主结款投诉
                                    <#else>
                               无
                                    </#if>
                                    </span></a></td>
                                     <td><a href="javascript:void(0);" onclick="javascript:window.location.href='/tradecomplaintsdetails.htm?ordersid=${orders.id}'" >操 作</a></td>
                                </tr>
                          </#list>
                          <#else>
                        <tr>
                          <td>--</td>
                          <td>--</td>
                          <td>--</td>
                          <td>--</td>
                          <td>--</td>
                          <td>--</td>
                          <td>--</td>
                          <td>--</td>
                          <td>--</td>
                        </tr>
                          </#if>
                            </tbody>
                        </table>
                             <#if pageSum gte 1>
                          <div class="page clearfix" style="text-align:right;line-height: 25px;"> <ul class="clearfix">
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
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/12)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                           
                        </div>
                         </#if>
                    </div>
                          </form>
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