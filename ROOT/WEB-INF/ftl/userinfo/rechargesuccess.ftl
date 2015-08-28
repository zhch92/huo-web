<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>充值成功_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" language="javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" language="javascript" src="/js/jquery.easing.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/jquery.flyout-1.2.js"></script>
    <style type="text/css">
        #myform input {
            width: 90%;
        }

        #myform select {
            width: 90%;
        }
    </style>
</head>
<body>
<div class="main">
<#include "common/top.ftl">
<div class="context">
<#include "common/left.ftl">
<div class="right" style="">
<div class="righttop">
    充值成功
</div>
<div class="rightok">

<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
<tbody>
<tr>
    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >充值金额：</td>
    <td width="35%"><#if usable??>${(amount/100)?string("##0.##")}元</#if></td>
</tr>
<tr>
    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >可用金额：</td>
    <td width="35%"><#if usable??>${(usable/100)?string("##0.##")}元</#if></td>
</tr>
<tr>
    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >上传凭证：</td>
    <td width="35%">
    	<div id="biuuuu">
			<#if payimgpath??>
				<a href="/img/downImg.htm?path=${payimgpath}" title="jquery.flyout">
					<img src="/img/downImg.htm?path=${payimgpath}" width="200px">
				</a>
			<#else>
				图片已删除或网络异常
			</#if>
        </div>
    </td>
</tr>
<tr>
    <td nowrap="nowrap" colspan="2" align="left">
        <input type="button" value="返 回" style="width: 100px" onclick="javascript:window.location.href='/userlist4recharge.htm'">
    </td>
</tr>
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
    	$('#biuuuu a').flyout();
    });

</script>
</body>
</html>