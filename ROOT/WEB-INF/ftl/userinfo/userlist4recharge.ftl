<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台充值管理_货管家管理后台</title>
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
                后台充值管理
            </div>
            <div class="rightok">
                <div style=" height: 35px; line-height: 35px; padding-left: 12px">
                    <form action="${queryURI}" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <label>名称：<input name="username" id="username" type="text"></label>
                        <label>手机号：<input name="tel" id="tel" type="text"></label>
                        <label>用户类型：
                            <select name="usertype" id="usertype" style="width: 100px">
                                <option value="0"></option>
                                <option value="1">司机</option>
                                <option value="2">企业</option>
                                <option value="3">专线企业</option>
                            </select>
                        </label>
                        <input style="margin-left: 10px" id="clearparams" type="button" value="清除条件">
                        <input type="submit" value="查 询">
                    </form>
                </div>
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th nowrap="nowrap">名称</th>
                        <th nowrap="nowrap">手机号</th>
                        <th nowrap="nowrap">用户类型</th>
                        <th nowrap="nowrap">用户状态</th>
                        <th nowrap="nowrap">账户余额</th>
                        <th nowrap="nowrap">认证状态</th>
                        <th nowrap="nowrap">注册时间</th>
                        <th nowrap="nowrap" class="noright_border">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if userList??>
                        <#list userList as user>
                        <tr>
                            <td width="5%">${user_index + 1}</td>
                            <td width="20%">
								<#if user.usertype == 1>
                               		<#if user.driver??>${user.driver.driverName}</#if>
                                <#elseif user.usertype == 2>
                                    <#if user.companyInfo??>${user.companyInfo.companyName}</#if>
                                <#elseif user.usertype == 3>
                                    <#if user.specialCompany??>${user.specialCompany.companyName}</#if>
                                <#else>
                                	 &nbsp;
                                </#if>
                            </td>
                            <td width="10%">
                            	<#if user.usertype == 1>
                               		<#if user.driver??>${user.driver.mobile}</#if>
                                <#elseif user.usertype == 2>
                                    <#if user.companyInfo??>${user.companyInfo.linkMobile}</#if>
                                <#elseif user.usertype == 3>
                                    <#if user.specialCompany??>${user.specialCompany.linkMobile}</#if>
                                <#else>
                                	 &nbsp;
                                </#if>
                            </td>
                            <td width="10%">
                                <#if user.usertype == 1>
                                    司机
                                <#elseif user.usertype == 2>
                                    企业
                                <#elseif user.usertype == 3>
                                    专线企业
                                <#else>
                                	 &nbsp;
                                </#if>
                            </td>
                            <td width="10%">
                                <#if user.status == 1>
                                    正常
                                <#elseif user.status == -1>
                                    已删除
                                <#elseif user.status == 2>
                                    冻结
                                <#elseif user.status == 3>
                                    待验证
                                <#else>
                                	 &nbsp;
                                </#if></td>
                            <td width="10%">
                            	${(user.usable/100)?string("##0.##")}
                                </td>
                            <td width="10%">
                                <#if user.usertype == 1>
                                    <#if user.driver.sfzsfrz == 0 && user.driver.jszsfrz == 0 && user.driver.xszsfrz == 0>
                                        未认证
                                    <#elseif user.driver.sfzsfrz == 1 || user.driver.jszsfrz == 1 || user.driver.xszsfrz == 1 >
			认证中
                                    <#else>
			已认证
                                    </#if>
                                <#elseif user.usertype == 2>
                                    <#if user.companyInfo.yyzzsfrz == 0 && user.companyInfo.zzjgdmsfrz == 0>
                                        未认证
                                    <#elseif user.companyInfo.yyzzsfrz == 1 || user.companyInfo.zzjgdmsfrz == 1 >
			认证中
                                    <#else>
                                        已认证
                                    </#if>
                                <#elseif user.usertype == 3>
                                    <#if user.specialCompany??>
                                        <#if user.specialCompany.yyzzsfrz == 0 && user.specialCompany.zzjgdmsfrz == 0 >
                                         未认证
                                        <#elseif user.companyInfo.yyzzsfrz == 1 || user.specialCompany.zzjgdmsfrz == 1 >
			认证中
	                                    <#else>
			已认证
	                                    </#if>
                                    </#if>
                                <#else>
                                	 &nbsp;
                                </#if>
                                </td>
                            <td width="15%">${user.operateTime}</td>
                            <td width="10%" class="noright_border">
                                <a href="javascript:void(0);" onclick="javascript:window.location.href='/toUserrecharge.htm?uid=${user.id}'" >充 值</a>
                            </td>
                        </tr>
                        </#list>
                        <#if pageSum gte 1>
                        <tr>
                            <td colspan="9" class=" nobottom_border noright_border">
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
                        <td colspan="9" align="center" class="nobottom_border noright_border">暂无数据</td>
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
        $("#tel").val("${tel}");
        $("#username").val("${username}");
        $("#usertype").val(${usertype});

        $("#tel, #usertype, #username").change(function () {
            $("#page").val('');
        });

        $("#clearparams").click(function () {
            $("#page").val('');
            $("#tel").val('');
            $("#username").val('');
            $("#usertype").val('');
            $("#myform").submit();
        });

        $("#mytable").find("td").mouseenter(function () {
            $(this).parent("tr").find("td").css("background", "#fafafa");
        });

        $("#mytable").find("td").mouseleave(function () {
            $(this).parent("tr").find("td").css("background", "#fff");
        });

        $("#mytable").find("td").each(function () {
            if ($(this).text().indexOf("未认证") != -1
                    ||$(this).text().indexOf("冻结") != -1
                    ||$(this).text().indexOf("删除") != -1) {
                $(this).css("color", "#990033");
            }
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