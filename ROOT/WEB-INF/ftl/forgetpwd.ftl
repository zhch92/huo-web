<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>忘记密码-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/login.css">
    <script type="text/javascript"  src="http://192.168.2.50:8089/static/js/jquery-1.7.2.min.js"></script>
    <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?39f1eef3f577e574e809dcb29d873fd2";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
    
</head>

<body>
  <#include "common/head.ftl"/>
<div class="main_f">
	<div class="main">
		<div class="logo"><a href="/index.htm"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a></div>
		<div class="step">
			<h3>忘记密码</h3>
			<div class="step_show">
				<ul class="clearfix">
					<li>
						<div class="img img_active" id="step1">第一步</div>
					<b class="b_active" id="b1"></b>
						<p>身份验证</p>
					</li>
					<li>
						<div class="img" id="step2">第二步</div>
					<b id="b2"></b>
						<p>重置密码</p>
					</li>
					<li>
						<div class="img" id="step3">第三步</div>
					<b id="b3"></b>
						<p>完成</p>
					</li>
				</ul>
			</div>
			<div class="table">
				<ul id="ul1" class="next_1 next_active">
					<li>手 机
					<input id="phnenum" type="text" class="tel" value="请输入手机号" onblur="if(this.value==''){this.style.color='#ccc';value='请输入手机号'}"
					onfocus="if(this.value=='请输入手机号'){this.style.color='#333';value=''}else{this.style.color='#333';select();}" />
					<input class="msg" type="submit" id="yzm" value="发送验证码" >
					</li>
					<li>验证码
                    <input class="code" id="phonecode" type="text" value="请输入6位短信验证码" 
					onblur="if(this.value==''){this.style.color='#ccc';value='请输入6位短信验证码'}" 
					onfocus="if(this.value=='请输入6位短信验证码'){this.style.color='#333';value=''}else{this.style.color='#333';select();}" />
					<input type="hidden" id="tempId">
					<input class="next" type="submit" onclick="checksteps('1');" value="下一步"></li>
				</ul>
				<ul id="ul2" class="next_2 ">
					<li style="padding-left:25px;">新密码
					<input class="code" id="newpwd" type="password" />
					</li>
					<li>确认新密码
					<input class="code" id="newpwd2" type="password" />
					<input class="next" type="submit" onclick="checksteps('2');" value="下一步"></li>
				</ul>
				<ul id="ul3" class="next_3">
					<li>密码修改成功！请妥善保管！</li>
					<li><button class="next" onclick="repwdok();">完成</button></li>
				</ul>
			</div>
		</div>
	</div>
