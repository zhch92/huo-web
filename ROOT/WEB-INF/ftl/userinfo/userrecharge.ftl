<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>充值_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" language="javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
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
    充值
</div>
<div class="rightok">

<form id="chargeimgform"  action=""  method="post" enctype="multipart/form-data" >
<input type="hidden" name="userId" id="userId" value="${userid}" >
<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
	    <td nowrap="nowrap" style="background: #eee;height:25px" colspan="2">充值信息</td>
	</tr>
	<tr>
	    <td width="5%" nowrap="nowrap" style="background: #fafafa;" >金&nbsp;&nbsp;额：</td>
	    <td colspan="3" ><input type="text" name="amount" id="amount" style="width:120px;" />&nbsp;元</td>
	</tr>
	<tr>
	    <td colspan="4">
	    <#-- <img id="rechargeimg" src="">
		<input id="rechargeimgfilePz" type="file" name="filePz" onchange="showpic()" value="上传凭证" />
		-->
		<input type="file"  name="filePz" id="rechargeimgfilePz" style="display:none;width:268px; *height:22px;" onchange="jQuery('#path').val(jQuery('#rechargeimgfilePz').val())" />  
		<input type="text" name="path" id="path" onfocus="jQuery('#rechargeimgfilePz').click()" />  
		<input type="button" value="上传充值凭证" onclick="jQuery('#rechargeimgfilePz').click()" />  
		</td>
	</tr>
	<tr>
	    <td nowrap="nowrap" colspan="2" align="left">
	        <input type="button" style="width: 100px" id="rechargeBtn" value="充值">
	        <input type="button" value="返 回" style="width: 100px" onclick="javascript:window.location.href='/userlist4recharge.htm'">
	    </td>
	</tr>
	</tbody>
</table>
</form>
<#if user.usertype==1>
	
	
	<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
	
	<tr>
	    <td nowrap="nowrap" style="background: #eee;height:25px" colspan="8">充值用户信息</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >用户名：</td>
	    <td width="35%">${user.userName!''}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >账户类型：</td>
	    <td width="35%">司机</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >姓名：</td>
	    <td width="35%">${userName!''}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >保证金：</td>
	    <td width="35%">0&nbsp;元</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >车型：</td>
	    <td width="35%">${dict("cargo_cartype",user.driver.carType)}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >车长：</td>
	    <td width="35%">${dict("cargo_carlength",user.driver.carLength)}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >主营路线：</td>
	    <td width="35%">
			<#if transRoutes??>
				<#if (transRoutes?size>0)>
					<#list transRoutes as tr>
						${tr_index+1}. ${dict("citryMap",tr.startProvince)} ${dict("citryMap",tr.startCity)} -- ${dict("citryMap",tr.endProvince)} ${dict("citryMap",tr.endCity)} <br>
					</#list>
				<#else>
					无主营路线
				</#if>
			<#else>
				无主营路线
			</#if>
		</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >账户余额：</td>
	    <td width="35%">${(account.usable/100)?string("##0.##")}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >银行卡号：</td>
	    <td width="35%">${user.driver.yhkh!''}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >交易记录：</td>
	    <td width="35%">${countOrdersNum!''}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >银行：</td>
	    <td width="35%">${dict("bankcard_type",user.driver.khyh)}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >违约记录：</td>
	    <td width="35%">${countDefaultNum!''}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >户名：</td>
	    <td width="35%">${user.driver.yhkyhm!''}</td>
	   	<td width="2%" nowrap="nowrap" style="background: #fafafa;" >运通元宝：</td>
	    <td width="35%">${user.driver.integral!''}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >用户状态：</td>
	    <td width="35%"><#if user.status == 1>
                                    正常
                                <#elseif user.status == -1>
                                    已删除
                                <#elseif user.status == 2>
                                    冻结
                                <#elseif user.status == 3>
                                    待验证
                                </#if>
        </td>
        <td width="2%" nowrap="nowrap" style="background: #fafafa;" >开户行：</td>
	    <td width="35%">${user.driver.khyhdz!''}
        </td>
	</tr>
	
	
	</tbody>
	</table>
	
