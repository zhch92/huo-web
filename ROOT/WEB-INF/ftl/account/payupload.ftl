<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>支付_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" language="javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/jquery.easing.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/jquery.flyout-1.2.js"></script>
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
                支付
            </div>
            <div class="rightok">
                <form action="" id="myform" enctype="multipart/form-data">
                    <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                        <tbody>
	                        <tr>
	                            <td nowrap="nowrap" style="background: #fafafa;" width="2%">支付内容：</td>
	                            <td width="15%">
	                            	<table>
	                            		<tr>
				                            <td width="5%">
				                            	<#if user??>
				                            		<#if user.usertype==1>
				                            			 司机姓名：
				                            		<#elseif user.usertype==2>
				                            			企业名称：
				                            		<#else>
				                            			名称:
				                            		</#if>
				                            	</#if>
				                           	</td>
				                            <td width="15%">${userName!''}  &nbsp;&nbsp;&nbsp;
				                            	<#if user??>
				                            		<#if user.usertype==1>
				                            			个人
				                            		<#elseif user.usertype==2>
				                            			企业
				                            		<#else>
				                            		</#if>
				                            	</#if>
				                            </td>
				                        </tr>
				                        <tr>
				                            <td width="5%">电话：</td>
				                            <td width="15%">
				                            	<#if user.usertype == 1>
				                                   <#if user.driver??>${user.driver.mobile!''}</#if>
				                                <#else>
				                                   <#if user.companyInfo??>${user.companyInfo.linkMobile!''}</#if>
				                                </#if>
				                            </td>
				                        </tr>
				                        <tr>
				                            <td width="5%">状态：</td>
				                            <td width="15%">
				                            	<#if user.status == 1>
                                   					正常
				                                <#elseif user.status == -1>
				                                   <font style="color:red;" >已删除</font>
				                                <#elseif user.status == 2>
												   <font style="color:red;">冻结</font>
				                                <#elseif user.status == 3>
												   <font style="color:red;">待验证</font>
												<#else>
													未知
				                                </#if>
				                            </td>
				                        </tr>
				                        <tr>
				                            <td width="5%">认证状态：</td>
				                            <td width="15%">
						                            	<#if user.usertype == 1>
						                            		身份证：
						                                    <#if user.driver.sfzsfrz == 0>
																未认证
						                                    <#elseif user.driver.sfzsfrz == 1>
																认证中
															<#elseif user.driver.sfzsfrz == 2>
																未通过
						                                    <#elseif user.driver.sfzsfrz == 10>
																已认证
															<#else>
																认证中
						                                    </#if>
															</br>驾驶证：
															<#if user.driver.jszsfrz == 0>
																未认证
						                                    <#elseif user.driver.jszsfrz == 1>
																认证中
															<#elseif user.driver.jszsfrz == 2>
																未通过
						                                    <#elseif user.driver.jszsfrz == 10>
																已认证
															<#else>
																认证中
						                                    </#if>
						                                    </br>行驶证：
						                                    <#if user.driver.xszsfrz == 0>
																未认证
						                                    <#elseif user.driver.xszsfrz == 1 >
																认证中
															<#elseif user.driver.xszsfrz == 2>
																未通过
						                                    <#elseif user.driver.xszsfrz == 10>
																已认证
															<#else>
																认证中
															</#if>
						                                <#elseif user.usertype == 2>
						                                	营业执照：
						                                    <#if user.companyInfo.yyzzsfrz == 0>
																未认证
						                                    <#elseif user.companyInfo.yyzzsfrz == 1>
																认证中
						                                    <#elseif user.companyInfo.yyzzsfrz == 2>
																未通过
						                                    <#elseif user.companyInfo.yyzzsfrz == 10>
																已认证
						                                    <#else>
																认证中
						                                    </#if>
															</br>组织机构代码：
															<#if user.companyInfo.zzjgdmsfrz == 0>
																未认证
						                                    <#elseif user.companyInfo.zzjgdmsfrz == 1 >
																认证中
						                                    <#elseif user.companyInfo.zzjgdmsfrz == 2>
						                                    	未通过
						                                    <#elseif user.companyInfo.yyzzsfrz == 10>
						                                       	 已认证
						                                    <#else>
						                                    	认证中
						                                    </#if>
						                                <#elseif user.usertype == 3>
						                                    <#if user.specialCompany??>
						                                        <#if user.specialCompany.yyzzsfrz == 0 && user.specialCompany.zzjgdmsfrz == 0 >
						                                         未认证
						                                        <#elseif user.specialCompany.yyzzsfrz == 1 || user.specialCompany.zzjgdmsfrz == 1 >
									认证中
							                                    <#else>
									已认证
							                                    </#if>
						                                    </#if>
						                                </#if>
				                            </td>
				                        </tr>
				                        <tr>
				                        	<td width="5%">账户余额：</td>
				                            <td width="15%">${((account.total!0)/100)?string("##0.##")}</td>
				                        </tr>
				                        <tr>
				                            <td width="5%">冻结金额：</td>
				                            <td width="15%">${((account.frozen!0)/100)?string("##0.##")}</td>
				                        </tr>
				                        <tr>
				                            <td width="5%">保证金：</td>
				                            <td width="15%">
				                            	<#if user??>
				                            		<#if user.usertype==1>
				                            			<#if account.usable gt 50000>
				                            			 	500
				                            			<#else>
				                            				${((account.usable!0)/100)?string("##0.##")}
				                            			</#if>
				                            		<#else>
				                            			0
				                            		</#if>
				                            	</#if>
				                            </td>
				                        </tr>
				                        <tr>
				                            <td width="5%">账户可用余额：</td>
				                            <td width="15%">${((account.usable!0)/100)?string("##0.##")}</td>
				                        </tr>
	                            	</table>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<td nowrap="nowrap" style="background: #fafafa;" width="2%">账户信息：</td>
	                            <td width="5%">
	                            	<table>
	                            		<tr>
				                            <td width="5%">开户名：</td>
				                            <td width="15%">${bankUsername!''}</td>
				                        </tr>
	                            		<tr>
				                            <td width="5%">账户信息：</td>
				                            <td width="15%">${dict("bankcard_type",bankNameNumber)}
				                            </br>${paymentRecord.cardNo!''}</td>
				                        </tr>
				                        <tr>
				                            <td width="5%">开户行：</td>
				                            <td width="15%">${bankAdd!''}</td>
				                        </tr>
				                        <tr>
				                            <td width="5%" >支付金额：</td>
				                            <td width="15%" >${((-paymentRecord.amount)/100)?string("##0.##")}</td>
				                        </tr>
	                            	</table>
	                            </td>
	                        </tr>
	                        <#if sensitiveInfoAdmins??>
	                        	<tr>
		                            <td nowrap="nowrap" style="background: #fafafa;" width="2%">操作记录：</td>
		                            <td width="15%">
		                            	<table>
		                            		<tr>
					                            <td width="5%">操作人：</td>
					                            <td width="5%">操作时间：</td>
					                            <td width="5%">操作类型：</td>
					                            <td width="5%">备注：</td>
					                            
					                        </tr>
					                        <#list sensitiveInfoAdmins as sensitiveInfoAdmin>
						                        <tr>
						                            <td width="15%">${sensitiveInfoAdmin.operator!''}</td>
						                            <td width="15%" >${sensitiveInfoAdmin.operateTime!''}</td>
						                            <td width="15%" >
														<#if sensitiveInfoAdmin.operateType == 1>交易管理
						                                <#elseif sensitiveInfoAdmin.operateType == 2>财务支付通过
						                                <#elseif sensitiveInfoAdmin.operateType == 3>账户管理
						                                <#elseif sensitiveInfoAdmin.operateType == 4>线下充值	
						                                <#elseif sensitiveInfoAdmin.operateType == 5>财务审核通过	
						                                <#elseif sensitiveInfoAdmin.operateType == 51>财务审核驳回
						                                <#elseif sensitiveInfoAdmin.operateType == 21 || sensitiveInfoAdmin.operateType == 22>财务支付驳回
						                                <#elseif sensitiveInfoAdmin.operateType == 6>强制下架
						                                <#else>&nbsp;
						                                </#if>
													</td>
						                            <td width="15%" >${sensitiveInfoAdmin.remark!''}</td>
						                        </tr>
					                        </#list>
		                            	</table>
		                            </td>
		                        </tr>
	                        </#if>
	                        
	                        <#if !(type??) || type==1>
		                        <#if paymentRecord.status==10>
		                        	<tr>
			                            <td nowrap="nowrap" style="background: #fafafa;" width="2%">上传凭证：</td>
			                            <td width="15%">
			                					<input type="hidden" name="accRecordId" id="accountRecordId" value="${accountRecordId!''}" />
				                            	<input type="file" name="filePz" />
			                            </td>
			                        </tr>
			                        
			                        <tr>
			                            <td nowrap="nowrap" colspan="2" align="center">
			                                <input id="auditSumbit" type="button" style="width: 100px" value="上传">
			                                <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
			                                <input type="button" style="width: 100px" value="驳回支付请求" id="payReject" accountRecordId = "${accountRecordId!''}">
			                                <textarea rows="3" cols="20" id="payRejectStr" name="payRejectStr" 
			                                		style="color:#ccc"
			                                		onblur="if(this.value==''){this.style.color='#ccc';value='请输入驳回理由'}"
			                                		onfocus="if(this.value=='请输入驳回理由'){this.style.color='#333';value=''}else{this.style.color='#333';select();}" >请输入驳回理由</textarea>
			                                
			                            </td>
			                        </tr>
			                        
			                        
			                        
		                        <#elseif paymentRecord.status==16>
		                        	
		                        	<tr>
			                            <td nowrap="nowrap" style="background: #fafafa;" width="2%">支付信息：</td>
			                            <td width="15%">
			                            	<table>
			                            		<tr>
						                            <td width="5%">操作人：</td>
						                            <td width="15%"><#if payAdminName??>${payAdminName!''}</#if></td>
						                        </tr>
						                        <tr>
						                            <td width="5%">操作通过时间：</td>
						                            <td width="15%" >${payTime!''}</td>
						                        </tr>
			                            	</table>
			                            </td>
			                        </tr>
		                        	<tr>
			                            <td nowrap="nowrap" style="background: #fafafa;" width="2%">上传凭证：</td>
			                            <td width="15%">
		                					<div id="biuuuu">
		                						<#if payimgpath??>
		                							<a href="/img/downImg.htm?path=${payimgpath}" title="jquery.flyout">
		                								<img src="/img/downImg.htm?path=${payimgpath}" width="200px">
		                							</a>
		                						<#else>
		                							图片已删除或网络异常
		                						</#if>
									        </div>
			                            </td>
			                        </tr>
			                        <tr>
			                            <td nowrap="nowrap" colspan="2" align="center">
			                                <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
			                                &nbsp;&nbsp;&nbsp;&nbsp;
			                                <input type="button" style="width: 100px"  value="驳回支付请求" id="payedReject" accountRecordId = "${accountRecordId!''}" >
				                            <textarea rows="3" cols="20" id="payedRejectStr" name="payedRejectStr"
				                            	style="color:#ccc"
			                                		onblur="if(this.value==''){this.style.color='#ccc';value='请输入驳回理由'}"
			                                		onfocus="if(this.value=='请输入驳回理由'){this.style.color='#333';value=''}else{this.style.color='#333';select();}" >请输入驳回理由</textarea>
				                            
			                            </td>
			                        </tr>
		                        </#if>
	                        </#if>
	                        <#if type==2>
	                        	<tr>
		                            <td nowrap="nowrap" style="background: #fafafa;" width="2%">上传凭证：</td>
		                            <td width="15%">
	                					<div id="biuuuu">
	                						<#if payimgpath??>
	                							<a href="/img/downImg.htm?path=${payimgpath}" title="jquery.flyout">
	                								<img src="/img/downImg.htm?path=${payimgpath}" width="200px">
	                							</a>
	                						<#else>
	                							图片已删除或网络异常
	                						</#if>
								        </div>
		                            </td>
		                        </tr>
	                        	<tr>
		                            <td nowrap="nowrap" colspan="2" align="center">
		                                <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
		                                &nbsp;&nbsp;&nbsp;&nbsp;
		                                <input type="button" style="width: 100px"  value="驳回支付请求" id="payedReject" accountRecordId = "${accountRecordId!''}" >
			                            <textarea rows="3" cols="20" id="payedRejectStr" name="payedRejectStr"
			                            	style="color:#ccc"
		                                		onblur="if(this.value==''){this.style.color='#ccc';value='请输入驳回理由'}"
		                                		onfocus="if(this.value=='请输入驳回理由'){this.style.color='#333';value=''}else{this.style.color='#333';select();}" >请输入驳回理由</textarea>			                            
		                            </td>
		                        </tr>
	                        </#if>
                        </tbody>
                    </table>
                </form>
				
            </div>
        </div>
        <div class="clear"></div>
    </div>
