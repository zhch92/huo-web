<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>平台总账_货管家管理后台</title>
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
                平台总账
            </div>
        	<div class="rightok">
                <div style=" height: 70px; line-height: 35px; padding-left: 12px">
                    <form action="${queryUrl}" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <label style="padding-left: 0px;">金额汇总：<span style="color: red;font-size:16px;">
                        	<#if totalMoney??>
                        		<#if totalMoney/100 lt 0>
                            		${(-totalMoney/100)?string("##0.##")}&nbsp;
                            	<#else>
	                            	${(totalMoney/100)?string("##0.##")}&nbsp;
	                            </#if>
                        	<#else>
                        		0
                        	</#if>&nbsp;</span>
                        	元
                        </label>
	                    <label style="padding-left: 20px;">平台沉淀资金：<span style="color: red;font-size:16px;">
	                    	<#if totalAll??>
                        		${(totalAll/100)?string("##0.##")}
                        	<#else>
                        		0
                        	</#if>
                        	元&nbsp;
	                    	</span>
	                   	</label>
	                   	<br/>
                        <label>资金类型：
                            <select name="operateType" id="operateType" style="width: 120px">
                                <option value=""></option>
                                <option value="33">保证金</option>
                                <option value="11">账户余额</option>
                                <option value="20">在途运费</option>
                            </select>
                        </label>
                        <label>类型：
                            <select name="usertype" id="usertype" style="width: 120px">
                                <option value=""></option>
                                <option value="1">司机</option>
                                <option value="2">企业</option>
                            </select>
                        </label>
                        <input style="margin-left: 10px" id="clearparams" type="button" value="清除条件">
                        <input type="submit" value="查 询" />
                        
                        <input style="margin-left:20px;" type="button" value="刷新" onclick="javascript:window.location.reload();"/>
                    </form>
                </div>
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                    	<th nowrap="nowrap">账号</th>
                        <th nowrap="nowrap">名称</th>
                        <th nowrap="nowrap">类型</th>
                        <th nowrap="nowrap">资金类型</th>
                        <th nowrap="nowrap">金额</th>
                        <th nowrap="nowrap" class="noright_border">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if accountRecordList??>
                        <#list accountRecordList as accountRecord>
                        <tr>
                            <td width="10%">
                            	<#if accountRecord.operateType?? && accountRecord.operateType==20>
	                            	${accountRecord.orderNo}
	                            <#else>
	                            	${accountRecord.userName}
	                            </#if>
                            	&nbsp;
                            	</td>
                            <td width="10%">
	                            <#if accountRecord.usertype?? && accountRecord.usertype==1>
	                            	${accountRecord.driverName}
	                            <#elseif accountRecord.usertype?? && accountRecord.usertype==2>
	                            	${accountRecord.companyName}
	                            <#else>
	                            	&nbsp;
	                            </#if>
                            </td>
                            <td width="10%">
                            	<#if accountRecord.usertype?? && accountRecord.usertype==1>
	                            	司机
	                            <#elseif accountRecord.usertype?? && accountRecord.usertype==2>
	                            	企业
	                            <#else>
	                            	&nbsp;
	                            </#if>
                            </td>
                            <td width="10%">
                            	<#if accountRecord.operateType?? && accountRecord.operateType==1>
                            		充值
                            	<#elseif accountRecord.operateType?? && accountRecord.operateType==2>
                            		提现
                            	<#elseif accountRecord.operateType?? && (accountRecord.operateType==33 || accountRecord.operateType==3)>
                            		保证金
                            	<#elseif accountRecord.operateType?? && accountRecord.operateType==4>
                            		货款
                            	<#elseif accountRecord.operateType?? && accountRecord.operateType==0>
                            		支付邮寄费用
                            	<#elseif accountRecord.operateType?? && accountRecord.operateType==11>
	                            	账户余额
	                            <#elseif accountRecord.operateType?? && accountRecord.operateType==20>
	                            	在途运费
	                            <#else>
	                            	&nbsp;
	                            </#if>
                            </td>
                            <td width="10%">
                            	<font style="color:red;font-size:16px;">
                            	<#if accountRecord.money?? && accountRecord.money/100 lt 0>
                            		${(-accountRecord.money/100)?string("##0.##")}&nbsp;
                            	<#else>
	                            	${(accountRecord.money/100)?string("##0.##")}&nbsp;
	                            </#if>元
	                            </font>
							</td>
                            
                            <td width="15%" class="noright_border">
                                <a href="javascript:void(0);" onclick="javascript:window.location.href='/toWithdrawAudit.htm?accRecordId=${accountRecord.id}'">
                                	<#if accountRecord.status==6><span style="color: red">审核</span></font><#elseif accountRecord.status==10>查看</#if>
								</a><span style="color: #ececec">|</span>
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
                        <td colspan="6" align="center" class="nobottom_border noright_border">暂无数据</td>
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
        $("#operateType").val(${operateType});
        $("#usertype").val(${usertype});
        //$("#startTime").val(${startTime});
        //$("#endTime").val(${endTime});
        
        $("#startTime,#endTime,#operateType,#usertype").change(function () {
            $("#page").val('');
        });

        $("#clearparams").click(function () {
            $("#page").val('');
            $("#operateType").val('');
            $("#usertype").val('');
            $("#startTime").val('');
            $("#endTime").val('');
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
