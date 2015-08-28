<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>支付审核_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <style type="text/css">
        #myform input {
            width: 90%;
        }

        #myform select {
            width: 90%;
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
                支付审核
            </div>
            <div class="rightok">
                <form action="/ajax/withdrawAudit.htm" id="myform">
                	<input type="hidden" id="accountRecordId" value="${accountRecord.id}">
                    <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">申请提交时间：</td>
                            <td width="15%">${accountRecord.operateTime}</td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">账户可用余额：</td>
                            <td width="15%">${(account.usable/100)?string("##0.##")}</td>
                        </tr>
                        <tr>
                        	<td nowrap="nowrap" style="background: #fafafa;" width="3%">提现金额：</td>
                            <td width="15%">${(-accountRecord.money/100)?string("##0.##")}</td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">扣除手续费用：</td>
                            <td width="15%">0</td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">实际支付金额：</td>
                            <td width="15%">${(-accountRecord.money/100)?string("##0.##")}</td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">安全操作金额：</td>
                            <td width="15%">${(alarmValue/100)?string("##0.##")}</td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">支付内容：</td>
                            <td width="15%">
                            	<table>
                            		<tr>
			                            <td width="5%">支付人：</td>
			                            <td width="15%">${userName!''}</td>
			                        </tr>
			                        <tr>
			                            <td width="5%">账户信息：</td>
			                            <td width="15%">${dict("bankcard_type",bankNameNumber)}
			                            </br>${paymentRecord.cardNo}</td>
			                        </tr>
			                        <tr>
			                            <td width="5%" >开户行：</td>
			                            <td width="15%" >${bankAdd}</td>
			                        </tr>
			                        <tr>
			                            <td width="5%" >开户名：</td>
			                            <td width="15%" >${bankUsername}</td>
			                        </tr>
                            	</table>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">银行信息最近修改时间：</td>
                            <td width="15%">${lastModifyBankTime!''}</td>
                        </tr>
                        <tr>
                        	
                        	<td nowrap="nowrap" style="background: #fafafa;" width="3%">支付金额：</td>
                            <td width="15%">${((-paymentRecord.amount)/100)?string("##0.##")}</td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">联系电话：</td>
                            <td width="15%">${linkMobile!''}</td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">联系人：</td>
                            <td width="15%">${linkUserName!''}</td>
                        </tr>
                        
                        	<tr>
	                            <td nowrap="nowrap" colspan="8" align="center">
	                            	<#if accountRecord.status==6>
	                                <input id="auditSumbit" type="button" style="width: 100px" value="审核通过">
	                                </#if>
	                                <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
	                            </td>
	                        </tr>
                        
                        
                        </tbody>
                    </table>
                </form>
                
                <table id="mytable2" style="BORDER-COLLAPSE: collapse" borderColor=#fafafa height=40 cellPadding=1 width=100% align=center border=1 cellpadding="1" cellspacing="0">
                	<#if accountRecord.status==6>
                	<tr>
                		 <th rowspan="2" nowrap="nowrap" style="background: #eee;height:45px" width="10%">电话拨打<br>记录新增</th>
                		 <td nowrap="nowrap" style="background: #fafafa;height:45px;width:2px" width="2px">联系人：</td>
	                           	<td width="8%"><input type="text" name="linkman" id="linkman" width="60px"></td>   
	                     <td nowrap="nowrap" style="background: #fafafa;" width="100px">联系电话：</td>
	                           	<td width="6%"><input type="text" name="linkphone" id="linkphone"></td>   
	                           	     	
	                           	<td nowrap="nowrap" style="background: #fafafa;" width="80px">事件类型：</td>
	                            <td width="7%">
	                            		<select  name="incidentType" id="incidentType">
	                                    <option value="2">账户核实</option>                       
	                                </select>
	                            </td>
	                      <td nowrap="nowrap" style="background: #fafafa;" width="5%" >备注：</td>
	                            <td width="25%" colspan="5">
	                            	<input type="text" name="remark" id="remark"  style="width:400px">
	                           	</td>   
	                     
	                </tr>
	                <tr>
	                	<td nowrap="nowrap" colspan="12" align="center">
	                		<input id="phoneSumbit" type="button" style="width: 100px" value="+新增记录" onclick="newPhoneRecord();"> 	
	                	</td>	  
	                </tr>
	                </#if>
	                <#if phoneRecords??>
	                	<tr>
			                <th rowspan="${phoneRecords?size+1}" nowrap="nowrap" style="background: #eee;height:45px" width="10%">电话拨打<br>记录清单</th>
			            </tr>
	                        	<#list phoneRecords as list1>
			                        <tr width="100%">
			                        	<td nowrap="nowrap" style="background: #fafafa;height:45px;width:2px" width="2px">联系时间：</td>
			                           	<td style="width:12%">${list1.operateTime}</td>
			                            <td nowrap="nowrap" style="background: #fafafa;height:45px;width:2%" width="2%">联系人：</td>
			                           	<td width="8%">${list1.linkman}</td>   
			                           	<td nowrap="nowrap" style="background: #fafafa;" width="8%">联系电话：</td>
			                           	<td width="9%">${list1.linkphone}</td>        	
			                           	<td nowrap="nowrap" style="background: #fafafa;" width="8%">事件类型：</td>
			                            <td width="8%">
			                            		<select  name="incidentType" id="incidentType" value="${list1.incidentType}">
			                                    <option value="2">账户核实</option>                       
			                                </select>
			                            </td>
			                            <td nowrap="nowrap" style="background: #fafafa;" width="8%">备注：</td>
			                            <td width="15%" >
			                            	${list1.remark}
			                           	</td>
			                           	<td nowrap="nowrap" style="background: #fafafa;" width="8%">操作人：</td>
			                            <td width="8%" >
			                            	${list1.operator}
			                           	</td>                           
			                        </tr>
		                        </#list>
	                        </#if>
                </table>
            </div>           
        </div>
        <div class="clear"></div>
    </div>
