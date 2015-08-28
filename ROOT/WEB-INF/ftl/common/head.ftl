<#compress >
    <#escape x as x?html>
 <div class="header">
                     <div class="head clearfix">
            <div class="tel">
                欢迎您！客服电话： 028-617-93885
            </div>
            <ul>
            <#if Session["user_id"]?exists> 
                	 <li class="user">您好！
                	<#if ("${helloUser('${user_id}','getUserType')}"==2)>
                	  &nbsp<a href="/orders/cargoerOrdersList.htm"><span>${helloUser('${user_id}')}&nbsp</span></a></li>
                		  <li class="test"><a class="active"  href="/orders/cargoerOrdersList.htm">马上免费调车</a></li>
                	<#else>
                	    &nbsp<a href="/orders/driverOrdersList.htm"><span>${helloUser('${user_id}')}&nbsp</span></a></li>
	                	<li>&nbsp&nbsp<a class="active" href="/orders/driverOrdersList.htm">我的订单</a>	</li>     
                	</#if>
                	<li>&nbsp&nbsp<a class="active" href="javascript:void(0)" onclick="logout();">退出</a></li>	
           <#else>
            <li class="login"><a class="active" href="/login.htm" id="loginBtn" >登录</a>&nbsp|&nbsp <a class="active" href="/register.htm" >注册</a> </li>
              <li class="test"><a class="active"  href="/login.htm" id="loginBtn" class="divBoxButton">马上免费调车</a></li>
		   </#if>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
    function logout(){
   	  $.ajax({
           type: "POST",
           url: "/ajax/logout.htm",
           datatype:"json",
           success: function(data)
           {
         	  var obj=eval('('+data+')'); 
         	  	if(obj.flag==1){
 				    	window.location.href = "/index.htm";
 				  	}else{
 				    	alert('抱歉，退出失败！');
 				    }
           }
           });
     }
</script>
    </#escape>
</#compress>