<#elseif user.usertype==2>
	
	
	<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
	<tbody>
	
	<tr>
	    <td nowrap="nowrap" style="background: #eee;height:25px" colspan="8">充值用户信息</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >用户名：</td>
	    <td width="35%">${userName!''}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >账户类型：</td>
	    <td width="35%">企业</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >货运联系人：</td>
	    <td width="35%">${user.companyInfo.linkName!''}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >账户余额：</td>
	    <td width="35%">${(account.usable/100)?string("##0.##")}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >联系人电话：</td>
	    <td width="35%">${user.companyInfo.linkMobile!''}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >紧急联系人：</td>
	    <td width="35%">${userName!''}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >固定电话：</td>
	    <td width="35%">${user.companyInfo.linkPhone!''}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >紧急联系手机：</td>
	    <td width="35%">${userName!''}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >行业类型：</td>
	    <td width="35%"><#if user.companyInfo.industryType?? && user.companyInfo.industryType!=0>
	    				${dict("companyinfo_industry_type",user.companyInfo.industryType!0)}
						</#if></td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >单笔支付限额：</td>
	    <td width="35%">${(user.companyInfo.alarmValue)?string("##0.##")}</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >公司地址：</td>
	    <td width="35%">${user.companyInfo.companyAdd!''}</td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >公司性质：</td>
	    <td width="35%">
		    <#if user.companyInfo.companyType?? && user.companyInfo.companyType!=0>
				${dict("companyinfo_type",user.companyInfo.companyType)}
			<#else>
				无
			</#if>
		</td>
	</tr>
	<tr>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >银行卡号：</td>
	    <td width="35%"><#if bankCard??>${bankCard.bankCard!''}</#if></td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >用户状态：</td>
	    <td width="35%"><#if user.status == 1>
                                    正常
                                <#elseif user.status == -1>
                                    已删除
                                <#elseif user.status == 2>
                                    冻结
                                <#elseif user.status == 3>
                                    待验证
                                </#if></td>
	</tr>
	<tr>
		<td width="2%" nowrap="nowrap" style="background: #fafafa;" >银行：</td>
	    <td width="35%"><#if bankCard??>${dict("bankcard_type",bankCard.bankType)}</#if></td>
	    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >开户行：</td>
	    <td width="35%"><#if bankCard??>${bankCard.bankAdd!''}</#if></td>
	</tr>
	</tbody>
	</table>
	
</#if>

</div>
</div>
<div class="clear"></div>
</div>
<#include "common/bottom.ftl">
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#amount").val("");
        
        $("#rechargeBtn").click(function(){
        	var text = $("#rechargeBtn").val();
        	$("#rechargeBtn").attr("disabled","true").val("处理中...");
	        var uid = $("#userId").val();
	        var amount = $("#amount").val();
	        if(!uid || uid<0){
	        	return alert("网络异常！请重新点击充值！");
	        }
	        if(!amount || amount<=0){
	        	return alert("请输入金额");
	        }
			$("#chargeimgform").ajaxSubmit({  
	            url:"/ajax/userrecharge.htm",  
	            type:"post",  
	            enctype:'multipart/form-data',  
	            dataType:'json',
	            success:function(data) { 
	            	 if(data && data.flag==1){
				      	 alert("操作成功！");
				      	 window.location.href="/toRechargesuccess.htm?uid="+uid+"&imgpath="+data.data.path+"&amount="+data.data.amount;
				      }else{
				      	 alert("操作失败！");
				      }
				      $('#rechargeBtn').removeAttr("disabled").val(text); 
				      return false;
	            },error:function(data) {  
	                alert('系统或网络错误！',"错误",{fontSize:18});
	            }  
	        });
        });
        

    });
    
    function showpic(){
    	document.getElementById("rechargeimg").src = document.getElementById("rechargeimgfilePz").value;
	}
	function getFullPath(obj){ 
		if(obj) 
		{ 
		 //ie 
		 if (window.navigator.userAgent.indexOf("MSIE")>=1) 
		 { 
		 obj.select(); 
		 return document.selection.createRange().text; 
		 } 
		 //firefox 
		 else if(window.navigator.userAgent.indexOf("Firefox")>=1) 
		 { 
		 if(obj.files) 
		 { 
		 return obj.files.item(0).getAsDataURL(); 
		 } 
		 return obj.value; 
		 } 
		 return obj.value; 
		} 
	} 

</script>
</body>
</html>