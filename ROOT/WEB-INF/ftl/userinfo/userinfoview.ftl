<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>网站注册用户信息管理_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" language="javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/jquery.easing.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/jquery.flyout-1.2.js"></script>
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
    用户基本信息
</div>
<div class="rightok">
<form action="/ajax/updateDriverInfo.htm" method="post" id="myform">
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
            <option value="3">待验证</option>
            <option value="-1">已删除</option>
        </select>
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">登录密码：</td>
    <td width="15%"><input type="button" value="重置密码" id="resetpassword"></td>
</tr>
<tr>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">司机姓名：</td>
    <td width="15%">
        <input type="hidden" name="id" value="${user.driver.id}">
        <input type="hidden" name="userId" value="${user.driver.userId}">
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
        <input type="text" name="birthDaystr" id="birthDaystr" class="Wdate" onClick="WdatePicker()" value="${user.driver.birthDay}">
    </td>
</tr>
<tr>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">积分：</td>
    <td width="15%"><input type="text" id="integral" name="integral" value="${user.driver.integral}"></td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">手机号：</td>
    <td width="15%">
        <input type="text" id="mobile" name="mobile" value="${user.driver.mobile}">
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">注册时间：</td>
    <td width="15%" colspan="3">${user.operateTime}</td>

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
        <input type="text" value="${user.driver.yhkh}" name="yhkh">
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">户名：</td>
    <td width="15%">
        <input type="text" value="${user.driver.yhkyhm}" name="yhkyhm">
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">开户地址：</td>
    <td width="15%">
        <input type="text" value="${user.driver.khyhdz}" name="khyhdz">
    </td>
</tr>
<tr>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">车长：</td>
    <td width="15%">
        <select name="carLength" id="carLength">
             <option value="0">不限</option>
            <option value="1">9.6米</option>
            <option value="2">6.8米</option>
            <option value="3">13米</option>
            <option value="4">17.5米</option>
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
    <#if user.driver.car?length gt 0>
    	<div id="biuuuu">
    		<a href="/img/downImg.htm?path=${user.driver.car}" title="jquery.flyout">
        		<img src="/img/downImg.htm?path=${user.driver.car}" width="200px">
        	</a>
        </div>
    </#if>
    </td>
</tr>
<tr>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">身份证号：</td>
    <td width="15%">
        <input type="text" name="sfzhm" id="sfzhm" value="${user.driver.sfzhm}">
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">认证：</td>
    <td width="15%">
        <select name="sfzsfrz" id="sfzsfrz">
            <option value="0"></option>
            <option value="10">通过</option>
            <option value="1">认证中</option>
            <option value="2">认证未通过</option>
        </select>
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">身份图片：</td>
    <td width="15%" colspan="3">
    <#if user.driver.sfzzp?length gt 0>
    	<div id="biu">
    		<a href="/img/downImg.htm?path=${user.driver.sfzzp}" title="jquery.flyout">
        		<img src="/img/downImg.htm?path=${user.driver.sfzzp}" width="200px">
        	</a>
        </div>       
    </#if>
    </td>
</tr>
<tr>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">驾驶证号：</td>
    <td width="15%">
        <input type="text" name="jszhm" id="jszhm" value="${user.driver.jszhm}">
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">认证：</td>
    <td width="15%">
        <select id="jszsfrz" name="jszsfrz">
            <option value="0"></option>
            <option value="10">通过</option>
            <option value="1">认证中</option>
            <option value="2">认证未通过</option>
        </select>
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">驾驶证图片：</td>
    <td width="15%" colspan="3" nowrap="nowrap">
    <#if user.driver.jszzb?length gt 0>
    	<div id="biuu">
    		<a href="/img/downImg.htm?path=${user.driver.jszzb}" title="jquery.flyout">
        		<img src="/img/downImg.htm?path=${user.driver.jszzb}" width="200px">
        	</a>
        </div>       
    </#if>
    <#if user.driver.jszfb?length gt 0>
        <img src="/img/downImg.htm?path=${user.driver.jszfb}" width="200px">
    </#if>
    </td>
