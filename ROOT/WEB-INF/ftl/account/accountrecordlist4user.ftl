<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>财务审核_查看详情_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="main">
<#include "common/top.ftl">
    <div class="context">
    <#include "common/left.ftl">
        <div class="right" style="">
            <div class="righttop">
              查看详情
            </div>
        	<div class="rightok">
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <tbody>
                		<tr>
                            <th nowrap="nowrap">名称：</th>
                            <td>${userName!''}&nbsp;</td>
                            <th nowrap="nowrap">用户类型：</th>
                            <td>
								<#if userType==1>
                                   司机
                                <#elseif userType==2>
                                   企业
                                <#else>
                                	&nbsp;
                                </#if>
							</td>
                            <th nowrap="nowrap">注册手机号：</th>
                            <td>${registerMobile!''}</td>
                            <th nowrap="nowrap">支付手机号：</th>
                            <td>${payMobile!''}&nbsp;&nbsp;</td>
                            <th nowrap="nowrap">账户余额：</th>
                            <td>${((usable!0)/100)?string("##0.##")}&nbsp;</td>
                            <th nowrap="nowrap">保证金：</th>
                            <td>${((depoistMoney!0)/100)?string("##0.##")}&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
                <div style=" height: 35px; line-height: 35px; padding-left: 12px">
                	
                    <form action="${queryUrl}" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <input name="userId" id="userId" type="hidden" value="${userId!0}">
                    </form>
                    <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
                </div>
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                    	<th nowrap="nowrap">编号</th>
                        <th nowrap="nowrap">发起时间</th>
                        <th nowrap="nowrap">支付类型</th>
                        <th nowrap="nowrap">支付金额</th>
                        <th nowrap="nowrap">当前金额</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if accountRecordList??>
                        <#list accountRecordList as accountRecord>
                        <tr>
                            <td width="10%">
                            	<#if accountRecord.orderId?? && accountRecord.orderId gt 0>
                                   ${accountRecord.orderNo!''}
                                <#else>
                                   ${accountRecord.id!''}
                                </#if>&nbsp;	
                            </td>
                            <td width="10%">${accountRecord.operateTime!''}&nbsp;</td>
                            <td width="10%">
                            	<#if accountRecord?? && accountRecord.operateType??>
	                            	<#if accountRecord.operateType == 1>
										充值
									<#elseif accountRecord.operateType == 2>
										提现
									<#elseif accountRecord.operateType == 3>
										保证金
									<#elseif accountRecord.operateType == 4>
										货款
									<#elseif accountRecord.operateType == 5>
										邮寄费用
									<#elseif accountRecord.operateType == 6>
										保费
									<#elseif accountRecord.operateType == 7>
										纠纷赔付
									<#elseif accountRecord.operateType == 8>
										违约赔偿
		        					<#else>
		        						
		        					</#if>
	        					</#if>
                            </td>
                            <td width="10%">
                            	<#if accountRecord.orderId?? && accountRecord.orderId gt 0>
									订单金额：${((accountRecord.tradeTotal!0)/100)?string("##0.##")}<br/>
									 赔偿金：${((accountRecord.indemnify!0)/100)?string("##0.##")}<br/>
									成交金额：${((accountRecord.lastTradeMoney!0)/100)?string("##0.##")}
                                <#else>
                                   ${((accountRecord.money!0)/100)?string("##0.##")}
                                </#if>&nbsp;
                            	
                            &nbsp;</td>
                            <td width="15%" class="noright_border">
                                ${(accountRecord.currentUsable/100)?string("##0.##")}&nbsp;
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
                        <td colspan="5" align="center" class="nobottom_border noright_border">暂无数据</td>
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
        //$("#startTime").val(${startTime});
        //$("#endTime").val(${endTime});
      
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