<#include "common/bottom.ftl">
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#auditSumbit").click(function(){
        	var text = $("#auditSumbit").val();
        	$("#auditSumbit").attr("disabled","true").val("处理中...");
        	var accountRecordId = $("#accountRecordId").val();
        	$.post("/ajax/withdrawAudit.htm", {accRecordId:accountRecordId},
        			function (data) {
                        if (data.flag == 1) {
                        	alert('操作成功！');
                        	window.location.href=data.data;
                        } else{
                            alert("操作失败！");
                        }
                        $('#auditSumbit').removeAttr("disabled").val(text);
                    },"json");
        });
    });
    function newPhoneRecord(){
        	var linkman = $("#linkman").val();
        		linkman = $.trim(linkman);
        	var linkphone = $("#linkphone").val();
        		linkphone = $.trim(linkphone);
        	var incidentType = $("#incidentType").val();
        	var remark = $("#remark").val();
        		remark = $.trim(remark);
        	if(""==linkman||null==linkman){
        		alert("请填写联系人");
       			return false;
        	}else if(""==linkphone||null==linkphone){
        		alert("请填写联系电话");
       			return false;
        	}else if(""==incidentType||null==incidentType){
        		alert("请填写事件类型");
       			return false;
        	}else if(""==remark||null==remark){
        		alert("请填写备注");
       			return false;
        	}
           var accountRecordId = $("#accountRecordId").val();
           $.post("/ajax/addphoneRecord.htm",{objId:accountRecordId,linkman:linkman,linkphone:linkphone,incidentType:incidentType,remark:remark},
					  function(data){
					    if(data.flag==1){
                        		alert("新增电话记录成功！");
                        		location.reload();
                        		$("#linkman").val("");
                        		$("#linkphone").val("");
                        		$("#incidentType").val("2");
                        		$("#remark").val("");
                        	}else{
                        		alert("新增电话记录失败！");
                        	}
					  },
					  "json");
        }
</script>
</body>
</html>