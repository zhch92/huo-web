<div class="left">
    <div class="nav">
        <div class="navtitle">导航栏</div>
        <div class="navinfo">
            <ul>
        		${menu(Session["user_id"])}
                <li id="exitSys"><a href="#">安全退出</a></li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
			  $('#exitSys').click(function(){

					if(confirm("确认要退出？"))
  					{
    					exitSys();
   					}
			  });

			   function exitSys(){

			  		$.post("/ajax/outLogin.htm",
					  function(data){
					  	if(data.flag==1){
					    	window.location.href = "/login.htm";
					  	}else{
					    	$.alert('抱歉，退出失败！');
					    }
					  },"json");
			  }

</script>