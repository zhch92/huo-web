<div class="lside">
                <ul >
                <#if Session["用户管理-司机"]==1 ||  Session["用户管理-企业"]==1>
                    <li class="li_1">
                    <a href="/usermanagement.htm"></a>
                    </li>
                    </#if>
                     <#if Session["业务管理-货源"]==1 || Session["业务管理-交易"]==1 >
                    <li class="li_2">
                <a href="/cargoList.htm"></a>
                    </li>
                    </#if>
                     <#if Session["数据引擎-司机"]==1 || Session["数据引擎-企业"]==1 || Session["数据引擎-交易"]==1 || Session["数据引擎-货源"]==1  || Session["数据引擎-金融"]==1>
                    <li class="li_3">
                <a href="/datauser.htm"></a>
                    </li>
                    </#if>
                     <#if Session["操作中心-手机APK"]==1 || Session["操作中心-交易投诉"]==1 || Session["操作中心-批量发送短信"]==1>
                    <li class="li_4">
                <a href="/mobilelist.htm"></a>
                    </li>
                    </#if>
                     <#if Session["账户管理-账户"]==1>
                      <li class="li_6">
                <a href="/sysuserlist.htm"></a>
                    </li> 
                    </#if>
                     <#if  Session["呼叫中心-撮合交易"]==1 ||  Session["呼叫中心-发布货源"]==1 ||  Session["呼叫中心-用户认证"]==1 >
                    <li class="li_7">
                   <a href="/taskcargo.htm"></a>
                    </li>
                    </#if>
		  <#if Session["活动列表"]==1>
                    <li class="li_9">
                   <a href="/packetActive.htm"></a>
                    </li>
                  </#if>
                    <li id="exitSys" class="li_8">
                   <a href="#"></a>
                    </li>

                </ul>
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


