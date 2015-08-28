<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>添加用户_货管家管理后台</title>
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
                添加用户
            </div>
            <div class="rightok">
                
				<form action="" id="myform">
                    <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                        <tbody>
	                        <tr>
	                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">账户名：</td>
							    <td width="15%">
							        <input style="width:150px" type="text" id="username" name="username" value="">
							    </td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">姓名：</td>
							    <td width="15%">
							        <input style="width:150px" type="text" id="realname" name="realname" value="">
							    </td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">密码：</td>
							    <td width="15%">
							        <input style="width:150px" type="password" id="password" name="password" value="">
							    </td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" style="background: #fafafa;" width="3%">确认密码：</td>
							    <td width="15%">
							        <input style="width:150px" type="password" id="repassword" name="repassword" value="">
							    </td>
	                        </tr>
	                        <tr>
	                        	<td nowrap="nowrap" colspan="8" align="left">
	                                <input id="auditSumbit" type="button" style="width: 100px" value="保存">
	                                <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
	                            </td>
	                        </tr>
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
        
		$("#auditSumbit").click(function(){
        	var accountRecordId = $("#accountRecordId").val();
        	var username = $("#username").val();
        	var password = $("#password").val();
        	var repassword = $("#repassword").val();
        	
	        if(!username || !$.trim(username)){
	        	return alert("账户名不能为空");
	        }
	        if(!password || !$.trim(password) ){
	        	return alert("密码不能为空");
	        }
	        if(!repassword || !$.trim(repassword) ){
	        	return alert("确认密码不能为空");
	        }
	        if($.trim(password)!=$.trim(repassword)){
	        	return alert("密码和确认密码不一致");
	        }
			$("#myform").ajaxSubmit({  
	            url:"/ajax/addAdmin.htm",  
	            type:"post",
	            dataType:'json',
	            success:function(data) {
					if(data && data.flag==1){
						alert("操作成功！");
						window.location.href=data.data;
					}else{
						alert(data.msg?data.msg:"系统异常!");
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