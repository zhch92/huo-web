<#compress>
    <#escape x as x?html>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta charset="UTF-8">
            <title>呼叫中心-撮合交易</title>
            <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
            <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/help_Trade.css">
            <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
            <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
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
                                <div class="chose  clearfix">
                                    <ul class="chose_item clearfix">
										
									<#if Session["呼叫中心-发布货源"]==1><li><a href="/taskcargo.htm">发布货源</a></li></#if> 
									 <li class="l_side chose_active"><a href="/pushDealmaking.htm">撮合交易</a></li>
									<#if Session["呼叫中心-交易跟踪"]==1><li class="l_side"><a href="/transactionTracking.htm">交易跟踪</a></li></#if> 
									<#if Session["呼叫中心-呼叫接入"]==1><li class="l_side"><a href="#">呼叫接入</a></li></#if> 
									<#if Session["呼叫中心-用户认证"]==1><li class="l_side"><a href="/userinfolist.htm">用户认证</a></li></#if>
									<#if Session["活动列表-确认交易列表"]==1><li class="l_side"><a href="/tradeSure.htm">交易确认</a></li></#if>
									
                                    </ul>
                                </div>
                                <div class="title"><div class="nav">
                                        <input id="nav" type="text" placeholder="搜索车方姓名"><input class="btn" onclick="navName()" type="submit" value=" ">
                                    </div><a class="active" href="javascript:void(0);" onClick="screen('0')" >主动撮合</a>&nbsp&nbsp|&nbsp&nbsp<a href="javascript:void(0);" onClick="screen('1')" >呼入撮合</a>
                                </div>
                                    <form action="/pushDealmaking.htm" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                                <div class="item" id="item">
                                    <ul class="clearfix">
                                        <#if driverList ??>
                                            <#list driverList as driver>
                                                <li>
                                                    <a href="javascript:void(0);" onclick="javascript:window.location.href='/pushDealmakDetails.htm?userId=${driver.userId}'">
                                                        <p id="${driver.userId}" class="name">${driver.driverName} &nbsp&nbsp师傅&nbsp&nbsp&nbsp&nbsp${driver.carNumber}</p>
                                                        <p    class="phone">电话&nbsp&nbsp&nbsp<strong>${driver.mobile}</strong></p>
                                                    </a>
                                                </li>
                                            </#list>
                                        </#if>
                                    </ul>
                                </div>
                            </div>
                            <#if pageSum gte 1>
                       <div class="page clearfix"><ul class="clearfix">
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
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/15)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                            
                        </div>
                         </#if>
                         </form>
                         </div>
                        </div>
                </div>
            </div>
            <#include "common/foot.ftl">
            <script> 
            $(document).ready(function(){
            $(".li_7").addClass("active");
             $(".table .title a").on('click',function(){
                    $(this).addClass("active").siblings().removeClass("active");
                });
                document.onkeydown = function(event) {
        var e = event ? event : (window.event ? window.event : null);
        if (e.keyCode == 13) navName()
    };       
            })
            function navName(car){
            
            var driverName=$("#nav").val();
            var carName=driverName; 
            
               <#if driverList ??>
                                            <#list driverList as driver>
                          if (carName =='${driver.driverName}') { var addUl='<ul class=\"clearfix\"> <li><a href=\"javascript:void(0);\"onclick=\"javascript:window.location.href=\'/pushDealmakDetails.htm?userId=${driver.userId}\'\"><p id=\"${driver.userId}\" class=\"name\">${driver.driverName} &nbsp&nbsp师傅&nbsp&nbsp&nbsp&nbsp${driver.carNumber}</p><p class=\"phone\">电话&nbsp&nbsp&nbsp<strong>${driver.mobile}</strong></p></a></li></ul>'
                               $("#item").empty();
                               $("#item").append(addUl);
                                          }
                                         
                                                    </#list>
                                        </#if>

            }
            var cargotype=0;
            function screen(val){
            if(val=="0"){
            cargotype=0;
             window.location.href="/pushDealmaking.htm?type=0";  
             return cargotype;
            } 
            if(val=="1"){
            cargotype=1;
             window.location.href="/pushDealmaking.htm?type=1";  
             return cargotype;
            };
            }
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
