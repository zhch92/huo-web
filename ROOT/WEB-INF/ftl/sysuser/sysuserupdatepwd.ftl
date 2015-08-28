<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>账户管理-修改密码</title>
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
                    <form action="" id="myform">
                    	<input name="adminid" type="hidden" value="${admin.adminid}">
                        <table border="1" cellspacing="0" rules="all">
                          <tbody>
                              <tr>
                                  <td class="name" width="13%">账户名</td>
                                  <td width="87%">   ${admin.username}</td>
                              </tr>
                              <tr>
                                  <td class="name">姓名</td>
                                  <td>${admin.realname}</td>
                              </tr>
                              <tr >
                                  <td class="name">密码</td>
                                  <td> <input  type="password" id="password" name="password" value="">
                                  </td>
                              </tr>
                               <tr >
                                  <td class="name">确认密码</td>
                                  <td> <input  type="password" id="repassword" name="repassword" value="">
                                  </td>
                              </tr>
                          </tbody>
                        </table>
                         </form>
                        <div class="btn"><button class="cel"  onclick="history.go(-1)">返 回</button><button class="confirm" onclick="saveUser();">保 存</button></div>
                    </div>
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
          	
        	var password = $("#password").val();
        	var repassword = $("#repassword").val();
        	
	        
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
	            url:"/ajax/updatepwd.htm",  
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
		}

        
        
</script>
</body>

</html>
