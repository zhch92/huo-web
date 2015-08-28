<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>账户注册-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/info.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/register.js"></script>
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

<body style="background: #f3f3F3">
    <#include "common/head.ftl"/>
    <div class="content">
        <div class="logo">
            <a href="/index.htm"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
        </div>
        <div class="main_1">
             <!--    <h1>免费注册 <input class="driver" type="radio" name="register" onclick="registertype('1');" >
                <span>司机</span><input type="radio" class="comp" name="register"  onclick="registertype('2');"><span>货方</span></h1> -->
                           
                     <h1>免费注册</h1>
            <ul class="change clearfix">
                <li>
                <img  class="driver driver_img" src="http://192.168.2.50:8089/statics/images/driver.png" alt="">
                    <p> <input class="driver" id="driverbtn" type="radio" name="register"  onclick="registertype('1');" ><span>司机</span></p>
                </li>
                <li>
                <img  class="comp" src="http://192.168.2.50:8089/statics/images/comp.png" alt="">
                    <p><input class="comp" id="compbtn"  type="radio" name="register" onclick="registertype('2');"><span>货方</span></p>
                </li>
            </ul>          
                           
                                <!-- 司机  -->
                 <div id="personchosee" class="person chosee ">
                  <p class="me_car">我的货车</p>
            <div class="info_1">
                <ul class="car_info clearfix">
                    <li class="li_1">
                        <div class="img img_1"></div>
                       <input type="radio" name="cartype"  value="7">箱式车
                    </li>
                    <li class="li_1">
                        <div class="img img_2"></div>
                          <input type="radio" name="cartype"   value="11">高栏车
                    </li>
                    <li class="li_1">
                        <div class="img img_3"></div>
                        <input type="radio" name="cartype"  value="1">平板车
                    </li>
                    <li class="li_1">
                        <div class="img img_4"></div>
                         <input type="radio" name="cartype"  value="0">其它
                    </li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  value="1">9.6 m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  value="2">&nbsp12 m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  value="3">17.5m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  value="0">其它</li>
                </ul>
                <div class="table" style="width:505px;">
                    <ul class="clearfix">
                        <li>姓名
                         <input type="text" id="drvname" name="drvname">
                        </li>

                        <li style="margin-left:40px;">车牌
                            <input type="text" id="carnum" name="carnum" >
                        </li>

                    </ul>
                </div>
                <div class="verify">
                    <ul>
                        <li class="li_1">手机
                             <input type="text" id="drviermoblie" name="drviermoblie" value="请输入手机号" 
							onkeyup="checkIsExits(this);"
							onblur="if(this.value==''){this.style.color='#ccc';value='请输入手机号'}" 
							onfocus="if(this.value=='请输入手机号'){this.style.color='#999';value=''}else{this.style.color='#999';select();}"/>
                            <input class="msg" type="submit" id="drvyzm" value="获取验证码">
                        </li>
                        <li class="li_2">验证码
                           <input type="text" id="drtiverYzm" name="drtiverYzm" value="输入六位数验证码"
							onblur="if(this.value==''){this.style.color='#ccc';value='输入六位数验证码'}"
							onfocus="if(this.value=='输入六位数验证码'){this.style.color='#999';value=''}else{this.style.color='#999';select();}" 
							class="login_yzm" />
                        </li>
                        <li class="li_1">密码
                            <input type="password" id="driverpassword">
                        </li>
                    </ul>
                    <p style="text-align:center;margin-top:30px;" class="bttn">
                       <button class="sure" id="drireg">注册</button>
                    </p>
                </div>
                 </div>
            </div>
                <div id="companychosee" class="company chosee">
                  <div class="info">
                <p style="padding-left:277px;margin-top:87px;">企业名称
                    <input style="width:147px;" type="text" id="companyname">
                </p>
                <div class="verify">
                    <ul>
                        <li class="li_1">手机
                        <input type="text" id="companymoblie" name="companymoblie" value="请输入手机号" 
							onkeyup="checkIsExits(this);"
							onblur="if(this.value==''){this.style.color='#ccc';value='请输入手机号'}" 
							onfocus="if(this.value=='请输入手机号'){this.style.color='#999';value=''}else{this.style.color='#999';select();}"/>
                            <input class="msg" type="submit" id="yzm" value="获取验证码">
                        </li>
                        <li class="li_2">验证码
                         <input type="text" id="companyYzm" name="companyYzm" value="输入六位数验证码"
							onblur="if(this.value==''){this.style.color='#ccc';value='输入六位数验证码'}"
							onfocus="if(this.value=='输入六位数验证码'){this.style.color='#999';value=''}else{this.style.color='#999';select();}" 
							class="login_yzm" />
                        </li>
                        <li class="li_1">密码
                            <input type="password" id="compassword">
                        </li>
                    </ul>
                    <p style="text-align:center;margin-top:50px;" class="bttn"><button class="sure" id="comreg">注册</button></p>
                </div>
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
    var canSend = true;
    var i = 60;
    var intervalid;
    $(document).ready(function(){
          document.getElementById('personchosee').style.display = "none";
          document.getElementById('companychosee').style.display = "none";
          //点击选框切换背景
          $("input").on("click", function() {
                  $(".main_1").addClass("main_2")
              })
              //显示司机注册
          $("h1 .driver").on("click", function() {
               $(".company").removeClass("register_active");
              $(".person").addClass("register_active")
          });
          //显示货方注册
          $("h1 .comp").on("click", function() {
                $(".person").removeClass("register_active");
              $(".company").addClass("register_active")
          });
          
          //验证码货主
    	  $("#yzm").click(function(){
    	  	  if(!canSend){
    	  		return false;
    	  	  }
    	   	  var phone=$('#companymoblie').val();
    	  	  if(!isPhoneNumber(phone)){
    	  	  	alert("请输入正确的手机号！");
    	  	  	return;
    	  	  }
    	  	  canSend = false;
    		  $("#yzm").attr("disabled", "disabled");
    		  intervalid= setInterval("countdown(1)", 1000);
    		   $.post("/ajax/sendRegisterSmsCode.htm",{phoneNumber:$('#companymoblie').val()},
    			  function(data){
    			  // alert(data.msg);
    			    if(data.flag == 1){
    			    	//todo
    			    }else{
    			    	alert('发送验证码失败！');
    			    	i = 1;
    			    }
    			  },
    			  "json");
    	  });	
          //验证码司机
    	  $("#drvyzm").click(function(){
    	  	  if(!canSend){
    	  		return false;
    	  	  }
    	   	  var phone=$('#drviermoblie').val();
    	  	  if(!isPhoneNumber(phone)){
    	  	  	alert("请输入正确的手机号！");
    	  	  	return;
    	  	  }
    	  	  canSend = false;
    		  $("#drvyzm").attr("disabled", "disabled");
    		  intervalid= setInterval("countdown(0)", 1000);
    		   $.post("/ajax/sendRegisterSmsCode.htm",{phoneNumber:$('#drviermoblie').val()},
    			  function(data){
    			    if(data.flag == 1){
    			    	//todo
    			    }else{
    			    	alert('发送验证码失败！');
    			    	i = 1;
    			    }
    			  },
    			  "json");
    	  });	
    });
    //注册方式
    function registertype(val){
    	if(val==="1"){
    		document.getElementById('personchosee').style.display = "";
    		document.getElementById('companychosee').style.display = "none";
    	}else{
    		document.getElementById('companychosee').style.display = "";
    		document.getElementById('personchosee').style.display = "none";
    	}
    }
    
    //验证电话号码
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
    //倒计时
		function countdown(type) {
	         if(type==0){
	         	$("#drvyzm").val(i+"秒后重发");
	         }else{
	         	$("#yzm").val(i+"秒后重发");
	         }
	         i--;
	         if (i == -1) {
	         	 canSend = true;
	           clearInterval(intervalid);
	             $("#drvyzm").val("发送验证码");
	             $("#yzm").val("发送验证码");
	             $("#yzm").removeAttr("disabled");
	             $("#drvyzm").removeAttr("disabled");
	             i=60;
	         }     
		}
    
    //验证电话号码是否已经注册
	function checkIsExits(obj){
		if(obj.value!=""){
			$.post("/ajax/checkUserNameIsExits.htm",{userName:obj.value},
				  function(data){
					  	if(data.flag==1){					  		
					  	}else{
					  		alert(data.msg);
					    	obj.value="";
					    }
				   },
			"json");
		}
	}
    //货主提交
	  $("#comreg").click(function(){
	   	  var phone=$('#companymoblie').val();
	   	  phone=$.trim(phone);
	  	  if(!isPhoneNumber(phone)){
	  	  	alert("请输入正确的手机号！");
	  	  	return;
	  	  }
	  	  if($.trim($("#companyname").val())===""){
		  	  	alert("请输入企业名称！");
		  	  	return;
		  	  }
	  	  var password=$('#compassword').val();
	  	  password=$.trim(password);
	  	  if(password.length<6||password.length>12){
	  	  	alert("请输入6到12位密码！");
	  	  	return;
	  	  }
	  	  var zcYzm=0;
	  	  
	  	  var yzm=$('#companyYzm').val();
	  	  yzm=$.trim(yzm);
	   $.post("/ajax/registerUser.htm",{userName:phone,password:password,usertype:2,yzm:yzm,zcYzm:zcYzm,comName:$("#companyname").val()},
		  function(data){
		  	if(data.flag==1){
		  		 window.location.href="/user/registersuccess.htm?type=2"; 
		  	}else{
		  		//$('#companyLoginZcSrc').attr("src", "/ajax/creatVerificationCode.htm?d="+new Date()*1+1);
		    	alert(data.msg);
		    }
		  },
		  "json");
  });
    
	    //司机提交
	  $("#drireg").click(function(){
		  //车厂
		  var carLong=-1;
		    var checkzone1 = document.all("car_long");
		      for(var i=0;i<checkzone1.length;i++){  
		         if(checkzone1[i].checked){
		        	 carLong=checkzone1[i].value;
		       }
		    }
		     //车型
		   var carType=-1;
			    var checkzone = document.all("cartype");
			      for(var i=0;i<checkzone.length;i++){  
			         if(checkzone[i].checked){
			        	 carType=checkzone[i].value;
			       }
			    }
			 if(carType==-1){
		            	alert("请选择车型！");
		    	  	  	return;	
					}  
			if(carLong==-1){
				alert("请选择车长！");
		  	  	return;
			}  
		  	  if($.trim($("#carnum").val())===""){
			  	  	alert("请输入车牌号！");
			  	  	return;
			  	  }
		  	if($.trim($("#drvname").val())===""){
		  	  	alert("请输入姓名！");
		  	  	return;
		  	  }
	   	  var phone=$('#drviermoblie').val();
	   	  phone=$.trim(phone);
	  	  if(!isPhoneNumber(phone)){
	  	  	alert("请输入正确的手机号！");
	  	  	return;
	  	  }
	  	  
	  	  var password=$('#driverpassword').val();
	  	  password=$.trim(password);
	  	  if(password.length<6||password.length>12){
	  	  	alert("请输入6到12位密码！");
	  	  	return;
	  	  }
	  	  var zcYzm=0;
	  	  var yzm=$('#drtiverYzm').val();
	  	  yzm=$.trim(yzm);
	  	   $.post("/ajax/registerUser.htm",{userName:phone,password:password,usertype:1,yzm:yzm,zcYzm:zcYzm,
	  		    comName:$("#drvname").val(),carType:carType,carLength:carLong,carnum:$("#carnum").val()},
	  			  function(data){
	  			  	if(data.flag==1){
	  			  		 window.location.href="/user/registersuccess.htm?type=1"; 
	  			  	}else{
	  			    	alert(data.msg);
	  			    }
	  			  },
	  			  "json");
  });
    
    </script>
</body>

</html>

</#escape> </#compress>