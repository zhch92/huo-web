<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title> 操作中心--用户认证</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css"/>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css"/>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
</head>
<body>

  <div class="header">
        <div class="head">
            <div class="logo"><a href="#"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a></div>
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
									 <#if Session["呼叫中心-撮合交易"]==1><li class="l_side"><a href="/pushDealmaking.htm">撮合交易</a></li></#if>  
									<#if Session["呼叫中心-交易跟踪"]==1><li class="l_side"><a href="/transactionTracking.htm">交易跟踪</a></li></#if> 
									<#if Session["呼叫中心-呼叫接入"]==1><li class="l_side"><a href="#">呼叫接入</a></li></#if> 
									  <li class="l_side chose_active "><a href="/userinfolist.htm">用户认证</a></li>
									  <#if Session["活动列表-确认交易列表"]==1><li class="l_side"><a href="/tradeSure.htm">交易确认</a></li></#if> 
                                                
                                    </ul>
                    </div>
                    <!-- <div class="nav"><input type="text" placeholder="电话搜索"><input type="submit"></div> -->
                      <form action="/userinfolist.htm" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                     <div class="table_p">
                        <table border="1" cellspacing="0" rules="all">
                            <thead>
                            
                                    <tr>
                                    <th width="16%">姓名</th>
                                    <th width="5%">类别</th>
                                    <th width="10%">电话</th>
                                    <th width="5%">省份</th>
                                    <th width="7%">城市</th>
                                    <th width="8%">车牌</th>
                                    <th width="6%">车长</th>
                                    <th width="6%">车型</th>
                                    <th width="6%">认证状态</th>
                                    <th width="15%">注册耗时</th>
                                    <th width="12%">注册时间</th>
                                    <th width="4%">操作</th>
                                </tr>

                            </thead>
                            <tbody>
                                   <#if userList??>
                        <#list userList as user>
                         <tr>
                             <#if user.usertype == 1>
                                   <#if user.driver??>
                                       <td style="text-align:left;padding-left:8px;">${user.driver.driverName}</td><td>司机</td></#if>
                                <#elseif user.usertype == 2>
                                   <#if user.companyInfo??>
                                      <td  style="text-align:left;padding-left:8px;">${user.companyInfo.companyName}</td><td style='color:#feb35a;'>货主</td></#if>
                                </#if>
                                    <td>
									<#if Session["呼叫中心-用户认证-电话"]==1>
									${user.userName}
									 <#else>
									${(user.userName)[0..2]}****${(user.userName)[8..10]}
									</#if>&nbsp </td>
                                     <#if user.usertype ==2 && user.companyInfo.cityStr!=null>
                  <td>${ user.companyInfo.provinceStr}</td>
                                    <td>${ user.companyInfo.cityStr}</td>
                   <#elseif user.usertype==1 && user.driver.cityStr!=null>
                   <td>${ user.driver.provinceStr}</td>
                                    <td>${ user.driver.cityStr}</td>
                   <#else>
                  <td>--</td>
                                    <td>--</td>
                   </#if>

                                    
                                      <#if user.usertype == 1>
                                   <#if user.driver??>
                                    <td>${user.driver.carNumber}</td>
                                    <td style="text-align:left;padding-left:10px;">
                                    <#if user.driver.carLength==0>其它
                                  <#elseif user.driver.carLength==1>9.6米
                                   <#elseif user.driver.carLength==2>13米
                                    <#elseif  user.driver.carLength==3>17.5米
                                     <#elseif user.driver.carLength==4>不限
                                 <#else></#if>
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                <#if user.driver.carType==0>其它
                                  <#elseif user.driver.carType==7>箱式车
                                   <#elseif user.driver.carType==1>平板车
                                    <#elseif user.driver.carType==4>不限
                                     <#elseif user.driver.carType==11>高栏车
                                 <#else></#if>
                                    </td>
                                    </#if>
                                <#elseif user.usertype == 2>
                                   <#if user.companyInfo??>
                                      <td>--</td>
                                      <td>--</td>
                                      <td>--</td>
                                      </#if>
                                </#if>
                               
                            <td>
                                <#if user.usertype == 1>
                                    <#if user.driver.sfzsfrz == 0 && user.driver.jszsfrz == 0 && user.driver.xszsfrz == 0>
                                          未认证
                                    <#elseif user.driver.sfzsfrz == 1 || user.driver.jszsfrz == 1 || user.driver.xszsfrz == 1 >
			认证中
									<#elseif user.driver.sfzsfrz == 10 && user.driver.jszsfrz == 10 && user.driver.xszsfrz == 2>
									未通过
									<#elseif user.driver.sfzsfrz == 10 && user.driver.jszsfrz == 2 && user.driver.xszsfrz == 10 >
									未通过
									<#elseif user.driver.sfzsfrz == 2 && user.driver.jszsfrz == 10 && user.driver.xszsfrz == 10>
									未通过
                                    <#elseif user.driver.sfzsfrz == 10 && user.driver.jszsfrz == 10 && user.driver.xszsfrz == 10>
			已认证
									<#else>
									认证中
                                    </#if>
                                <#elseif user.usertype == 2>
                                    <#if user.companyInfo.yyzzsfrz == 0 >
                                        未认证
                                    <#elseif user.companyInfo.yyzzsfrz == 1>
			认证中
                                    <#elseif user.companyInfo.yyzzsfrz == 2>
                                    未通过
                                    <#elseif user.companyInfo.yyzzsfrz == 10>
  已认证
                                    <#else>
                                    认证中
                                    </#if>
                                </#if>
                                &nbsp;</td>
                            <td> <#if (user.usertype == 1 && user.driver.uploadCertificateTime?? && !user.driver.passAuthTime??) || (user.usertype == 2 && user.companyInfo.uploadCertificateTime?? && !user.companyInfo.passAuthTime??)>  style="text-align:left;padding-left:8px;color:red;"</#if> 
                            	<#if user.authTimeDiff??>
                            		${user.authTimeDiff}
                            	<#else>
                            		--
                            	</#if>
                            </td>

                            <td><#if user.operateTime??>${user.operateTime?string("YYYY年MM月dd日")}<#else>&nbsp;</#if></td>
                              <td><a href="javascript:void(0);" onclick="javascript:window.location.href='/userinfo.htm?uid=${user.id}'" >操 作</a></td>
                                </tr>
                        
                         </#list>
                              </#if>    
                              
                            </tbody>
                        </table>
                           <#if pageSum gte 1>
                      <div class="page clearfix" style="text-align:right;line-height: 25px;">
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/20)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
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
                          </form>
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
    $(document).ready(function () {
    	$(".li_7").addClass("active");
        $("#page").val('${page}');
    });
    function carlengthstrfc(val){
  	  var carlengh="";
  	 if(val==0){
  		 carlengh="其它车长";
  	 }else if(val==1){
  		 carlengh="9.6米";
  	 }else if(val==2){
  		 carlengh="12米";
  	 }else if(val==3){
  		 carlengh="17.5米"; 
  	 }else if(val==4){
  		 carlengh="不限车长"; 
  	 }
  	 return carlengh;
  }
  function cartypestrfc(val){
  	  var cartype="";
  	  if(val==0){
  		 cartype="其它车型";
  	 }else if(val==7){
  		 cartype="箱式车";
  	 }else if(val==1){
  		 cartype="平板车";
  	 }else if(val==4){
  		 cartype="不限车型"; 
  	 } else if(val==11){
  		 cartype="高栏车"; 
  	 }   
  	  return cartype;
  }
    function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    }
</script>
</body>
</html>