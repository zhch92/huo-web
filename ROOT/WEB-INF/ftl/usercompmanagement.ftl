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
                 <form action="/usercompmanagement.htm" id="myform" method="get">
                    <div class="chose clearfix">
                        <ul class="chose_item clearfix">
							<#if Session["用户管理-司机"]==1><li id="user"><a href="/usermanagement.htm">司机</a></li></#if> 
                            <li id="complain" class="chose_active"><a href="/usercompmanagement.htm">企业</a></li>
                        </ul>
                        <input name="page" id="page" type="hidden" value="0">
                        <div class="nav"><input class="btn" style="float:right;" type="submit" value=""><input class="text" type="text" placeholder="电话搜索"  name="phone" id="phone" >
                    </div>
                    </div>
                    <div class="table_user table_active">
                        <table border="1" cellspacing="0"  rules="all">
                            <thead>
                                <tr>
                                    <th width="19%">公司</th>
                                    <!-- <th width="12%"><span>类型<a class="down_1" href="#"></a></span></th> -->
                                    <th width="13%">电话</th>
                                    <th width="8%"><span>省份<a class="down_1" href="#"></a></span></th>
                                    <th width="8%"><span>城市<a class="down_1" href="#"></a></span></th>
                                    <th width="8%"><span>交易次数<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%"><span>装货信用<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%"><span>结款信用<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%"><span>当前发运<a class="down" href="#"></a><a class="up" href="#"></a></span></th>
                                    <th width="8%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                               <#if companyinfolist??>
                        <#list companyinfolist as companyinfo>
                                <tr>
                                    <td style="text-align:left;padding-left:8px;">${companyinfo.companyName}</td>
                                    	<td><#if Session["用户管理-企业-电话"]==1>
									${companyinfo.linkMobile}
									 <#else>
									${(companyinfo.linkMobile)[0..2]}****${(companyinfo.linkMobile)[8..10]}
									</#if>
								   </td>
                                   
									<#if companyinfo.provinceStr??>
                                      <td>${companyinfo.provinceStr}</td>
                                   <#else>
                                    <td>--</td>
                                   </#if>
								   <#if companyinfo.cityStr??>
                                      <td>${companyinfo.cityStr}</td>
                                   <#else>
                                    <td>--</td>
                                   </#if>
                                       <td>${companyinfo.fhds}</td>
                                         <td style="text-align:left;padding-left:20px;">${companyinfo.zhl}%</td>
                                           <td style="text-align:left;padding-left:20px;">${companyinfo.jkl}%</td>
                                               <td>${companyinfo.dqyf}</td>
                                   <td><a href="javascript:void(0);" onclick="javascript:window.location.href='/usermanagementcomp.htm?uid=${companyinfo.userId}'" >查看</a></td>
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
                             跳至<input id="skip" type="text" style="width:20px;" onblur='jump(${(recordsSize/20)?ceiling})'>页
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
        $("#page").val('${page}');
        $("#phone").val('${phone}');
    });
    function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    }
      function jump(z){ 
      var b=$("#skip").val()-1;
      if (b>0) {
      if (z>b) { goPage(b);
        return false;};
      };      
    }
    </script>
</body>

</html>
