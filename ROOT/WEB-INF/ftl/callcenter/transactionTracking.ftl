<#compress>
    <#escape x as x?html>
    <!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>呼叫中心-撮合交易</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/help_Trade.css">
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
                        <form action="/transactionTracking.htm" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                <div class="table">
                    <div class="chose  clearfix">
                     <ul class="chose_item clearfix">
                                    <#if Session["呼叫中心-发布货源"]==1><li><a href="/taskcargo.htm">发布货源</a></li></#if>   
                  <#if Session["呼叫中心-撮合交易"]==1><li class="l_side"><a href="/pushDealmaking.htm">撮合交易</a></li></#if> 
                  <li class="l_side chose_active"><a href="/transactionTracking.htm">交易跟踪</a></li>
                  <#if Session["呼叫中心-呼叫接入"]==1><li class="l_side"><a href="#">呼叫接入</a></li></#if> 
                  <#if Session["呼叫中心-用户认证"]==1><li class="l_side"><a href="/userinfolist.htm">用户认证</a></li></#if> 
				  <#if Session["活动列表-确认交易列表"]==1><li class="l_side"><a href="/tradeSure.htm">交易确认</a></li></#if> 
                                    </ul>
                    </div>
                    <div class="title"><div class="nav"><input type="text" placeholder="搜索车方姓名"><input class="btn" type="submit" value=" "></div><a class="active" href="#">所有</a>&nbsp&nbsp|&nbsp&nbsp<a href="#">已处理</a>&nbsp&nbsp|&nbsp&nbsp<a href="#">未处理</a>
                    
                    </div>
                    
                    <div class="item">
                       <table border='1' cellspacing="0" rules="all"> 
                           <thead>
                               <tr>
                                   <th width="7%">交易编号</th>
                                   <th width="21%">发货方</th>
                                   <th width="8%">承运方</th>
                                   <th width="8%">出发地</th>
                                   <th width="8%">目的地</th>
                                   <th width="12%">数量</th>
                                   <th width="8%">价格</th>
                                   <th width="12%">成交时间</th>
                                   <th width="7%">状态</th>
                                   <th width="7%">操作</th>
                               </tr>
                           </thead>
                           <#if trackorderList??>
                            <#list trackorderList as trackOrder>

                           <tbody>
                               <tr>
                                   <td style="text-align:center"> ${trackOrder.orders.orderNo}</td>
                                   <td style="padding-left:5px;">${trackOrder.orders.companyName}</td>
                                   <td style="padding-left:15px;">${trackOrder.orders.driverName}</td>
                                   <td style="padding-left:15px;">${trackOrder.orders.cityStr}</td>
                                   <td style="padding-left:5px;">${trackOrder.orders.arrivalCityStr}</td>
                                   <td style="padding-left:8px;">${trackOrder.orders.tradeNum}/吨${((trackOrder.orders.square/trackOrder.orders.weight)*trackOrder.orders.tradeNum)?int}/立方</td>
                                   <td  style="padding-left:8px;">${trackOrder.orders.unitPrice/100}元/吨</td>
                                   <td style="text-align:center">${trackOrder.orders.createTime?string("YYYY年MM月dd日")}</td>
                                   <td style="padding-left:5px;">
                              <#if trackOrder.orders.dispute==7|| trackOrder.orders.dispute==null||trackOrder.orders.dispute=="">
                              投诉中
                              <#else>
                               <#if trackOrder.orders.status==100>交易中
                                   <#elseif trackOrder.orders.status==101>
                                  交易完成
                                        <#else></#if>
                              </#if>                        
                                   </td>
                                   <td style="text-align:center">
            <#if trackOrder.status==0>
                                    <a  href="javascript:void(0);" onclick="javascript:window.location.href='/transactionTrackingDetails.htm?orderId=${trackOrder.orders.id}&trackOrderId=${trackOrder.id}&status=${trackOrder.status}'">未处理</a>
                                     <#elseif trackOrder.status==1><a style="color:#faa43e;"  href="javascript:void(0);" onclick="javascript:window.location.href='/transactionTrackingDetails.htm?orderId=${trackOrder.orders.id}&trackOrderId=${trackOrder.id}&status=${trackOrder.status}'">已处理</a>
                                 <#else></#if>
                                     </td>
                               </tr>
                           </tbody>
                            </#list>
                           </#if>
                       </table>
                   </div>
                   <#if pageSum gte 1>
                        <div class="page clearfix">
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/15)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
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
                   </div>
            </div>
            </form>
        </div>
    </div>
    <#include "common/foot.ftl">
      <script> 
            $(document).ready(function(){
             $(".table .title a").on('click',function(){
                          $(this).addClass("active").siblings().removeClass("active");
                })
            })
              function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    }
            </script>
</body>

</html>
   
    </#escape>
</#compress>
