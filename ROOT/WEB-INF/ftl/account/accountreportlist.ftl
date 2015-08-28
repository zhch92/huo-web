<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>财务报表_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        #mytable td {
            height: 0px;
        }
        
        .money{
            height: 0px;
            font-size:16px;
            color:red;
        }
        .hgjtitle{
            line-height: 30px;
			font-size: 25px;
			font-family: "微软雅黑";
			margin-left: 10px;
        }
        .hgjtime{
            margin: 60px 17px 0px;
            float:right;
        }
        .hgjnum{
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="main">
<#include "common/top.ftl">
    <div class="context">
    <#include "common/left.ftl">
        <div class="right" style="">
            <div class="righttop">
				财务报表
            </div>
            <div class="rightok">
            	<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                     <tbody>
                    	<tr>
                            <td colspan="4" style="border-bottom: 2px soild;" >
                            	<font class="hgjtitle">金额汇总</font>
                            </td>
                        </tr>
                        <tr>
                            <td >
                        		充值金额：<font class="money">${((report4ACFirstRow['rechargeTotal']!0)/100)?string("##0.##")}</font>
                            </td>
                            <td >
                            	付款总额：<font class="money">${((report4ACFirstRow['paymentTotal']!0)/100)?string("##0.##")}</font>
                            </td>
                            <td >
                            	收款总额：<font class="money">${((report4ACFirstRow['collectionTotal']!0)/100)?string("##0.##")}</font>
                            </td>
                            <td >
                            	提现总额：<font class="money">${((report4ACFirstRow['withdrawTotal']!0)/100)?string("##0.##")}</font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                        		期初余额汇总：<font class="money">${((report4ACSecRow['startTimeTotal']!0)/100)?string("##0.##")}</font>
                            </td>
                            <td >
                            	期末余额汇总：<font class="money">${((report4ACSecRow['endTimeTotal']!0)/100)?string("##0.##")}</font>
                            </td>
                            <td  colspan="2">
                            	期末保证金总额：<font class="money">${((report4ACSecRow['endTimeDepositTotal']!0)/100)?string("##0.##")}</font>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <div style=" height: 35px; line-height: 35px; padding-left: 12pxd">
                    <form action="${queryUrl!''}" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <label>开始时间：<input name="startTime" class="Wdate"  id="startTime" type="text" onClick="WdatePicker()"  value='${startTime}'></label>&nbsp;
                        <label>结束时间：<input name="endTime" class="Wdate"  id="endTime" type="text" onClick="WdatePicker()" value="${endTime}"></label>&nbsp;
                        <label>用户类型：
                            <select name="usertype" id="usertype" style="width: 120px">
                                <option value=""></option>
                                <option value="1">司机</option>
                                <option value="2">企业</option>
                            </select>
                        </label>&nbsp;
                        <label>用户名：<input name="username" id="username"  type="text" value="${username!''}" /></label>
                        <input style="margin-left: 10px" id="clearparams" type="button" value="清除条件">
                        <input id="querySubmit" type="button" value="查 询">
                    </form>
                </div>
                
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                    	<th nowrap="nowrap" width="5%">用户名</th>
                    	<th nowrap="nowrap" width="5%">类型</th>
                        <th nowrap="nowrap" width="5%">期初余额</th>
                        <th nowrap="nowrap" width="5%">本期充值额</th>
                        <th nowrap="nowrap" width="5%">本期收款额</th>
                        <th nowrap="nowrap" width="5%">本期付款额</th>
                        <th nowrap="nowrap" width="5%">本期提现</th>
                        <th nowrap="nowrap" width="5%">期末余额</th>
                        <th nowrap="nowrap" width="5%">其中保证金</th>
                        <th nowrap="nowrap" width="5%">可用余额</th>
                        <th nowrap="nowrap" width="8%" class="noright_border">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if accountRecordList??>
                        <#list accountRecordList as accountRecord>
                        <tr>
                            <td>
								<#if accountRecord.usertype == 1>
                                   ${accountRecord.driverName!''}
                                <#elseif accountRecord.usertype == 2>
                                   ${accountRecord.companyName!''}
                                <#elseif accountRecord.usertype == 3>
                                	&nbsp;
                                <#else>
                                	&nbsp;
                                </#if>
							</td>
                            <td >
                            	<#if accountRecord.usertype == 1>
                                  	 司机
                                <#elseif accountRecord.usertype == 2>
                                   	企业
                                <#elseif accountRecord.usertype == 3>
                                	专线
                                <#else>
                                	&nbsp;
                                </#if>
                            </td>
                            <td >
                            	${((accountRecord.startTotalMoney!0)/100)?string("##0.##")}
                            </td>
                            <td >
                            	${((accountRecord.rechargeMoney!0)/100)?string("##0.##")}
                            </td>
                            <td>
                            	${((accountRecord.collectionMoney!0)/100)?string("##0.##")}
                            </td>
                            <td>
                            	${((accountRecord.paymentMoney!0)/100)?string("##0.##")}
                            </td>
                            <td>
                            	${((accountRecord.withdrawMoney!0)/100)?string("##0.##")}
                            </td>
                            <td>
                            	${((accountRecord.endTotalMoney!0)/100)?string("##0.##")}
                            </td>
                            <td>
                            	<#if accountRecord.usertype == 1>
									<#if accountRecord.endUsableMoney gte 50000>
	                                  	500
	                                <#elseif accountRecord.endUsableMoney gte 0>
	                                   ${((accountRecord.endUsableMoney!0)/100)?string("##0.##")}
	                                <#else>
	                                	0
	                                </#if>
                                <#else>
                                	0
                                </#if>
                            </td>
                            <td>
                            	${((accountRecord.endUsableMoney!0)/100)?string("##0.##")}
                            </td>
                            <td class="noright_border">
                                <a href="javascript:void(0);" onclick="javascript:window.location.href='/accountreport4detail.htm?userId=${accountRecord.userId}'">
                                	查看
                                </a>
                            </td>
                        </tr>
                        </#list>
                        <#if pageSum gte 1>
                        <tr>
                            <td colspan="5" class=" nobottom_border noright_border">
                                <div id="pageBar" onselectstart="return false;">
                                    <ul>
                                        <#if page != 0 >
                                            <li onclick="javascript:goPage(0)">首 页</li>
                                        </#if>
                                        <#if page-1 gte 0 >
                                            <li onclick="javascript:goPage(${page}-1)">上一页</li>
                                        </#if>
                                        <li style="border: none;background: none;">共 ${recordsSize} 条注册信息 当前第${page+1}页</li>
                                        <#if page+1 lte pageSum >
                                            <li onclick="javascript:goPage(${page}+1)">下一页</li>
                                        </#if>
                                        <#if page != pageSum >
                                            <li onclick="javascript:goPage(${pageSum})">末 页</li>
                                        </#if>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        </#if>
                    <#else>
                    <tr>
                        <td colspan="11" align="center" class="nobottom_border noright_border">暂无数据</td>
                    </tr>
                    </#if>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>
<#include "common/bottom.ftl">
</div>
<script type="text/javascript">
    $(document).ready(function () {

        $("#page").val(${page});
        $("#usertype").val(${usertype});
        $("#username").val('${username}');
        
        $("#startTime,#endTime,#usertype,#username").change(function () {
            $("#page").val('');
        });

        $("#clearparams").click(function () {
            $("#page").val('');
            $("#usertype").val('');
            $("#username").val('');
            $("#startTime").val('');
            $("#endTime").val('');
            $("#myform").submit();
        });
        
        $("#querySubmit").click(function () {
        	var startTime = $("#startTime").val()?($("#startTime").val().replace(/-/g,"/")):$("#startTime").val();
            var endTime = $("#endTime").val()?($("#endTime").val().replace(/-/g,"/")):$("#endTime").val();
        	if(startTime && endTime && Date.parse(startTime) > Date.parse(endTime)){
        		alert("开始日期不能大于结束日期!");
        		return false;
        	}
            $("#myform").submit();
        });

        $("#mytable").find("td").mouseenter(function () {
            $(this).parent("tr").find("td").css("background", "#fafafa");
        });

        $("#mytable").find("td").mouseleave(function () {
            $(this).parent("tr").find("td").css("background", "#fff");
        });
        
    });
    function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    }
</script>
</body>
</html>