<#include "common/bottom.ftl">
</div>
<script type="text/javascript">
    $(document).ready(function () {
    	$('#biuuuu a').flyout();
    	
        $("#auditSumbit").click(function(){
        	var accountRecordId = $("#accountRecordId").val();
	       	$("#auditSumbit").attr("disabled","true").val("处理中...");
	       	$("#myform").ajaxSubmit({  
	            url:"/ajax/payUploadFile.htm",  
	            type:"post",  
	            enctype:'multipart/form-data',  
	            dataType:'json',
	            success:function(data) {
	            	 if(data && data.flag==1){
				      	 alert("上传成功！");
				      	 window.location.href=data.data;
				      }else if(data.msg){
				      	 alert(data.msg);
				      }else{
				      	 alert("上传失败！");
				      }
				      $('#auditSumbit').removeAttr("disabled").val("上传"); 
				      return false;
	            },error:function(data) {  
	                alert('系统或网络错误！',"错误",{fontSize:18});
	            }
	        });
        });
        
        //支付驳回
        $("#payReject").click(function(){
        	if(confirm("确认驳回支付请求?")){
        		var accountRecordId = $("#payReject").attr("accountRecordId");
	        	var payRejectStr = $("#payRejectStr").val();
	        	if(!accountRecordId){
	        		alert("数据异常，请刷新后再试!");
	        		return;
	        	}
	        	if(!payRejectStr || payRejectStr=="请输入驳回理由"){
	        		alert("请输入驳回理由!");
	        		return;
	        	}
	        	$.post("/ajax/payReject.htm", {accRecordId:accountRecordId,payRejectStr:payRejectStr},
	        			function (data) {
	                        if (data.flag == 1) {
	                        	alert('操作成功！');
	                        	window.location.href="/accountpaylist.htm";
	                        } else{
	                            alert("操作失败！");
	                        } 
	                    },"json");
        	}
        	
        });
        //已支付驳回
        $("#payedReject").click(function(){
        	if(confirm("确认驳回支付请求?")){
	        	var accountRecordId = $("#payedReject").attr("accountRecordId");
	        	var payedRejectStr = $("#payedRejectStr").val();
	        	if(!accountRecordId){
	        		alert("数据异常，请刷新后再试!");
	        		return;
	        	}
	        	if(!payedRejectStr || payedRejectStr=="请输入驳回理由"){
	        		alert("请输入驳回理由!");
	        		return;
	        	}
	        	$.post("/ajax/payedReject.htm", {accRecordId:accountRecordId,payedRejectStr:payedRejectStr},
	        			function (data) {
	                        if (data.flag == 1) {
	                        	alert('操作成功！');
	                        	window.location.href="/accountpaylist.htm";
	                        } else{
	                            alert("操作失败！");
	                        } 
	                    },"json");
			}
        });
    });
</script>
</body>
</html>