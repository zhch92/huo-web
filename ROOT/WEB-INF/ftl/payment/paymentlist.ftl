<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>业务管理--交易管理</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css">
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
                <div class="table">
                  <form action="/paymentlist.htm" id="myform" method="get">
                    <input name="page" id="page" type="hidden" value="0">
                    <div class="chose clearfix">
                        <ul class="chose_item clearfix">
                              
							  <#if Session["业务管理-货源"]==1><li id="user" ><a href="/cargoList.htm">货源</a></li></#if> 
                            <li id="complain" class="chose_active"><a href="/paymentlist.htm">交易</a></li>
                        </ul>
                        <div class="site">
                            <ul>
                                <li class="inpt">
                                    <input type="text" placeholder="出发地">&nbsp至&nbsp<input type="text" placeholder="目的地">
                                </li>
                                <li id="start" class="time">接货时间</li>
                            </ul>
                        </div>
                        <div class="nav">
                            <input class="btn" type="submit" value=" " style="float:right;"><input class="text" type="text" placeholder="交易编号">
                        </div>
                    </div>
                    <div class="table_user  table_active ">
                        <table border="1" cellspacing="0" rules="all">
                            <thead>
                                   <tr>
                                    <th width="13%">交易编号</th>
                                    <th width="20%">发货方</th>
                                    <th width="5%">承运方</th>
                                    <th width="8%">出发地</th>
                                    <th width="8%">目的地</th>
                                    <th width="8%">数量</th>
                                    <th width="7%">价格</th>
                                    <th width="12%">成交时间</th>
                                    <th width="8%">状态</th>
                                    <th width="4%">操作</th>
                                </tr>

                            </thead>
                            <tbody>
                               <#if paymentList??>
                        <#list paymentList as payment>
                         <tr>
                                    <td>${payment.orderNo} </td>
                                    <td style="padding-left:8px;text-align:left;">${payment.companyName}</td>
                                    <td style="padding-left:8px;text-align:left;">${payment.driverName}</td>
                                    <td style="padding-left:8px;text-align:left;">${payment.cityStr}</td>
                                    <td style="padding-left:8px;text-align:left;">${payment.arrivalCityStr}</td>
                                    <td style="padding-left:4px;text-align:left;">${payment.count}吨/ ${((payment.square/payment.weight)*payment.count)?round}方</td>
                                    <td style="padding-left:4px;text-align:left;">${payment.money/100}元/吨</td>
                                    <td>${payment.ensureTradeTime}</td>
                                    <td>
                                      <#if payment.status==5>
                                       交易中
                                     <#elseif payment.status==-2>
                                     取消交易
                                         <#elseif payment.status==-4>
                                    申请失败
                                         <#elseif payment.status==100>
                                          <#if payment.dispute==1>
                                          司机装货投诉
                                          <#elseif payment.dispute==2>
                                               司机结款投诉
                                           <#elseif payment.dispute==5>
                                             货主装货投诉
                                            <#elseif payment.dispute==6>
                                                  货主结款投诉
                                           <#else>
                            		   交易中
                            	</#if>
                                 
                                         <#elseif payment.status==101>
                              交易完成
                                         <#elseif payment.status==-2>
                                     取消交易
                                        <#else>
                            		  无
                            	</#if>
                            	
                                    </td>
                                     <td><a href="/payment.htm?orderId=${payment.id}">查 看</a> </td>
                                </tr>
                          </#list>
                             <#else>
                             <tr><td>暂无交易</td></tr>
                           </#if>
                            </tbody>
                        </table>
                           <#if pageSum gte 1>
                          <div class="page clearfix" style="text-align:right;line-height: 25px;"><ul class="clearfix">
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
      <script>
      $(document).ready(function () {
    	  $(".li_2").addClass("active");
          $("#page").val('${page}');
      });
      function goPage(i) {
          $("#page").val(i);
          $("#myform").submit();
          return false;
      }
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false

    };
    laydate(start);
    </script>
</body>

</html>
