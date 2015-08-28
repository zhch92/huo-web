<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>业务管理--货源管理</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/laydate.js"></script>
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
              <form action="/cargoList.htm" id="myform" method="get">
                 <input name="page" id="page" type="hidden" value="0">
                <div class="table">
                    <div class="chose clearfix">
                        <ul class="chose_item clearfix">
						
                            <li id="user" class="chose_active"><a href="/cargoList.htm">货源</a></li>
                            
							<#if Session["业务管理-交易"]==1><li id="complain"><a href="/paymentlist.htm">交易</a></li></#if> 
							
                        </ul>
                        <div class="site">
                            <ul>
                                <li class="inpt">
                                    <input type="text" placeholder="出发地">&nbsp至&nbsp<input type="text" placeholder="目的地">
                                </li>
                                <li id="start" class="time">接货时间</li>
                            </ul>
                        </div>
                        <div class="nav">
                            <input class="btn" type="submit" value=" " style="float:right;"><input class="text" type="text" placeholder="货源编号">
                        </div>
                    </div>
                               <div class="table_user  table_active ">
                        <table border="1" cellspacing="0" rules="all">
                            <thead>
                                <tr>
                                   <th width="20%">货源编号</th>
                                    <th width="18%">发货方</th>
                                    <th width="7%">出发地</th>
                                    <th width="7%">目的地</th>
                                    <th width="11%"><span>数量<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="9%"><span>单价<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="16%"><span>发货时间<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="6%"><span>报价<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="6%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <#if cargoList??>
                    	<#list cargoList as cargo>
                    	  <tr>
                    	    <td>${cargo.cargoNo} 
                    	    <#if cargo.shelve?? && cargo.shelve == 1><span class="state">正常</span><#else>
                    	    <#if cargo.tradeCount &gt; 0>
                    	    <span class="state state_1">结束</span>
                    	    <#else>
                    	    <span class="state state_2">下架</span>  
                    	    </#if>
                    	   </#if>
                    	   </td>
                    	    <td style="padding-left:8px;text-align:left;">${cargo.companyName}</td>
                    	      <td>
                    	    <#if cargo.province != 110000 && cargo.province != 120000
										&& cargo.province != 310000 && cargo.province != 500000 >
										${dict("citryMap",cargo.city)}
									<#else>
										${dict("citryMap",cargo.province)}
									</#if>
									</td>
									<td>
                    				<#if cargo.arrivalProvince != 110000 && cargo.arrivalProvince != 120000
										&& cargo.arrivalProvince != 310000 && cargo.arrivalProvince != 500000 >
										${dict("citryMap",cargo.arrivalCity)}
									<#else>
										${dict("citryMap",cargo.arrivalProvince)}
									</#if>
                    			</td>
                    			<td style="padding-left:8px;text-align:left;">
                    			${cargo.weight}吨/${cargo.square?round}方
                    			</td>
                    				<td style="padding-left:8px;text-align:left;">
                    			${cargo.quote/100}元/吨
                    			</td>
                    				<td>
                    			${cargo.sendTime?string("YYYY年MM月dd日")}
                    			</td>
                    		<td >${cargo.ordersCount!0}</td>
                    	   <td ><a href="/cargoDetail.htm?id=${cargo.id}&operationType=2">查看</a></td>
                    	</tr>
                    	
                            </#list>
                             <#else>
	                    <tr>
	                        <td colspan="14" align="center" class="nobottom_border noright_border">暂无数据</td>
	                    </tr>
                            </#if>
                            </tbody>
                        </table>
                           <#if pageSum gte 1>
                          <div class="page clearfix" style="text-align:right;line-height: 25px;"> <ul class="clearfix">
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
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/20)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                           
                        </div>
                         </#if>
                    </div>
                </div>
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
      $(document).ready(function () {
    	  $(".li_2").addClass("active");
          $("#page").val('${page}');
      });
      function goPage(i) {
          $("#page").val(i);
          $("#myform").submit();
          return false;
      }
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false

    };
    laydate(start);
    </script>
</body>

</html>
