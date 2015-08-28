<#compress>
    <#escape x as x?html>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>呼叫中心-跟踪交易-录入</title>
            <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
            <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/call_tracking_fill.css">
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
                        <#if "${orderInfo}">
                            <div class="rside">
                                <p class="back"><a href="javascript:history.go(-1)">返回</a></p>
                                <div class="track_info">
                                    <div class="table clearfix">
                                        <div class="lside_info">
                                            <p class="code">发货编码：<span>${orderInfo.order.orderNo}</span></p>
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
                                                    <td width="50"><img src="http://192.168.2.50:8089/statics/images/r1.png" alt=""></td>
                                                    <td width="85" class="title"><span><#if orderInfo.order.arrivalProvince??>
                                        <#if orderInfo.order.arrivalProvince!=110000&&orderInfo.order.arrivalProvince!=310000&&orderInfo.order.arrivalProvince!=120000&&orderInfo.order.arrivalProvince!=500000>
                                            ${dict("citryMap",orderInfo.order.arrivalCity)}
                                        <#else>
                                            ${dict("citryMap",orderInfo.order.arrivalProvince)}
                                        </#if>
                                    </#if></span></td>
                                                </tr>
                                                <tr>
                                                    <td height="20">${dict("citryMap",orderInfo.order.county)}</td>
                                                    <td></td>
                                                    <td>${dict("citryMap",orderInfo.order.arrivalCounty)}</td>
                                                </tr>
                                                <tr>
                                                    <td>${orderInfo.order.sendTime?string("MM月dd日")}</td>
                                                    <td></td>
                                                    <td>${orderInfo.order.arrivalTime?string("MM月dd日")}</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="rside_info">
                                            <p class="title">成交时间:&nbsp&nbsp${orderInfo.order.ensureTradeTime?string("YYYY年MM月dd日")}</p>
                                            <p class="price">价格:&nbsp&nbsp${(orderInfo.order.money)/100}元/吨 &nbsp&nbsp ${orderInfo.order.count}吨 /${((orderInfo.order.square/orderInfo.order.weight)*orderInfo.order.count)?int}立方&nbsp&nbsp&nbsp&nbsp总价&nbsp&nbsp${(orderInfo.order.money)/100*orderInfo.order.count}元</p>
                                            <p clas="introduce">车型要求:&nbsp&nbsp
                                                <#if orderInfo.order.carLength==0>其它车长
                                                    <#elseif orderInfo.order.carLength==1>9.6米
                                                        <#elseif orderInfo.order.carLength==2>13米
                                                            <#elseif orderInfo.order.carLength==3>17.5米
                                                                <#elseif orderInfo.order.carLength==4>不限车长
                                                                    <#else>
                                                </#if>
                                                &nbsp&nbsp
                                                <#if orderInfo.order.carType==0>其它车型
                                                    <#elseif orderInfo.order.carType==7>箱式车
                                                        <#elseif orderInfo.order.carType==1>平板车
                                                            <#elseif orderInfo.order.carType==4>不限车型
                                                                <#elseif orderInfo.order.carType==11>高栏车
                                                                    <#else>
                                                </#if>
                                                <br>发货&nbsp${orderInfo.companyInfo.fhds} 笔&nbsp 装货率&nbsp ${orderInfo.companyInfo.zhl}% &nbsp 结款率 &nbsp${orderInfo.companyInfo.jkl}%</p>
                                        </div>
                                    </div>
                                    <div class="info">
                                        <ul class="clearfix ul_1">
                                            <li><b>${orderInfo.companyInfo.companyName}
                             </b><span class="past"> <#if orderInfo.companyInfo.yyzzsfrz== 0 >
                                          未认证
                                    <#elseif orderInfo.companyInfo.yyzzsfrz== 1  >
            认证中
                                    <#elseif orderInfo.companyInfo.yyzzsfrz ==  2 >
                                    未通过
                                    <#elseif orderInfo.companyInfo.yyzzsfrz == 10>
            已认证
                                    <#else>
                                        未认证
                                    </#if></span> </li>
                                            <li class="li_1"><strong>${orderInfo.companyInfo.linkMobile}</strong> </li>
                                            <li class="li_2">信用：发货${orderInfo.companyInfo.fhds}次 &nbsp&nbsp&nbsp&nbsp 装货率${orderInfo.companyInfo.zhl}%&nbsp&nbsp&nbsp&nbsp 结款率${orderInfo.companyInfo.jkl}% </li>
                                            <li class="li_3">注册时间：<span>${orderInfo.shipUser.operateTime?string("YYYY年MM月dd日")}</span></li>
                                        </ul>
                                        <ul class="clearfix">
                                            <li>总运量：暂无数据</li>
                                            <li class="li_4">偏好：暂无数据</li>
                                            <li class="li_5">最大装载量 ：暂无数据</li>
                                        </ul>
                                    </div>
                                    <div class="info">
                                        <ul class="clearfix ul_1">
                                            <li><b>${orderInfo.driver.driverName}
                             </b><span class="past"> <#if orderInfo.driver.sfzsfrz == 0 && orderInfo.driver.jszsfrz == 0 && orderInfo.driver.xszsfrz == 0>
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
                                    </#if></span> </li>
                                            <li class="li_1"><strong>${orderInfo.driver.mobile}</strong></li>
                                            <li class="li_2">信用：拉货${orderInfo.driver.jhds}次 &nbsp&nbsp&nbsp&nbsp 装货率${orderInfo.driver.zhl}%&nbsp&nbsp&nbsp&nbsp 结款率${orderInfo.driver.jkl}% </li>
                                            <li class="li_3">注册时间：<span>${orderInfo.driverUser.operateTime?string("YYYY年MM月dd日")}</span></li>
                                        </ul>
                                        <ul class="clearfix">
                                            <li>总运量：暂无数据</li>
                                            <li class="li_4">偏好：暂无数据</li>
                                            <li class="li_5">最大装载量 ：暂无数据</li>
                                        </ul>
                                    </div>
                                    <h3> 交易状态</h3>
                                    <#if trackOrder.status==0>
                                     <p class="chose_case">
                                                        <label><input type="radio" name="case" value="0"> &nbsp正常 &nbsp&nbsp&nbsp&nbsp</label>
                                                        <label>
                                                            不正常：</label>
                                                        <label>
                                                            <input type="radio" name="case" value="1">&nbsp货方原因 &nbsp&nbsp&nbsp&nbsp</label>
                                                        <label>
                                                            <input type="radio" name="case" value="2">&nbsp车方原因</label>
                                                    </p>
                                                    <div class="text">
                                                        <textarea name="" id="" cols="140" maxlength="100" rows="5"></textarea>
                                                        <a class="sbmt" href="javascript:void(0);" onclick="save()">保存</a>
                                                    </div>
                                    </#if>
                                    <#if trackOrder.status==1>
                                    <#if trackOrder??>
                                        <p class="chose_case">
                                            <#if trackOrder.orderStatus==0>
                                                <label>
                                                    <input type="radio" checked="checked" name="case" value="0"> &nbsp正常 &nbsp&nbsp&nbsp&nbsp</label>
                                                <label>
                                                    不正常：</label>
                                                <label>
                                                    <input type="radio" name="case" disabled="disabled" value="1">&nbsp货方原因 &nbsp&nbsp&nbsp&nbsp</label>
                                                <label>
                                                    <input type="radio" name="case" disabled="disabled" value="2">&nbsp车方原因</label>
                                        </p>
                                        <div class="text">
                                            <textarea name="" id="" cols="140"  disabled="disabled" rows="5">正常</textarea>
                                           
                                        </div>
                                        <#elseif trackOrder.orderStatus==1>
                                            <p class="chose_case">
                                                <input type="radio" name="case" disabled="disabled" value="0"> &nbsp正常 &nbsp&nbsp&nbsp&nbsp</label>
                                                <label>
                                                    不正常：</label>
                                                <label>
                                                    <input type="radio" checked="checked" name="case" value="1">&nbsp货方原因 &nbsp&nbsp&nbsp&nbsp</label>
                                                <label>
                                                    <input type="radio" name="case" disabled="disabled" value="2">&nbsp车方原因</label>
                                            </p>
                                            <div class="text">
                                                <textarea name="" id=""  disabled="disabled"  cols="140" rows="5">${trackOrder.cause}</textarea>
                                            </div>
                                            <#elseif trackOrder.orderStatus==2>
                                                <p class="chose_case">
                                                    <input type="radio" name="case" value="0"> &nbsp正常 &nbsp&nbsp&nbsp&nbsp</label>
                                                    <label>
                                                        不正常：</label>
                                                    <label>
                                                        <input type="radio" name="case" disabled="disabled" value="1">&nbsp货方原因 &nbsp&nbsp&nbsp&nbsp</label>
                                                    <label>
                                                        <input type="radio" checked="checked" name="case" value="2">&nbsp车方原因</label>
                                                </p>
                                                <div class="text">
                                                    <textarea name="" id="" cols="140"  disabled="disabled"  rows="5">${trackOrder.cause}</textarea>
                                              
                                                </div>
                                                <#else> 
                                                    </#if>
                                    </#if>
                                    </#if>
                                </div>
                            </div>
                        </#if>
                </div>
            </div>
            <#include "common/foot.ftl">
                <script>
                $(document).ready(function() {
                    $(".li_7").addClass("active");
                })

                function save() {
                    var caseQ = -1;
                    var cause = $("textarea").val();
                    var checkzone = document.all("case");
                    var found = false;
                    for (var i = 0; i < checkzone.length; i++) {
                        if (checkzone[i].checked) {
                            caseQ = checkzone[i].value;
                        }
                    }
                    if (caseQ == -1) {
                        alert("请选择交易状态");
                        return;
                    }

                    if (caseQ == 1) {
                        if (cause == "") {
                            alert("请填写货方原因");
                            return;
                        }
                    }
                    if (caseQ == 2) {
                        if (cause == "") {
                            alert("请填写车方原因");
                            return;
                        }
                    }
                    $.ajax({
                        url: "/ajax/trackOrderDetailsCause.htm",
                        type: "post",
                        data: {
                            trackOrderId: ${ trackOrder.id }, orderStatus: caseQ,  cause: cause},
                        dataType: "json",
                        success: function(data) {
                            if (data.flag == 1) {
                                alert("保存成功");
                                window.location.href = "/transactionTracking.htm";
                            } else {
                                alert(data.msg);
                            }
                        },
                        error: function(data) {
                            alert('系统繁忙或未登录，请稍后再试或登录');
                        }
                    });

                }
                </script>
        </body>

        </html>
    </#escape>
</#compress>
