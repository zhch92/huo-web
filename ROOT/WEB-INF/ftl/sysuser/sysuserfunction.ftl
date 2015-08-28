<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>账户管理-权限配置</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/account.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
     <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.form.js"></script>
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
            <div class="rside">
                <div class="table">
                    <div class="account">
                        <table border="1" cellspacing="0" rules="all">
                          <tbody>
                          <#if admin??>
                              <tr>
                                  <td width="13%">账户名</td>
                                  <td width="87%">${admin.username}</td>
                              </tr>
                              <tr>
                                  <td>登录密码</td>
                                  <td>dfuhefhwesdfiuhsdifsdhfu</td>
                              </tr>
                              <tr>
                                  <td>权限设置</td>
                                  <td class="item">
                                      <div>
                                          <ul class="clearfix" style="padding-left:10px;">
                                          <form action="" id="myform">
	                            		<input type="hidden" name="adminid" value="${admin.adminid}">
	                            		<input type="hidden" name="hasBefore" value="${hasBefore}">
                						<#if systemfunctions??>
                						<#list systemfunctions as sysfunction>
                							<li><input style="width:16px;" name="sysfunctions" 
                								type="checkbox" value="${sysfunction.functionid}" 
                								
                								<#if userfunctionIds??>
                								<#list userfunctionIds as userfunctionid>
													<#if sysfunction.functionid==userfunctionid>checked</#if>
												</#list>
												</#if>
                							/>${sysfunction.functionname?trim}&nbsp;&nbsp;&nbsp;</li>
					                    </#list>
					                    </#if>
					                    
									</form>
                                          </ul>
                                      </div>
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
                        <div class="btn"><button class="cel" onclick="history.go(-1)">返 回</button><button class="confirm" onclick="saveUser();">授 权</button></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
        </div>
    </div>
       <script type="text/javascript">
          $(document).ready(function(){
        $(".li_6").addClass("active");
    })
        function saveUser() {
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
		}

        
        
</script>
</body>

</html>
