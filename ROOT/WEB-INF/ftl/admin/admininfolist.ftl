<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台账户管理_拉货宝管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="main">
<#include "common/top.ftl">
    <div class="context">
    <#include "common/left.ftl">
        <div class="right" style="">
            <div class="righttop">
                后台账户管理
            </div>
            <div class="rightok">
                <div style=" height: 35px; line-height: 35px; padding-left: 12px">
                    <form action="/adminlist.htm" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <label>账户名：<input name="username" id="username" type="text"></label>
                        <input style="margin-left: 10px" id="clearparams" type="button" value="清除条件">
                        <input type="submit" value="查 询">
						<input type="button" id="addAdminBtn" value="添加用户" style="margin-left : 20px">
                    </form>
                    
                    
                </div>
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th nowrap="nowrap">账户名</th>
                        <th nowrap="nowrap">姓名</th>
                        <th nowrap="nowrap">权限</th>
                        <th nowrap="nowrap" class="noright_border">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if adminList??>
                        <#list adminList as admin>
                        <tr>
                            <td width="3%">${admin.adminid}</td>
                            <td width="5%">${admin.username}</td>
                            <td width="5%">${admin.realname}</td>
                            <td width="40%">
								<#if admin.systemfunctions??>
									<#list admin.systemfunctions as sysfunction>
										${sysfunction.functionname}
									</#list>
								</#if>
							</td>
                            <td width="10%" class="noright_border">
                                <a href="javascript:void(0);" onclick="javascript:window.location.href='/toSetAdminFuntion.htm?adminid=${admin.adminid}'">授权</a> 
                                <span style="color: #ececec">|</span>
                                <a href="javascript:void(0);" onclick="javascript:window.location.href='/toupdatepwdpage.htm?adminid=${admin.adminid}'" >修改密码</a>
                                <span style="color: #ececec">|</span>
                                <a id="deladmin" href="javascript:void(0);" adminid="${admin.adminid}" >删除</a>
                            </td>
                        </tr>
                        </#list>
                        <#if pageSum gte 1>
                        <tr>
                            <td colspan="5" class=" nobottom_border noright_border">
                                <div id="pageBar" onselectstart="return false;">
                                    <ul>
                                        <#if page != 0 >
                                            <li onclick="javascript:goPage(0)">首 页</li>
                                        </#if>
                                        <#if page-1 gte 0 >
                                            <li onclick="javascript:goPage(${page}-1)">上一页</li>
                                        </#if>
                                        <li style="border: none;background: none;">共 ${recordsSize} 条注册信息 当前第${page+1}页</li>
                                        <#if page+1 lte pageSum >
                                            <li onclick="javascript:goPage(${page}+1)">下一页</li>
                                        </#if>
                                        <#if page != pageSum >
                                            <li onclick="javascript:goPage(${pageSum})">末 页</li>
                                        </#if>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        </#if>
                    <#else>
                    <tr>
                        <td colspan="5" align="center" class="nobottom_border noright_border">暂无数据</td>
                    </tr>
                    </#if>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>
<#include "common/bottom.ftl">
</div>
<script type="text/javascript">
    $(document).ready(function () {

        $("#page").val(${page});
        $("#username").val(${username});

        $("#username").change(function () {
            $("#page").val('');
        });

        $("#clearparams").click(function () {
            $("#page").val('');
            $("#username").val('');
            $("#myform").submit();
        });

        $("#mytable").find("td").mouseenter(function () {
            $(this).parent("tr").find("td").css("background", "#fafafa");
        });

        $("#mytable").find("td").mouseleave(function () {
            $(this).parent("tr").find("td").css("background", "#fff");
        });
        $("#addAdminBtn").click(function () {
            window.location.href="/toAddAdmin.htm";
        });
        
        $("#deladmin").click(function(){
        	var adminid = $("#deladmin").attr("adminid");
        	if(!adminid || !$.trim(adminid)) {
        		return alert("数据异常！刷新后再试!");
        	}
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
        });
    });
    function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    }
</script>
</body>
</html>