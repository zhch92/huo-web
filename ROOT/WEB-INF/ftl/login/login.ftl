<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="">
<meta http-equiv="description" content="This is my page">
    <title>登录</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
</head>

<body>
    <div class="header">
        <div class="head">
            <div class="logo"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></div>
        </div>
    </div>
    <div class="content ">
       <div class="login">
           <h3>货管家数据引擎</h3>
           <div class="login_info">
           <form action="/doLogin.htm" method="post" id="youform">
               <ul>
                   <li>账号<input type="text" name="loginName" id="loginName" style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;" /></li>
                   <li>密码<input type="password" name="password" id="password" style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;" /></li>
                   <li class="btn clearfix"><a href="#"  id="login_button">登录</a></li>
               </ul>
          </form>
           </div>
       </div>
    </div>
     <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
        </div>
    </div>
<script type="text/javascript">

$(document).ready(function() {
		
		if(window!=window.top){
			window.top.location = window.location
			return;
		}
		
		$("#loginName").focus();
		
		$('#loginName').keydown(function(e){
			if(e.keyCode==13){
				$("#password").select();
			}
		}); 
		$('#password').keydown(function(e){
			if(e.keyCode==13){
				$("#login_button").click();
			}
		}); 
		$("#login_button").click(function() {
			if(!validate()){
				return;
			}
            $("#youform").submit();
		});

		
	
});
function validate(){
	if($("#loginName").val().replace(/^(\s+)|(\s+)$/g, "")==""){
		alert("用户名不能为空");
		$("#loginName").focus();
		return false;
	}
	var pwdValue = $("#password").val().replace(/^(\s+)|(\s+)$/g, "");
	if(pwdValue==""){
		alert("密码不能为空");
		$("#password").select();
		return false;
	}
	return true;
}
</script>    
    
</body>

</html>
