<#compress>
    <#escape x as x?html>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>呼叫中心-跟踪交易-录入</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/trade_sure_detail.css">
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
                <div class="track_info">
                    <div class="table clearfix">
            <#if cargo??>
                        <div class="lside_info">
                            <p class="code">发货编码：<span>${cargo.cargoNo}</span></p>
                            <table>
                                <tr>
                                    <td width="80"><span> <#if cargo.province != 110000 && cargo.province != 120000
          && cargo.province != 310000 && cargo.province != 500000 >
           ${dict("citryMap",cargo.city)}
         <#else>
          ${dict("citryMap",cargo.province)} 
         </#if></span></td>
                                    <td width="50"><img src="http://192.168.2.50:8089/statics/images/r1.png" alt=""></td>
                                    <td width="85" class="title"><span> <#if cargo.arrivalProvince != 110000 && cargo.arrivalProvince != 120000
          && cargo.arrivalProvince != 310000 && cargo.arrivalProvince != 500000 >
           ${dict("citryMap",cargo.arrivalCity)} 
         <#else>
          ${dict("citryMap",cargo.arrivalProvince)}
         </#if></span></td>
                                </tr>
                                <tr>
                                    <td height="20">${dict("citryMap",cargo.county)}</td>
                                    <td></td>
                                    <td>${dict("citryMap",cargo.arrivalCounty)}</td>
                                </tr>
                            </table>
                            <p>接货日期：<#if cargo.sendTime??>${cargo.arrivalTime?string(" YYYY年MM月dd日")}<#else>&nbsp;</#if></p>
                            <p style="margin-top:20px;">备注：
                            <#if cargo.remark !=''>${cargo.remark}
                            <#else>
                            无
                            </#if>
                            </p>
                        </div>
                        <div class="rside_info" style="padding-top:25px;">
                            <p class="price">货物类型 : ${cargo.cargoName}&nbsp&nbsp 价格:${cargo.quote/100}元/吨 &nbsp&nbsp ${cargo.weight}吨 / ${cargo.square}立方&nbsp&nbsp</p>
                            <p clas="introduce">车型要求:&nbsp&nbsp &nbsp&nbsp
                                  <#if cargo.carLength==0>其它车长
                                  <#elseif cargo.carLength==1>9.6米
                                   <#elseif cargo.carLength==2>13米
                                    <#elseif  cargo.carLength==3>17.5米
                                     <#elseif cargo.carLength==4>不限车长
                                 <#else></#if>                                             
                                                                            &nbsp&nbsp 
                              <#if cargo.carType==0>其它车型
                                  <#elseif cargo.carType==7>箱式车
                                   <#elseif cargo.carType==1>平板车
                                    <#elseif cargo.carType==4>不限车型
                                     <#elseif cargo.carType==11>高栏车
                                 <#else></#if>
                                <br>发货${cargo.fhdsStr}笔 &nbsp 装货率&nbsp ${cargo.zhlStr}% &nbsp 结款率&nbsp${cargo.jklStr}%</p>
                        </div>
                        </#if>
                      </div>
                    <h3>司机信息</h3>
                    <table border="1" cellspacing="0" rules="all">
                        <thead>
                            <tr>
                                <th width="7%">姓名</th>
                                <th width="8%">车牌</th>
                                <th width="11%">电话</th>
                                <th width="7%">车型</th>
                                <th width="7%">车长</th>
                                <th width="25%">信用</th>
                                <th width="8%">单价</th>
                                <th width="9%">总价</th>
                                <th width="12%">重量</th>
                                <th width="7%">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <#if cargo.ordersList?? && cargo.ordersList?size gt 0>
                                <#list cargo.ordersList as orders>
                            <tr>
                                <td style="text-align:center"> ${orders.driverName}</td>
                                <td style="padding-left:10px;"><#if orders.applyUserType == 1>${orders.driverCarNo}<#else>&nbsp;</#if></td>
                                <td style="padding-left:10px;">${orders.driverphone}</td>
                                <td style="padding-left:5px;"><#if cargo.carType==0>其它车型
                                   <#elseif cargo.carType==7>箱式车
                                   <#elseif cargo.carType==1>平板车
                                   <#elseif cargo.carType==4>不限车型
                                   <#elseif cargo.carType==11>高栏车
                                 <#else></#if></td>
                                <td style="padding-left:5px;">      
                                <#if cargo.carLength==0>其它车长
                                   <#elseif cargo.carLength==1>9.6米
                                   <#elseif cargo.carLength==2>13米
                                   <#elseif  cargo.carLength==3>17.5米
                                   <#elseif cargo.carLength==4>不限车长
                                 <#else></#if></td>
                                <td style="padding-left:8px;">拉货${orders.driverfhdsStr}笔 &nbsp&nbsp装货率${orders.driverzhlStr}%&nbsp&nbsp  结款率${orders.driverjklStr}%</td>
                                <td style="padding-left:8px;">${orders.money/100}元/吨</td>
                                <td style="text-align:center">${orders.total/100}元</td>
                                <td style="padding-left:10px;">${orders.count}吨&nbsp&nbsp${((orders.square/orders.weight)*orders.count)?round}立方
                                </td>
                                <td style="text-align:center">
                                    <a id="s${orders.id}" style="color:#faa43e;" href="javascript:void(0);" onclick="sureTared(${orders.id},${orders.shipperUserId})">确认交易</a>
                                </td>
                              </#list></#if>
                            </tr>
                        </tbody>
                    </table>
                </div>
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
        })
        function sureTared(ordersId,userId){
   if(confirm("确认交易？")){
    $("#s"+ordersId).removeAttr("onclick");
        $.ajax({
        url:"/ajax/adminAgreeCargoTrade.htm",
        type:"post",
        data:{ordersId:ordersId,userId:userId},
        dataType:"json",
        success:function(data){
               if(data.flag==1){
                    alert("达成交易");
                    $("#s"+ordersId).text('达成交易');
                    window.location.href="/tradeSure.htm";  
               }else{
               alert(data.msg);
               }
        },error:function(data){
        alert('系统繁忙，请稍后再试');
        }
        })
         }
        }
       
        </script>
</body>

</html>

    </#escape>
</#compress>
