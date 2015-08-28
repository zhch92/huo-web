<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>账户管理</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/account.css">
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
              <form action="/sysuserlist.htm" id="myform" method="get">
                 <input name="page" id="page" type="hidden" value="0">
                <div class="table">
                    <div class="chose  clearfix">
                        <ul class="chose_item clearfix">
                            <li id="user" class="chose_active"><a href="/sysuseradd.htm">添加用户</a></li>
                        </ul>
                    </div>
                    <div class="account">
                        <table border="1" cellspacing="0" rules="all">
                            <thead>
                                <tr>
                                    <th width="10%">账户名</th>
                                    <th width="10%">姓名</th>
                                    <th width="60%">权限</th>
                                    <th width="20%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <#if adminList??>
                        <#list adminList as admin>
                         <tr>
                                    <td class="name">${admin.username}</td>
                                    <td class="name">${admin.realname}</td>
                                    <td>
                                   <#if admin.systemfunctions??>
									<#list admin.systemfunctions as sysfunction>
										${sysfunction.functionname}
									</#list>
								</#if>
                                    </td>
                                    <td class="name">
                                    <a href="javascript:void(0);" onclick="javascript:window.location.href='/sysuserfunction.htm?adminid=${admin.adminid}'">权限</a>
                                        <a href="javascript:void(0);" onclick="javascript:window.location.href='/sysuserupdatepwd.htm?adminid=${admin.adminid}'" >修改密码</a>
                                        <a href="javascript:void(0);"  onclick="del(${admin.adminid});">删除</a>
                                         <a href="#">禁用</a>
                                        </td>
                                </tr>
                        
                           </#list>
                    <#else>
                    <tr>
                        <td colspan="5" align="center" class="nobottom_border noright_border">暂无数据</td>
                    </tr>
                    </#if>
                            </tbody>
                        </table>
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
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/12)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                            
                        </div>
                          </#if>
                    </div>
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
    	  $(".li_6").addClass("active");
          $("#page").val('${page}');
      });
       function del(valid){
         	var adminid =valid;
          	if(!adminid || !$.trim(adminid)) {
          		return alert("数据异常！刷新后再试!");
          	}
          	if(confirm("确认删除此用户?")){
          	   	$.post("/ajax/delAdmin.htm", {adminid:adminid},
              			function (data) {
                              if (data.flag == 1) {
                              	alert('操作成功！');
                              	window.location.href=data.data;
                              } else{
                                  alert("操作失败！");
                              } 
                          },"json").error(function(){
                          	alert("网络异常！");
                          });
          	}
       
       }
      function goPage(i) {
          $("#page").val(i);
          $("#myform").submit();
          return false;
      }
    </script>
</body>

</html>
