<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>财务审核_查看详情_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="main">
<#include "common/top.ftl">
    <div class="context">
    <#include "common/left.ftl">
        <div class="right" style="">
            <div class="righttop">
              查看详情
            </div>
        	<div class="rightok">
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <tbody>
                		<tr>
                            <th nowrap="nowrap" width="5%">名称：</th>
                            <td>${userName!''}&nbsp;</td>
                            <th nowrap="nowrap" width="5%">用户类型：</th>
                            <td>
								<#if userType==1>
                                   司机
                                <#elseif userType==2>
                                   企业
                                <#else>
                                	&nbsp;
                                </#if>
							</td>
                        </tr>
                        <tr>
                            <th nowrap="nowrap">注册手机号：</th>
                            <td>${registerMobile!''}</td>
                            <th nowrap="nowrap">支付手机号：</th>
                            <td>${payMobile!''}&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <th nowrap="nowrap">账户余额：</th>
                            <td>${((usable!0)/100)?string("##0.##")}&nbsp;</td>
                            <th nowrap="nowrap">保证金：</th>
                            <td>${((depoistMoney!0)/100)?string("##0.##")}&nbsp;</td>
                        </tr>
                        <tr>
                            <th nowrap="nowrap">开户银行：</th>
                            <td>${dict("bankcard_type",bankNameNumber)}1</td>
                            <th nowrap="nowrap">银行卡号：</th>
                            <td>${bankCardNo!''}</td>
                        </tr>
                        <tr>
                            <th nowrap="nowrap">开户行地址：</th>
                            <td>${bankAddr!''}</td>
                            <th nowrap="nowrap">开户名：</th>
                            <td>${bankUsername!''}</td>
                        </tr>
                        <tr style="line-height: 10px;">
                            <th nowrap="nowrap">用户状态：</th>
                            <td>
                            	<#if user.status == 1>
                   					正常
                                <#elseif user.status == -1>
                                   <font style="color:red;" >已删除</font>
                                <#elseif user.status == 2>
								   <font style="color:red;">冻结</font>
                                <#elseif user.status == 3>
								   <font style="color:red;">待验证</font>
								<#else>
									未知
                                </#if>
                            </td>
                            <th nowrap="nowrap">认证状态：</th>
                            <td>
	                            	<#if user.usertype == 1>
	                            		身份证：
	                                    <#if user.driver.sfzsfrz == 0>
											未认证
	                                    <#elseif user.driver.sfzsfrz == 1>
											认证中
										<#elseif user.driver.sfzsfrz == 2>
											未通过
	                                    <#elseif user.driver.sfzsfrz == 10>
											已认证
										<#else>
											认证中
	                                    </#if>
										</br>驾驶证：
										<#if user.driver.jszsfrz == 0>
											未认证
	                                    <#elseif user.driver.jszsfrz == 1>
											认证中
										<#elseif user.driver.jszsfrz == 2>
											未通过
	                                    <#elseif user.driver.jszsfrz == 10>
											已认证
										<#else>
											认证中
	                                    </#if>
	                                    </br>行驶证：
	                                    <#if user.driver.xszsfrz == 0>
											未认证
	                                    <#elseif user.driver.xszsfrz == 1 >
											认证中
										<#elseif user.driver.xszsfrz == 2>
											未通过
	                                    <#elseif user.driver.xszsfrz == 10>
											已认证
										<#else>
											认证中
										</#if>
	                                <#elseif user.usertype == 2>
	                                	营业执照：
	                                    <#if user.companyInfo.yyzzsfrz == 0>
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
										</br>组织机构代码：
										<#if user.companyInfo.zzjgdmsfrz == 0>
											未认证
	                                    <#elseif user.companyInfo.zzjgdmsfrz == 1 >
											认证中
	                                    <#elseif user.companyInfo.zzjgdmsfrz == 2>
	                                    	未通过
	                                    <#elseif user.companyInfo.yyzzsfrz == 10>
	                                       	 已认证
	                                    <#else>
	                                    	认证中
	                                    </#if>
	                                <#elseif user.usertype == 3>
	                                    <#if user.specialCompany??>
	                                        <#if user.specialCompany.yyzzsfrz == 0 && user.specialCompany.zzjgdmsfrz == 0 >
	                                         	未认证
	                                        <#elseif user.specialCompany.yyzzsfrz == 1 || user.specialCompany.zzjgdmsfrz == 1 >
												认证中
		                                    <#else>
												已认证
		                                    </#if>
	                                    </#if>
	                                </#if>
	                    	</td>
                        </tr>
                        
                    </tbody>
                </table>
                <div style=" height: 35px; line-height: 35px; padding-left: 12px">
                	
                    <form action="${queryUrl}" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <input name="userId" id="userId" type="hidden" value="${userId!0}">
                    </form>
                    <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
                </div>
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
    $(document).ready(function () {

        $("#page").val(${page});
        //$("#startTime").val(${startTime});
        //$("#endTime").val(${endTime});
      
        $("#mytable").find("td").mouseenter(function () {
            $(this).parent("tr").find("td").css("background", "#fafafa");
        });

        $("#mytable").find("td").mouseleave(function () {
            $(this).parent("tr").find("td").css("background", "#fff");
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
