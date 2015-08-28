<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>授权_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
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
                授权
            </div>
            <div class="rightok">
                
                    
                    <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                        <tbody>
                        <#if admin??>
	                        <tr>
	                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">账户名：</td>
	                            <td width="15%">${admin.username}</td>
	                        </tr>
	                        <tr>
	                        	<td nowrap="nowrap" style="background: #fafafa;" width="3%">登陆密码：</td>
	                            <td width="15%">${admin.password}</td>
	                        </tr>
	                        <tr>
	                        	<td nowrap="nowrap" style="background: #fafafa;" width="3%">权限设置：</td>
	                            <td width="55%">
	                            	<form action="" id="myform">
	                            		<input type="hidden" name="adminid" value="${admin.adminid}">
	                            		<input type="hidden" name="hasBefore" value="${hasBefore}">
                						<#if systemfunctions??>
                						<#list systemfunctions as sysfunction>
                							
                							<input style="width:30px;" name="sysfunctions" 
                								type="checkbox" value="${sysfunction.functionid}" 
                								
                								<#if userfunctionIds??>
                								<#list userfunctionIds as userfunctionid>
													<#if sysfunction.functionid==userfunctionid>checked</#if>
												</#list>
												</#if>
                							/>${sysfunction.functionname?trim}&nbsp;&nbsp;&nbsp;
                							<#-- 
                							<#if (sysfunction_index)%5=4>
                								<br/><br/>
                							</#if>
                							-->
					                    </#list>
					                    </#if>
					                    
									</form>
								</td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" colspan="8" align="center">
	                                <input id="auditSumbit" type="button" style="width: 100px" value="授权">
	                                <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
	                            </td>
	                        </tr>
	                    <#else>
	                    	<tr>
	                            <td nowrap="nowrap" align="center">
	                                	没有数据
	                            </td>
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
        
		$("#auditSumbit").click(function(){
        	var accountRecordId = $("#accountRecordId").val();
	        
			$("#myform").ajaxSubmit({  
	            url:"/ajax/setAdminFuntion.htm",
	            type:"post",
	            dataType:'json',
	            success:function(data) {
					if(data && data.flag==1){
						alert("操作成功！");
						window.location.href=data.data;
					}else{
						alert("操作失败！");
					}
					return false;
	            },error:function(data) {  
	                alert("系统或网络错误！");
	            }  
	        });
        });
        
        
    });
</script>
</body>
</html>