</div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 蜀ICP备15006511号-1</p>
        </div>
    </div>
   <script type="text/javascript">
   $(document).ready(function(){   
	   $('#yzm').click(function(){
	  		sendWjSMSValid("/ajax/user/sendToMobile.htm",$('#phnenum').val(),$(this));
	  		return false;
	  });
	   
   });
   function checksteps(val){
	   if(val==='1'){
		   
	  		
	  		var $mobileNo = $('#phnenum').val()?$.trim($('#phnenum').val()):'';
	  		var $checkCode = $('#phonecode').val()?$.trim($('#phonecode').val()):'';
	  		if(!$mobileNo || !$checkCode){
	  			alert("请输入手机号和验证码");
	  			return false;
	  		}
	  		if(!isPhoneNumber($mobileNo)){
	  			alert("请输入正确的手机号");
	  			return false;
	  		}
	  		if($checkCode.length!=6){
	  			alert("请输入正确的验证码");
	  			return false;
	  		}
	  		$.post("/ajax/user/confirmUser.htm",{checkCode:$('#phonecode').val(),mobile:$('#phnenum').val()},
			  function(data){
			  	if(data.flag==1){
			  		$('#tempId').val(data.data);
			  		//$('#toForgetPwd3').attr("userId",);
			  	}else{
			  		alert(data.msg);
			    }
			  },"json");
		   
		   
		  document.getElementById('step1').className = "img";
		  document.getElementById('step2').className ='img img_active';
		  document.getElementById('b1').className = "b_no";
		  document.getElementById('b2').className ='b_active';
		  document.getElementById('ul1').className = "next_1";
		  document.getElementById('ul2').className ='next_2 next_active';
	   }else if(val==='2'){
	  		var newPwd = $('#newpwd').val()?$.trim($('#newpwd').val()):'';
	  		var rePwd = $('#newpwd2').val()?$.trim($('#newpwd2').val()):'';
	  		if(newPwd!="" && rePwd!="" && (newPwd == rePwd) ){
	  	  	  $.ajax({
	              type: "POST",
	              url: "/ajax/user/resetPwd.htm",
	              data:{userId:$('#tempId').val(),newPwd:newPwd,rePwd:rePwd},
	              datatype:"json",
	              success: function(data)
	              {
	            	  var obj=eval('('+data+')'); 
	            		if(obj.flag==1){
	            			 document.getElementById('step2').className = "img";
	            			  document.getElementById('step3').className ='img img_active';
	            			  document.getElementById('b2').className = "b_no";
	            			  document.getElementById('b3').className ='b_active';
	            			  document.getElementById('ul2').className = "next_1";
	            			  document.getElementById('ul3').className ='next_3 next_active';	
	            			  $(".next_3").show();
					  	}else{
					  		alert(obj.msg);	
					    }
	              }
	              });
	  			
	  		}else{
	  			alert("两次输入密码不一致!");
	  		}
	   }
   }
   
   function repwdok(){
	   window.location.href="/login.htm";
   }
   
   var isSendSMSValid = true;
	function sendWjSMSValid(url,mobileNo,sendBtn){
		if(!isSendSMSValid){
	  		return false;
	  	}
		if(!isPhoneNumber(mobileNo)){
			alert("请输入正确的手机号！");
			return false;
		}
		
		sendBtn.attr("disabled", "disabled");
	    $.post(url,{mobileNo:mobileNo},
			function(data){
			    if(data.flag==1){
			    	alert("短信发送成功");
			    	isSendSMSValid = false;
			    	intervalid1= setInterval(function(){
			    		countSecond(sendBtn);
			    	}, 1000);
			    }else{
			    	alert(data.msg+" 请重新填写！");
			    	sendBtn.removeAttr("disabled");
			    }
		  	},"json");
	}
	function isPhoneNumber(phoneNumber){
			var re = /^[\d]+$/ 
		if(!re.test(phoneNumber)){
			return false;
		} 
			if(phoneNumber.length!=11){
			return false;
		}else{
			return true;
		}
		}
	var i_fp = 60;
	var isRestart = false;
	function countSecond(sendBtn,isRestart) {
        $("#yzm").val(+i_fp+"秒后重发");
        i_fp--;
        if (i_fp == -1) {
            isSendSMSValid = true;
            clearInterval(intervalid1);
            sendBtn.val("发送验证码");
            sendBtn.removeAttr("disabled");
            i_fp=60;
        } 
	}
	function banBackSpace(e){ 
		var ev = e || window.event;
		var obj = ev.target || ev.srcElement;

		var t = obj.type || obj.getAttribute('type');

		var vReadOnly = obj.getAttribute('readonly'); 
		var vEnabled = obj.getAttribute('enabled'); 
		vReadOnly = (vReadOnly == null) ? false : vReadOnly; 
		vEnabled = (vEnabled == null) ? true : vEnabled; 

		var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea") 
		&& (vReadOnly==true || vEnabled!=true))?true:false; 

		var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea") 
		?true:false; 

		if(flag2){ 
		return false; 
		} 
		if(flag1){ 
		return false; 
		} 
		} 
		document.onkeypress=banBackSpace; 
		document.onkeydown=banBackSpace;
   </script>
</body>

</html>

</#escape> </#compress>