</tr>
<tr>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">行驶证号：</td>
    <td width="15%">
        <input type="text" name="xszhm" id="xszhm" value="${user.driver.xszhm}">
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">认证：</td>
    <td width="15%">
        <select name="xszsfrz" id="xszsfrz">
            <option value="0"></option>
            <option value="10">通过</option>
            <option value="1">认证中</option>
            <option value="2">认证未通过</option>
        </select>
    </td>
    <td nowrap="nowrap" style="background: #fafafa;" width="10%">行驶证图片：</td>
    <td width="15%" colspan="3" nowrap="nowrap">
    <#if user.driver.xszzb?length gt 0>
    	<div id="biuuu">
    		<a href="/img/downImg.htm?path=${user.driver.xszzb}" title="jquery.flyout">
        		<img src="/img/downImg.htm?path=${user.driver.xszzb}" width="200px">
        	</a>
        </div> 
    </#if>
    <#if user.driver.xszfb?length gt 0>
        <img src="/img/downImg.htm?path=${user.driver.xszfb}" width="200px">
    </#if>
    </td>
</tr>
<tr>
    <td nowrap="nowrap" colspan="8" align="center">
        <input type="button" value="返 回" style="width: 100px" id="goback">
    </td>
</tr>
</tbody>
</table>
	<#if ordersList?? && ordersList?size gt 0>
		<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
			<tbody>
			<tr>
			    <td width="13%" nowrap="nowrap" style="background: #fafafa;">订单号</td>
			    <td width="15%" nowrap="nowrap" style="background: #fafafa;">托运方</td>
			    <td width="8%" nowrap="nowrap" style="background: #fafafa;">订单金额(元)</td>
			    <td width="10%" nowrap="nowrap" style="background: #fafafa;">状态</td>
			    <td width="12%" nowrap="nowrap" style="background: #fafafa;">创建时间</td>
			    <td width="12%" nowrap="nowrap" style="background: #fafafa;">结束时间</td>
			    <td width="15%" nowrap="nowrap" style="background: #fafafa;">接货地</td>
			    <td width="15%" nowrap="nowrap" style="background: #fafafa;">收货地</td>
			</tr>
			<#list ordersList as orders>
				<tr>
					<td>${orders.orderNo}</td>
					<td>${orders.companyName}</td>
					<td>
						<#if orders.status gte 15 && orders.status lt 30 >
							<#if orders.total gte (500*100)>
								500
							<#else>
								${((orders.total?int)/100)?string("##0.##")}
							</#if>
						<#elseif orders.status gte 30 && orders.status lt 100 >
							${((orders.tradeTotal?int)/100)?string("##0.##")}
						<#elseif orders.status == 100>
							${((orders.finalTotal?int)/100)?string("##0.##")}
						</#if>
					</td>
					<td>
						<#if orders.status != 35 >
							${dict("driver_orders_status",orders.status)}
						<#else>
							<#if orders.dispute == 1>
								纠纷处理
							<#elseif orders.dispute == 6 >
								平台仲裁
							<#elseif orders.dispute == 7 >
								货方处理仲裁
							<#elseif orders.dispute == 8 >
								司机处理仲裁
							<#else>
								等待验货
							</#if>
						</#if>
					</td>
					<td>${orders.createTime}</td>
					<td>${orders.operateTime}</td>
					<td>
						${dict("citryMap",orders.province)}
						<#if orders.province != 110000 && orders.province != 120000
							&& orders.province != 310000 && orders.province != 500000 >
							${dict("citryMap",orders.city)}
						</#if>
					</td>
					<td>
						${dict("citryMap",orders.arrivalProvince)}
						<#if orders.arrivalProvince != 110000 && orders.arrivalProvince != 120000
							&& orders.arrivalProvince != 310000 && orders.arrivalProvince != 500000 >
							${dict("citryMap",orders.arrivalCity)}
						</#if>
					</td>
				</tr>
			</#list>
			</tbody>
		</table>
	</#if>
</form>
<div class="righttop">
              账户记录
            </div>
