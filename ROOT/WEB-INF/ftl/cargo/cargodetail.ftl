<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>业务管理--货源详情</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
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
        <div class="main clearfix">
               <#include "common/leftbar.ftl">
            <#if cargo??>
            <div class="rside">
                <div class="record">
                    <p class="title">货源编号：${cargo.cargoNo} <a href="/cargoList.htm">返回</a></p>
                    <div class="table_3 clearfix">
                        <div class="table_l">
                            <table>
                                <tr>
                                    <td width="80"><span>
                  <#if cargo.province != 110000 && cargo.province != 120000
										&& cargo.province != 310000 && cargo.province != 500000 >
										 ${dict("citryMap",cargo.city)}
									<#else>
										${dict("citryMap",cargo.province)} 
									</#if>
                                                 </span></td>
                                    <td width="60"><img src="http://192.168.2.50:8089/statics/images/r.png" alt=""></td>
                                    <td><span>
                                    <#if cargo.arrivalProvince != 110000 && cargo.arrivalProvince != 120000
										&& cargo.arrivalProvince != 310000 && cargo.arrivalProvince != 500000 >
										 ${dict("citryMap",cargo.arrivalCity)} 
									<#else>
										${dict("citryMap",cargo.arrivalProvince)}
									</#if>
                                    
                                    </span></td>
                                </tr>
                                <tr>
                                    <td>${dict("citryMap",cargo.county)} </td>
                                    <td></td>
                                    <td>${dict("citryMap",cargo.arrivalCounty)} </td>
                                </tr>
                                <tr>
                                    <td><#if cargo.arrivalTime??>${cargo.sendTime?string("MM月dd日")}<#else>&nbsp;</#if></td>
                                    <td></td>
                                    <td><#if cargo.sendTime??>${cargo.arrivalTime?string("MM月dd日")}<#else>&nbsp;</#if></td>
                                </tr>
                            </table>
                            <p>车型要求：&nbsp&nbsp
                                  <#if cargo.carLength==0>其它车长
                                  <#elseif cargo.carLength==1>9.6米
                                   <#elseif cargo.carLength==2>13米
                                    <#elseif  cargo.carLength==3>17.5米
                                     <#elseif cargo.carLength==4>不限车长
                                 <#else></#if>                                             
                                                                            &nbsp&nbsp 
                              <#if cargo.carType==0>其它车型
                                  <#elseif cargo.carType==7>箱式车
                                   <#elseif cargo.carType==1>平板车
                                    <#elseif cargo.carType==4>不限车型
                                     <#elseif cargo.carType==11>高栏车
                                 <#else></#if>
                            </p>
                            <p>发货${cargo.fhdsStr}笔 &nbsp 装货率&nbsp ${cargo.zhlStr}% &nbsp 结款率&nbsp${cargo.jklStr}%</p>
                            <p style="margin-top:15px;">备注：${cargo.remark}</p>
                        </div>
                        <div class="table_m">   
                            <p class="price" style="color: #faa43e;font-weight: 600;">货物类型：${cargo.cargoName} &nbsp&nbsp&nbsp&nbsp 价格：${cargo.quote/100}元/吨 &nbsp&nbsp ${cargo.weight}吨 / ${cargo.square}立方</p>
                            <p class="price">总价：${cargo.quote/100*cargo.weight}元</p>
                        </div>
                        <div class="bttn">
                        <#if cargo.shelve?? && cargo.shelve == 1><button id="downShelve" class="back">强制下架</button><#else><#if cargo.tradeCount &gt; 0><button  class="back">货源已结束</button><#else>
                        <button  class="back">货源已下架</button>
                        </#if>
                   </#if><button class="past">修改货源</button></div>
                    </div>
                    <div class="info">
                        <ul class="clearfix ul_1">
                            <li  class="li_7_add"><b>${cargo.companyName}</b><span class="unpast">
                              <#if cargo.companystatus== 0 >
                                          未认证
                                    <#elseif cargo.companystatus== 1  >
			认证中
									<#elseif cargo.companystatus ==  2 >
									未通过
                                    <#elseif cargo.companystatus == 10>
			已认证
									<#else>
								        未认证
                                    </#if>
                            </span> </li>
                            <li class="li_7_add"><strong>${cargo.linkPhone}</strong></li>
                           
                        </ul>
                        <ul class="clearfix">
                         <li class="add_2">信用：<span>发货${cargo.fhdsStr}笔 &nbsp&nbsp 装货率${cargo.zhlStr}% &nbsp&nbsp 结款率${cargo.jklStr}%</span></li>
                            <li class="add_2">注册时间：<span>${cargo.companyOperateTime?string("YYYY年MM月dd日")}</span></li>
                            <li class="add_2"> &nbsp</li>
                            <li class="add_2">总运量：<span>暂无数据</span></li>
                            <li class="add_2">偏好：暂无数据</li>
                            <li class="add_2">最大装载量 ：暂无数据</li>
                        </ul>
                    </div>
                    <div class="detauls_table">
                        <table border="1" cellspacing="0" rules="all" width="890">
                            <thead>
                                <tr>
                                    <th width="12%">申请时间</th>
                                    <th width="8%">姓名</th>
                                    <th width="16%">申请报价</th>
                                    <th width="8%">车牌号</th>
                                    <th width="10%">电话</th>
                                    <th width="7%"><span>车型<a class="down_1" href="#"></a> </span></th>
                                    <th width="6%"><span>车长<a class="down_1" href="#"></a></span></th>
                                    <th width="8%"><span>交易次数<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%"><span>装货信用<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%"><span>交付信用<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                      <th width="11%">当前状态</th>
                                </tr>
                            </thead>
                            <tbody>
                              <#if cargo.ordersList?? && cargo.ordersList?size gt 0>
                              	<#list cargo.ordersList as orders>
                                <tr>
                                    <td>${orders.createTime?string("YYYY年MM月dd日")}</td>
                                    <td style="text-align:left;padding-left:4px;">${orders.driverName}</td>
                                    <td style="text-align:left;padding-left:4px;">${orders.count}吨×${orders.total/100/orders.count}元=<span>${orders.total/100}元</span></td>
                                    <td><#if orders.applyUserType == 1>${orders.driverCarNo}<#else>&nbsp;</#if></td>
                                    <td>${orders.driverphone}</td>
                                    <td style="text-align:left;padding-left:8px;">
                                     <#if cargo.carType==0>其它车型
                                   <#elseif cargo.carType==7>箱式车
                                   <#elseif cargo.carType==1>平板车
                                   <#elseif cargo.carType==4>不限车型
                                   <#elseif cargo.carType==11>高栏车
                                 <#else></#if>
                                    </td>
                                    <td>
                                   <#if cargo.carLength==0>其它车长
                                   <#elseif cargo.carLength==1>9.6米
                                   <#elseif cargo.carLength==2>13米
                                   <#elseif  cargo.carLength==3>17.5米
                                   <#elseif cargo.carLength==4>不限车长
                                 <#else></#if>   
                                    </td>
                                    <td>${orders.driverfhdsStr}次</td>
                                    <td>${orders.driverzhlStr}%</td>
                                    <td>${orders.driverjklStr}%</td>
                                     <td>
                                        <#if orders.status==5>
                                     申请中
                                     <#elseif orders.status==-2>
                                     取消交易
                                         <#elseif orders.status==-4>
                                    申请失败
                                         <#elseif orders.status==100>
                                          <#if orders.dispute==1>
                                          司机装货投诉
                                          <#elseif orders.dispute==2>
                                               司机结款投诉
                                           <#elseif orders.dispute==5>
                                             货主装货投诉
                                            <#elseif orders.dispute==6>
                                                  货主结款投诉
                                           <#else>
                            		   交易中
                            	</#if>
                                 
                                         <#elseif orders.status==101>
                              交易完成
                                         <#elseif orders.status==-2>
                                     取消交易
                                        <#else>
                            		  无
                            	</#if>
                                     </td>
                                </tr>
                                 </#list>
                                 <#else>
                                 <tr><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td><td>--</td></tr>   
                                </#if> 
                            </tbody>
                        </table>
                        <#if pageSum gte 1>
                        <div class="page clearfix">
                      共 ${recordsSize}条信息&nbsp;总共${(recordsSize/12)?ceiling}页&nbsp;当前第${page+1}页
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
                    </div>

                </div>
            </div>
            </#if>
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
   	$("#downShelve").bind("click",function(){
		var operationCause =$.trim(prompt("请填写操作理由",""));
	    if(operationCause) {
			$.ajax({  
	            url:"/ajax/downShelveCargo.htm",  
	            type:"post", 
	            data:"id=${cargo.id}&operationCause="+operationCause, 
	            dataType:"json",
	            success:function(data) { 
	            	if (data.flag > 0) {
	            		window.location.href = "/cargoDetail.htm?id=${cargo.id}";
	            	} else {
	            		alert(data.msg); 
	            	}
	            },error:function(data) {  
	            	downShelveLock = true;
	                alert("系统繁忙，请稍后再试");  
	            }  
	        });
	    }
	});
     });
     </script>
</body>

</html>
