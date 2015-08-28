<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>网站注册专线公司信息管理_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" language="javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
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
                注册用户基本信息
            </div>
            <div class="rightok">
                <form action="" id="myform">
                    <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">用户名：</td>
                            <td width="15%">${user.userName}</td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">用户类型：</td>
                            <td width="15%">
                            <#if user.usertype == 1>
                                司机
                            </#if>
                            <#if user.usertype == 2>
                                企业
                            </#if>
                            <#if user.usertype == 3>
                                专线企业
                            </#if>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">用户状态：</td>
                            <td width="15%">
                                <select name="status" id="status">
                                    <option value="1">正常</option>
                                    <option value="2">冻结</option>
                                    <option value="3">已删除</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">登录密码：</td>
                            <td width="15%"><input type="button" value="重置密码"></td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">司机姓名：</td>
                            <td width="15%">
                                <input type="text" name="driverName" id="driverName" value="${user.driver.driverName}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">车牌号：</td>
                            <td width="15%">
                                <input type="text" name="carNumber" id="carNumber" value="${user.driver.carNumber}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">性别：</td>
                            <td width="15%">
                                <select style="width: 100px" name="sex" id="sex">
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">出身年月：</td>
                            <td width="15%">
                                <input type="text" name="birthDay" id="birthDay" class="Wdate" onClick="WdatePicker()" value="${user.driver.birthDay}">
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">积分：</td>
                            <td width="15%">&nbsp;</td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">注册时间：</td>
                            <td width="15%" colspan="5">${user.operateTime}</td>

                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">开户行：</td>
                            <td width="15%">
                                <select name="khyh" id="khyh">
                                    <option value="0"></option>
                                    <option value="1">建设银行</option>
                                    <option value="2">工商银行</option>
                                    <option value="3">农业银行</option>
                                    <option value="4">中国银行</option>
                                    <option value="5">招商银行</option>
                                    <option value="6">交通银行</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">卡号：</td>
                            <td width="15%">
                                <input type="text" value="${user.driver.yhkh}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">户名：</td>
                            <td width="15%">
                                <input type="text" value="${user.driver.yhkyhm}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">开户地址：</td>
                            <td width="15%">
                                <input type="text" value="${user.driver.khyhdz}">
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">车长：</td>
                            <td width="15%">
                                <select name="carLength" id="carLength">
                                    <option value="0"></option>
                                    <option value="1">9.6米</option>
                                    <option value="2">5.6米</option>
                                    <option value="3">1.3米</option>
                                    <option value="4">4.2米</option>
                                    <option value="5">2.2米</option>
                                    <option value="6">6.2米</option>
                                    <option value="7">8.2米</option>
                                </select>
                            </td>

                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">车型：</td>
                            <td width="15%">

                                <select name="carType" id="carType">
                                    <option value="0">不限车型</option>
                                    <option value="1">平板车</option>
                                    <option value="2">冷藏车</option>
                                    <option value="3">半封闭车</option>
                                    <option value="4">普通车</option>
                                    <option value="5">半挂车</option>
                                    <option value="6">集装箱车</option>
                                    <option value="7">箱式车</option>
                                    <option value="8">保温车</option>
                                    <option value="9">双桥车</option>
                                    <option value="10">单桥车</option>
                                    <option value="11">高栏车</option>
                                    <option value="12">低栏车</option>
                                    <option value="13">棚车</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">车辆图片：</td>
                            <td width="15%" colspan="3">
                                <img src="http://i.mmcdn.cn/simba/img/T1wXPoFzpbXXb1upjX.jpg" width="200px">
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">身份证号：</td>
                            <td width="15%">
                                <input type="text" name="sfzhm" id="sfzhm" value="${user.driver.sfzhm}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">认证：</td>
                            <td width="15%">
                                <select>
                                    <option value="0"></option>
                                    <option value="1">通过</option>
                                    <option value="2">不通过</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">身份图片：</td>
                            <td width="15%" colspan="3">
                                <img src="http://i.mmcdn.cn/simba/img/T1wXPoFzpbXXb1upjX.jpg" width="200px">
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">驾驶证号：</td>
                            <td width="15%">511111111111111111</td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">认证：</td>
                            <td width="15%">
                                <select>
                                    <option value="1">通过</option>
                                    <option value="1">不通过</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">驾驶证图片：</td>
                            <td width="15%" colspan="3" nowrap="nowrap">
                                <img src="http://i.mmcdn.cn/simba/img/T1wXPoFzpbXXb1upjX.jpg" width="200px">
                                <img src="http://i.mmcdn.cn/simba/img/T1wXPoFzpbXXb1upjX.jpg" width="200px">
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">行驶证号：</td>
                            <td width="15%">511111111111111111</td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">认证：</td>
                            <td width="15%">
                                <select>
                                    <option value="1">通过</option>
                                    <option value="1">不通过</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">行驶证图片：</td>
                            <td width="15%" colspan="3" nowrap="nowrap">
                                <img src="http://i.mmcdn.cn/simba/img/T1wXPoFzpbXXb1upjX.jpg" width="200px">
                                <img src="http://i.mmcdn.cn/simba/img/T1wXPoFzpbXXb1upjX.jpg" width="200px">
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" colspan="8" align="center">
                                <input type="button" style="width: 100px" value="保 存">
                                <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>

            </div>
        </div>
        <div class="clear"></div>
    </div>
<#include "common/bottom.ftl">
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#status").val("${user.status}");
        $("#sex").val("${user.driver.sex}");
        $("#khyh").val("${user.driver.khyh}");
        $("#carLength").val("${user.driver.carLength}");
        $("#carType").val("${user.driver.carType}");
    });

</script>
</body>
</html>