<form action="${queryUrl}" id="myform2" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <input name="uid" id="uid" type="hidden" value="${userId!0}">
                    </form>
					<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                    	<th nowrap="nowrap">编号</th>
                        <th nowrap="nowrap">发起时间</th>
                        <th nowrap="nowrap">支付类型</th>
                        <th nowrap="nowrap">支付状态</th>
                        <th nowrap="nowrap">订单号</th>
                        <th nowrap="nowrap">发生额</th>
                        <th nowrap="nowrap">可用余额</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if accountRecordList??>
                        <#list accountRecordList as accountRecord>
                        <tr>
                            <td width="10%">
                                ${accountRecord.id!''}
                            </td>
                            <td width="10%">${accountRecord.operateTime!''}&nbsp;</td>
                            <td width="10%">
                            	<#if accountRecord?? && accountRecord.operateType??>
	                            	<#if accountRecord.operateType == 1>
										充值
									<#elseif accountRecord.operateType == 2>
										提现
									<#elseif accountRecord.operateType == 3>
										保证金
									<#elseif accountRecord.operateType == 4>
										货款
									<#elseif accountRecord.operateType == 5>
										邮寄费用
									<#elseif accountRecord.operateType == 6>
										保费
									<#elseif accountRecord.operateType == 7>
										纠纷赔付
									<#elseif accountRecord.operateType == 8>
										违约赔偿
		        					<#else>
		        						
		        					</#if>
	        					</#if>
                            </td>
                            <td width="10%">
                            	<#if accountRecord?? && accountRecord.operateType??>
	                            	<#if accountRecord.operateType == 1>
										已支付
									<#elseif accountRecord.operateType == 2>
										<#if accountRecord.status == 6>
											待审核
		                                <#elseif accountRecord.status == 10>
											待支付
										<#elseif accountRecord.status == 16>
											已支付
										<#else>
		                                	&nbsp;
		                                </#if>
									<#elseif accountRecord.operateType == 3>
										已支付
									<#elseif accountRecord.operateType == 4>
										已支付
									<#elseif accountRecord.operateType == 5>
										已支付
									<#elseif accountRecord.operateType == 6>
										已支付
									<#elseif accountRecord.operateType == 7>
										已支付
									<#elseif accountRecord.operateType == 8>
										已支付
		        					<#else>
		        						已支付
		        					</#if>
	        					</#if>
                            </td>
                            <td width="10%">
                            	<#if accountRecord?? && accountRecord.orderId?? && accountRecord.orderId gt 0>
                                   ${accountRecord.orderNo!''}
                                </#if>
                            </td>
                            <td width="10%">
                            	 ${((accountRecord.money!0)/100)?string("##0.##")}
                            </td>
                            <td width="15%" class="noright_border">
                                ${((accountRecord.currentUsable)/100)?string("##0.##")}
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
    var old = document.referrer;
    $(document).ready(function () {
    	$('#biu a').flyout();
    	$('#biuu a').flyout();
    	$('#biuu a').flyout();
    	$('#biuuu a').flyout();
    	
        $("#status").val("${user.status}");
        $("#sex").val("${user.driver.sex}");
        $("#khyh").val("${user.driver.khyh}");
        $("#carLength").val("${user.driver.carLength}");
        $("#carType").val("${user.driver.carType}");
        $("#sfzsfrz").val("${user.driver.sfzsfrz}");
        $("#jszsfrz").val("${user.driver.jszsfrz}");
        $("#xszsfrz").val("${user.driver.xszsfrz}");
        
		 $("#page").val(${page});
        //$("#startTime").val(${startTime});
        //$("#endTime").val(${endTime});
      
        $("#mytable").find("td").mouseenter(function () {
            $(this).parent("tr").find("td").css("background", "#fafafa");
        });

        $("#mytable").find("td").mouseleave(function () {
            $(this).parent("tr").find("td").css("background", "#fff");
        });

        $("#save").click(function () {
            $.post("/ajax/updateDriverInfo.htm", $("#myform").serialize(),
                    function (re) {
                        if (re.flag == 1) {
                            alert("操作成功！");
                        } else {
                            alert("操作失败！");
                        }
                    },
                    "json").error(function () {
                        alert("操作失败");
                    });
            return false;
        });

        $("#goback").click(function () {
            window.location.href = old;
        });

        $("#status").change(function () {
            $.post("/ajax/updateStatus.htm", {id:${user.id}, status:$("#status").val()},
                    function (re) {
                        if (re.flag == 1) {
                            alert("操作成功！");
                        } else {
                            alert("操作失败！");
                        }
                    },
                    "json").error(function () {
                        alert("操作失败");
                    });

        });

        $("#resetpassword").click(function () {
            $.post("/ajax/resetPwd.htm", {id:${user.id}},
                    function (re) {
                        if (re.flag == 1) {
                            alert("操作成功！");
                        } else {
                            alert("操作失败！");
                        }
                    },
                    "json").error(function () {
                        alert("操作失败");
                    });
        });

    });
function goPage(i) {
        $("#page").val(i);
        $("#myform2").submit();
        return false;
    }
</script>
</body>
</html>