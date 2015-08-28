<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>财务审核_货管家管理后台</title>
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
                财务审核
            </div>
        	<div class="rightok">
                <div style=" height: 70px; line-height: 35px; padding-left: 12px">
                    <form action="${queryUrl}" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        
                        <label>开始时间：<input name="startTime" class="Wdate"  id="startTime" type="text" onClick="WdatePicker()"  value='${startTime}'></label>&nbsp;&nbsp;&nbsp;
                        <label>结束时间：<input name="endTime" class="Wdate"  id="endTime" type="text" onClick="WdatePicker()" value="${endTime}"></label>&nbsp;&nbsp;&nbsp;
                        <br/>
                        <label>名称：<input name="username" id="username" type="text"></label>
                        <label>手机号：<input name="mobile" id="mobile" type="text"></label>
                        <label>订单状态：
                            <select name="status" id="status" style="width: 120px">
                                <option value=""></option>
                                <option value="6">待审核</option>
                                <option value="10">待支付</option>
                                <option value="16">已支付</option>
                            </select>
                        </label>
                        <input style="margin-left: 10px" id="clearparams" type="button" value="清除条件">
                        <input type="submit" value="查 询" />
                    </form>
                </div>
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                    	<th nowrap="nowrap">编号</th>
                    	<th nowrap="nowrap">名称</th>
                    	<th nowrap="nowrap">手机号</th>
                        <th nowrap="nowrap">发起时间</th>
                        <th nowrap="nowrap">订单状态</th>
                        <th nowrap="nowrap">支付类型</th>
                        <th nowrap="nowrap">支付金额</th>
                        <th nowrap="nowrap" class="noright_border">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if accountRecordList??>
                        <#list accountRecordList as accountRecord>
                        <tr>
                            <td width="3%">${accountRecord.id}</td>
                            <td width="10%">
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
                    		<td width="10%">
                    			<#if accountRecord.usertype == 1>
                                   ${accountRecord.mobile!''}
                                <#elseif accountRecord.usertype == 2>
                                   ${accountRecord.linkMobile!''}
                                <#elseif accountRecord.usertype == 3>
                                </#if>
                    		</td>
                            <td width="10%">${accountRecord.operateTime!''}</td>
                            <td width="5%">
                            	<#if accountRecord.status == 6>
									待审核
                                <#elseif accountRecord.status == 10>
									待支付
								<#elseif accountRecord.status == 16>
									已支付
								<#else>
                                	&nbsp;
                                </#if>
                            </td>
                            <td width="5%">提现</td>
                            <td width="10%">${(-accountRecord.money/100)?string("##0.##")}</td>
                            
                            <td width="15%" class="noright_border">
                                <a href="javascript:void(0);" onclick="javascript:window.location.href='/accountrecordlist4user.htm?userId=${accountRecord.debitId}'">
                                	查看详情
								</a>
								<span style="color: #ececec">|</span>
                                <a href="javascript:void(0);" onclick="javascript:window.location.href='/toWithdrawAudit.htm?accRecordId=${accountRecord.id}'">
                                	<#if accountRecord.status==6>
                                		<span style="color: red">审核</span>
                                	<#elseif accountRecord.status==10 || accountRecord.status==16>
                                		审核记录
                                	</#if>
								</a>	
								<#if accountRecord.status==6>
									<span style="color: #ececec">|</span>
									<a href="javascript:void(0);" id="auditReject" accountRecordId = "${accountRecord.id}">
	                                	<span style="color: red">驳回</span>
									</a>
								</#if>
                            </td>
                        </tr>
                        </#list>
                        <#if pageSum gte 1>
                        <tr>
                            <td colspan="8" class=" nobottom_border noright_border">
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
        $("#status").val(${status});
        $("#username").val('${username}');
        $("#mobile").val('${mobile}');
        //$("#startTime").val(${startTime});
        //$("#endTime").val(${endTime});
        
        $("#startTime,#endTime,#status,#username,#mobile").change(function () {
            $("#page").val('');
        });

        $("#clearparams").click(function () {
            $("#page").val('');
            $("#status").val('');
            $("#username").val('');
            $("#mobile").val('');
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
        
        $("#auditReject").click(function(){
        	if(confirm("确认驳回申请?")){
        		var accountRecordId = $("#auditReject").attr("accountRecordId");
	        	$.post("/ajax/withdrawAuditReject.htm", {accRecordId:accountRecordId},
	        			function (data) {
	                        if (data.flag == 1) {
	                        	alert('操作成功！');
	                        	window.location.reload();
	                        } else{
	                            alert("操作失败！");
	                        } 
	                    },"json");
        	}
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
