<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/user.css">
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
                 <form action="/usermanagement.htm" id="myform" method="get">
                    <div class="chose clearfix">
                        <ul class="chose_item clearfix"> 
                            <li id="user" class="chose_active"><a href="/usermanagement.htm">司机</a></li>
							<#if Session["用户管理-企业"]==1><li id="complain"><a href="/usercompmanagement.htm">企业</a></li></#if> 
                        </ul>
                        <input name="page" id="page" type="hidden" value="0">
                        <div class="nav"><input class="btn" type="submit" value=" " style="float:right;"><input class="text" type="text" placeholder="电话搜索"  name="phone" id="phone" >
                    </div>
                    </div>
                    <div class="table_user table_active">
                        <table border="1" cellspacing="0"  rules="all">
                            <thead>
                                <tr>
                       <th width="7%">姓名</th>
                                    <th width="10%">电话</th>
                                    <th width="6%"><span>城市<a class="down_1" href="#"></a></span></th>
                                    <th width="8%"><span>定位日期</span></th>
                                    <th width="7%"><span>车型<a class="down_1" href="#"></a></span></th>
                                    <th width="7%"><span>车长<a class="down_1" href="#"></a></span></th>
                                    <th width="8%"><span>交易次数<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%"><span>装货信用<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%"><span>交易信用<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%"><span>当前状态<a class="down_1" href="#"></a></span></th>
                                    <th width="9%"><span>出发地<a class="down_1" href="#"></a></span></th>
                                    <th width="9%"><span>目的地<a class="down_1" href="#"></a></span></th>
                                    <th width="5%">操作</th>

                                </tr>
                            </thead>
                            <tbody>
                               <#if driverlist??>
                        <#list driverlist as driver>
                                <tr>
                                    <td style="text-align:left;padding-left:10px;">${driver.driverName}</td>
                                    <td>
									<#if Session["用户管理-司机-电话"]==1>
									${driver.mobile}
									 <#else>
									${(driver.mobile)[0..2]}****${(driver.mobile)[8..10]}
									</#if> 
									
									
									</td>
                                   <td>
                  <#if driver.cityStr??>
                                    ${driver.cityStr}
                   <#else>
                                    --
                                    </#if>
                  </td>
                                     <td><#if driver.provinceStr??>
                                    ${driver.locationTime}
                   <#else>
                                    --
                                    </#if>
                                    </td>
                                    <td style="text-align:left;padding-left:8px;">
                                      <#if driver.carType==0>其它
                                  <#elseif driver.carType==7>箱式车
                                   <#elseif driver.carType==1>平板车
                                    <#elseif driver.carType==4>不限
                                     <#elseif driver.carType==11>高栏车
                                 <#else></#if>
                                    </td>
                                    <td style="text-align:left;padding-left:8px;">
                                   <#if driver.carLength==0>其它
                                  <#elseif driver.carLength==1>9.6米
                                   <#elseif driver.carLength==2>13米
                                    <#elseif  driver.carLength==3>17.5米
                                     <#elseif driver.carLength==4>不限
                                 <#else></#if>
                                    </td>
                                    <td style="text-align:left;padding-left:8px;">${driver.jhds}次</td>
                                    <td style="text-align:left;padding-left:8px;">${driver.zhl}%</td>
                                    <td style="text-align:left;padding-left:8px;">${driver.jkl}%</td>
                                   <#if driver.noload==1>
                                      <td style="text-align:left;padding-left:8px;">拉货中</td>
                                      <td style="text-align:left;padding-left:8px;">${driver.noloadcity}</td>
                                      <td style="text-align:left;padding-left:8px;">${driver.noloadarrivecity}</td>
                                   <#else>
                                   <td style="text-align:left;padding-left:8px;">空载</td>
                                   <td  >--</td>
                                   <td >--</td>
                                   </#if>
                                   <td><a href="javascript:void(0);" onclick="javascript:window.location.href='/usermanagementdriver.htm?uid=${driver.userId}'" >查看</a></td>
                                </tr>
                        </#list>
                              </#if>  
                                     
                            </tbody>
                        </table>
                                                    <#if pageSum gte 1>
                          <div class="page clearfix" style="text-align:right;line-height: 25px;"><ul class="clearfix">
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

                            跳至&nbsp<input id="skip" type="text" style="width:20px;border:1px solid #ccc; border-radius: 3px;" onblur='jump(${(recordsSize/20)?ceiling})'>&nbsp页&nbsp
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
    	  $(".li_1").addClass("active");
        // $("#page").val('${page}');

    });
    function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        $("#phone").val('${phone}');
        return false;
    }
    function jump(z){ 
      var b=$("#skip").val()-1;
      if (b>=0) {
      if (z>b) { goPage(b);
        return false;};
      };      
    }
    </script>
</body>

</html>
