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
                <form action="/tradeSure.htm" id="myform" method="get">
                    <input name="page" id="page" type="hidden" value="0">
                    <div class="table" style="height:850px;">
                        <div class="chose clearfix">
                            <ul class="chose_item clearfix">
                                <li><a href="/taskcargo.htm">发布货源</a></li>
                                <li class="l_side"><a href="/pushDealmaking.htm">撮合交易</a></li>
                                <li class="l_side"><a href="/transactionTracking.htm">交易跟踪</a></li>
                                <li class="l_side"><a href="/userinfolist.htm">呼叫接入</a></li><li class="l_side"><a href="/userinfolist.htm">用户认证</a></li><li class="l_side  chose_active"><a href="/tradeSure.htm">交易确认</a></li>
                            </ul>
                        </div>
                        <div class="title">
                            <div class="nav">
                                <input type="text"  id="nav" placeholder="姓名搜索"  name="companyName" id="companyName"><input class="btn" type="submit"  value=" ">
                            </div>
                        </div>
                        <div class="item">
                            <table border='1' cellspacing="0" rules="all">
                                <thead>
                                    <tr>
                                        <th width="14%">货源编号</th>
                                        <th width="18%">姓名</th>
                                        <th width="8%">货物类型</th>
                                        <th width="8%">出发地</th>
                                        <th width="8%">目的地</th>
                                        <th width="9%">单价</th>
                                        <th width="12%">重量</th>
                                        <th width="6%">总价</th>
                                        <th width="12%">接货日期</th>
                                        <th width="5%">申请量</th>
                                    </tr>
                                </thead>
                                <tbody>
                                            <#if cargoList??>
                     <#list cargoList as cargo>
                                    <tr>
                                        <td style="text-align:center"> ${cargo.cargoNo} </td>
                                        <td style="padding-left:5px;">${cargo.companyName}</td>
                                        <td style="padding-left:15px;">${cargo.cargoName}</td>
                                        <td style="padding-left:10px;"> <#if cargo.province != 110000 && cargo.province != 120000
          && cargo.province != 310000 && cargo.province != 500000 >
          ${dict("citryMap",cargo.city)}
         <#else>
          ${dict("citryMap",cargo.province)}
         </#if></td>
                                        <td style="padding-left:5px;">
                                        <#if cargo.arrivalProvince != 110000 && cargo.arrivalProvince != 120000
          && cargo.arrivalProvince != 310000 && cargo.arrivalProvince != 500000 >
          ${dict("citryMap",cargo.arrivalCity)}
         <#else>
          ${dict("citryMap",cargo.arrivalProvince)}
         </#if></td>
                                        <td style="padding-left:8px;">${cargo.quote/100}元/吨</td>
                                        <td style="padding-left:8px;">${cargo.weight}吨&nbsp&nbsp${cargo.square?round}立方</td>
                                        <td style="text-align:center">${cargo.weight*cargo.quote/100}元</td>
                                        <td style="padding-left:5px;">
                                            ${cargo.sendTime?string("YYYY年MM月dd日")}
                                        </td>
                                        <td style="text-align:center">
                                        <#if cargo.ordersCount&gt;0>
                                            <a style="color:#faa43e;" href="javascript:void(0);" onclick="javascript:window.location.href='/tradeSureDetail.htm?id=${cargo.id}&operationType=2'">${cargo.ordersCount!0}</a>
                                            <#else>
                                            0</#if>
                                        </td>
                                        </#list>
                             <#else>
                                    </tr>   
                                     </#if>     
                                </tbody>
                            </table>
                        </div>
                    </div>      <#if pageSum gte 1>
                          <div class="page clearfix" style="text-align:right;line-height: 25px;right:15px;bottom:-25px;"> <ul class="clearfix">
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
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/20)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                           
                        </div>
                         </#if>
            </div>
            </form>
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">&copy 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
        </div>
    </div>
    <script>
    $(document).ready(function() {
    $(".li_7").addClass("active");
        $(".table .title a").on('click', function() {
            $(this).addClass("active").siblings().removeClass("active");
        });
             document.onkeydown = function(event) {
        var e = event ? event : (window.event ? window.event : null);
        if (e.keyCode == 13) navName()
    };    
    })


    function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        $("#companyName").val('${companyName}');
        return false;
    }
    </script>
</body>

</html>

    </#escape>
</#compress>
