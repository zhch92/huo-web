<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>货管家运维后台管理系统</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div class="main">
<#include "common/top.ftl">
<div class="context">
<#include "common/left.ftl">
<div class="right" style="">
    <div class="righttop">
        标题标题标题
    </div>
    <div class="rightok">
        <div style=" height: 35px; line-height: 35px; padding-left: 12px">
            <label>字段一：<input type="text"></label>
            <label>字段二：<input type="text"></label>
            <label>字段三：<input type="text"></label>
            <input type="button" value="清除条件">
            <input type="button" value="查 询">
        </div>
        <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
            <thead>
            <tr>
                <th>品名</th>
                <th>供货单位</th>
                <th>报价</th>
                <th>供货吨位</th>
                <th>付款方式</th>
                <th nowrap="nowrap">筛选意见</th>
                <th width="190px;">指导价格</th>
                <th class="noright_border">价委会意见</th>
            </tr>
            </thead>
            <tbody>
            <#--<tr>-->
            <#--<td colspan="8" align="center" class="nobottom_border noright_border">暂无采购招标信息</td>-->
            <#--</tr>-->
            <#list 1..12 as t>
            <tr>
                <td>${t}&nbsp;</td>
                <td>范德萨范德萨&nbsp;</td>
                <td>范德萨范德萨&nbsp;</td>
                <td>范德萨范德萨&nbsp;</td>
                <td>范德萨范德萨&nbsp;</td>
                <td>范德萨范德萨&nbsp;</td>
                <td>范德萨范德萨&nbsp;</td>
                <td class="noright_border">范德萨范德萨&nbsp;</td>
                </td>
            </tr>
            </#list>

            <tr>
                <td colspan="8" class=" nobottom_border noright_border">
                    <div id="pageBar" onselectstart="return false;">
                        <ul>
                            <li onclick="javascript:goPage(1)">首 页</li>
                            <li>上一页</li>

                            <li>下一页</li>
                            <li>末 页</li>
                        </ul>
                    </div>
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
</body>
</html>