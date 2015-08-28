<#compress>
    <#escape x as x?html>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="refresh" content="75" >
            <title>呼叫中心</title>
            <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
            <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/call_center.css">
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
                <div class="main clearfix">
                    <#include "common/leftbar.ftl">
                        <div class="rside">
                            <div class="table">
                                <div class="chose  clearfix">
                                    <ul class="chose_item clearfix">
                                    <li class="chose_active "><a href="/taskcargo.htm">发布货源</a></li>  
									<#if Session["呼叫中心-撮合交易"]==1><li class="l_side"><a href="/pushDealmaking.htm">撮合交易</a></li></#if> 
									<#if Session["呼叫中心-交易跟踪"]==1><li class="l_side"><a href="/transactionTracking.htm">交易跟踪</a></li></#if> 
									<#if Session["呼叫中心-呼叫接入"]==1><li class="l_side"><a href="#">呼叫接入</a></li></#if> 
									<#if Session["呼叫中心-用户认证"]==1><li class="l_side"><a href="/userinfolist.htm">用户认证</a></li></#if> 
                                    <#if Session["活动列表-确认交易列表"]==1><li class="l_side"><a href="/tradeSure.htm">交易确认</a></li></#if> 

                                    </ul>
                                    </div>
                                <div class="chose  clearfix">

                                     <ul class="clearfix">
                                     <li class="add"><a href="/taskcargoadd.htm">新建货源</a></li> 
                                    </ul>
                                    </div>
                                    <form action="/taskcargo.htm" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                                <div class="item" id="content">
                                    <ul class="clearfix">
                                        <#if autoNewCargoList ??>
                                            <#list autoNewCargoList as autonewcargo>
                                                <li   id="${autonewcargo.userId}li">
                                                    <a href="javascript:void(0);" onclick="javascript:window.location.href='/taskcargodetails.htm?userId=${autonewcargo.userId}'" >
                                                    <p class="name" id="${autonewcargo.userId}">${autonewcargo.user.companyInfo.companyName} <span style="display:none">${autonewcargo.taskTime}</span></p>
                                                   
                                                        <p class="time">已等待&nbsp&nbsp&nbsp<strong  id="${autonewcargo.userId}x"></strong></p>
                                                    </a>
                                                </li>
                                                 <script type="text/javascript">
                                                         
                                                          function show_date_time${autonewcargo.userId}x() {
                                                             window.setTimeout("show_date_time${autonewcargo.userId}x()", 1000);
                                                             var date = '${autonewcargo.taskTime}';
                                                             target = new Date(date); 
                                                             today = new Date();
                                                             timeold = (today.getTime() - target.getTime());
                                                             sectimeold = timeold / 1000
                                                             secondsold = Math.floor(sectimeold);
                                                             msPerDay = 24 * 60 * 60 * 1000
                                                             e_daysold = timeold / msPerDay
                                                             daysold = Math.floor(e_daysold);
                                                             e_hrsold = (e_daysold - daysold) * 24;
                                                             hrsold = Math.floor(e_hrsold);
                                                             e_minsold = (e_hrsold - hrsold) * 60;
                                                             minsold = Math.floor((e_hrsold - hrsold) * 60);
                                                             seconds = Math.floor((e_minsold - minsold) * 60);
                                                             if (hrsold < 10) {
                                                                 hrsold = "0" + hrsold
                                                             }
                                                             if (minsold < 10) {
                                                                     minsold = "0" + minsold
                                                             }
                                                                 if (seconds < 10) {
                                                                 seconds = "0" + seconds;
                                                                
                                                             }
                                                             var timer= daysold+"天"+hrsold + ":" + minsold + ":" + seconds;
                                                             $("#${autonewcargo.userId}x").text(timer);
                                                          if(minsold >=2){
                                                      $("#${autonewcargo.userId}li").addClass('common');
                                                          }  
                                                          if(minsold >=5){
                                                      $("#${autonewcargo.userId}li").addClass('urgency');
                                                          }     
                                                          if(hrsold >0 || hrsold>0 || daysold>0){
                                                           $("#${autonewcargo.userId}li").addClass('urgency');
                                                          }
                                                           }
                                                        show_date_time${autonewcargo.userId}x();
                                                    </script>
                                            </#list>
                                            <#else>
                                            <div class="no-call" style="width: 175px;height: 165px;margin: 200px auto;"><img src="http://192.168.2.50:8089/statics/images/no_call.png" alt=""></div>
                                        </#if>
                                    </ul>
                                </div>
                            
                          
                    </div>  <#if pageSum gte 1>
                        <div class="page clearfix">
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/15)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                            <ul class="clearfix">
                              <#if page != 0 >
                                <li class="home" >
                                    <a href="javascript:;" onclick="javascript:goPage(0)">&nbsp;&nbsp;</a>
                                </li>
                                 </#if>
                                  <#if page-1 gte 0 >
                                <li class="pgup"  >
                                    <a href="javascript:;" onclick="javascript:goPage(${page}-1)">&nbsp;&nbsp;</a>
                                </li>
                                  </#if>
                                <#if page+1 lte pageSum >
                                <li class="end" >
                                    <a href="javascript:;" onclick="javascript:goPage(${page}+1)">&nbsp;&nbsp;</a>
                                </li>
                                 </#if>
                                 <#if page != pageSum >
                                <li class="pgdn" >
                                    <a href="javascript:;" onclick="javascript:goPage(${pageSum})">&nbsp;&nbsp;</a>
                                </li>
                                  </#if>
                            </ul>
                        </div>
                         </#if>
                    </form>
                            
                        </div>
                </div>
            </div>
            <#include "common/foot.ftl">
                <script>
                $(document).ready(function() {
                    $(".li_7").addClass("active");
                }) ;
          function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    }
       
</script>
        </body>

        </html>
    </#escape>
</#compress>
