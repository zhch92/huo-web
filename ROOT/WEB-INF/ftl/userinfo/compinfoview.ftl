<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>网站注册企业信息管理_货管家管理后台</title>
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
                用户基本信息
            </div>
            <div class="rightok">   
            <form action="/updateCompanyInfo.htm" method="post" id="myform">           
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
                            <td width="15%"><input type="button" value="重置密码" id="resetpassword"></td>
                        </tr>
                         
                <input type="hidden" name="id" id="id" value="${user.companyInfo.id}">
                <input type="hidden" name="userId" id="userId" value="${user.id}">
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">企业名称：</td>
                            <td width="15%">
                                <input type="text" name="companyName" id="companyName" value="${user.companyInfo.companyName}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">公司地址：</td>
                            <td width="15%">
                                <input type="text" name="companyAdd" id="companyAdd" value="${user.companyInfo.companyAdd}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">公司性质：</td>
                            <td width="15%">
                                <select  name="companyType" id="companyType">
                                    <option value="1">合资</option>
                                    <option value="2">国有</option>
                                    <option value="3">私营</option>
                                    <option value="4">全民所有制</option>
                                    <option value="5">集体所有制</option>
                                    <option value="6">股份制</option>
                                    <option value="7">有限责任</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">行业性质：</td>
                            <td width="15%">
                                <select  name="industryType" id="industryType">
                                    <option value="1">It/通讯/电子/互联网</option>
                                    <option value="2">金融业</option>
                                    <option value="3">房地产/建筑业</option>
                                    <option value="4">造纸及纸制品/印刷业</option>
                                    <option value="5">贸易/批发</option>
                                    <option value="6">文体教育</option>
                                    <option value="7">加工制造/仪表设备</option>
                                    <option value="8">交通运输仓储</option>
                                    <option value="9">制药医疗/生物/卫生/保健</option>
                                    <option value="10">酒店/餐饮/旅游</option>
                                    <option value="11">文化/体育/娱乐业</option>
                                    <option value="12">能源/电气/采掘/地质/石油加工</option>
                                    <option value="13">政府/非盈利机构</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">积分：</td>
                            <td width="15%"><input type="text" name="integral" id="integral" value="${user.companyInfo.integral}"></td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">注册时间：</td>
                            <td width="15%">${user.operateTime}</td>
							<td nowrap="nowrap" style="background: #fafafa;" width="10%">支付手机号：</td>
                            <td width="15%">
                                <input type="text" name="payMobile" id="payMobile" value="${user.companyInfo.payMobile}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">支付验证人：</td>
                            <td width="15%">
                                <input type="text" name="payName" id="payName" value="${user.companyInfo.payName}">
                            </td>
                        </tr>
                        <tr>              
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">营业执照号：</td>
                            <td width="15%">
                                <input type="text" name="yyzzhm" id="yyzzhm" value="${user.companyInfo.yyzzhm}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">营业执照照片：</td>
                            <td width="15%">
                                <#if user.companyInfo.yyzzzp??>
                                	<div id="biuu">
							    		<a href="/img/downImg.htm?path=${user.companyInfo.yyzzzp}" title="jquery.flyout">
							        		<img src="/img/downImg.htm?path=${user.companyInfo.yyzzzp}" width="200px">
							        	</a>
							        </div>																
								<#else>
									<img id="cxImg"  width="100px" height="100px" src="http://static.lahuo8.com/static/images/banner.jpg">
								</#if>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">营业执照是否认证：</td>
                            <td width="15%">
                                <select name="yyzzsfrz" id="yyzzsfrz">
                                    <option value="10">通过</option>
                                    <option value="1">认证中</option>
                                    <option value="0">未认证</option>
                                    <option value="2">认证未通过</option>
                                </select>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">安全邮箱：</td>
                            <td width="15%">
                                <input type="text" name="email" id="email" value="${user.companyInfo.email}">
                            </td>
                        </tr>
                        <tr>              
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">组织机构代码：</td>
                            <td width="15%">
                                <input type="text" name="zzjgdm" id="zzjgdm" value="${user.companyInfo.zzjgdm}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">织机构代码照片：</td>
                            <td width="15%">
                                <#if user.companyInfo.zzjgdmzp??>									
									<div id="biu">
							    		<a href="/img/downImg.htm?path=${user.companyInfo.zzjgdmzp}" title="jquery.flyout">
							        		<img src="/img/downImg.htm?path=${user.companyInfo.zzjgdmzp}" width="200px">
							        	</a>
							        </div>							
								<#else>
									<img id="cxImg" width="100px" height="100px" src="http://static.lahuo8.com/static/images/banner.jpg">
								</#if>
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">组织机构代码是否认证：</td>
                            <td width="15%" colspan="3">
                                <select  name="zzjgdmsfrz" id="zzjgdmsfrz">
                                    <option value="10">通过</option>
                                    <option value="1">认证中</option>
                                    <option value="0">未认证</option>
                                    <option value="2">认证未通过</option>
                                </select>
                            </td>
                            
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">警戒支付额：</td>
                            <td width="15%">
                                <input type="text" name="alarmValue" id="alarmValue" value="${user.companyInfo.alarmValue}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">大额变动回呼电话：</td>
                            <td width="15%">
                                <input type="text" name="alarmPhone" id="alarmPhone" value="${user.companyInfo.alarmPhone}">
                            </td>  
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">联系人姓名：</td>
                            <td width="15%">
                                <input type="text" name="linkName" id="linkName" value="${user.companyInfo.linkName}">
                            </td>
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">联系人电话号码：</td>
                            <td width="15%">
                                <input type="text" name="linkPhone" id="linkPhone" value="${user.companyInfo.linkPhone}">
                            </td>               
                        </tr>
                        <tr>
                            
                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">联系人手机号：</td>
                            <td width="15%" colspan="7">
                                <input type="text" name="linkMobile" id="linkMobile" value="${user.companyInfo.linkMobile}">
                            </td> 
                        </tr>
                        </form>
                        <#if user.companyInfo.bankCard??>
	                        <tr>
	                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">开户银行类型：</td>
	                            <td width="15%">
	                                <select style="width: 100px" name="bankType" id="bankType">
	                                    <option value="1">建设银行</option>
	                                    <option value="2">工商银行</option>
	                                    <option value="3">农业银行</option>
	                                    <option value="4">中国银行</option>
	                                    <option value="5">招商银行</option>
	                                    <option value="6">交通银行</option>
	                                </select>
	                            </td>
	                            <input type="hidden" name="bankCardId" id="bankCardId" value="${user.companyInfo.bankCard.id}">
	                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">银行卡号：</td>
	                            <td width="15%">
	                                <input type="text" name="bankCard" id="bankCard" value="${user.companyInfo.bankCard.bankCard}">
	                            </td>
	                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">户名：</td>
	                            <td width="15%">
	                                <input type="text" name="cardName" id="cardName" value="${user.companyInfo.bankCard.cardName}">
	                            </td> 
	                            <td nowrap="nowrap" style="background: #fafafa;" width="10%">开户行地址：</td>
	                            <td width="15%">
	                                <input type="text" name="bankAdd" id="bankAdd" value="${user.companyInfo.bankCard.bankAdd}">
	                            </td> 
	                        </tr>     
                        </#if>   
                        <tr>
                        <td nowrap="nowrap" colspan="8" align="center">
                            <input type="button" value="返 回" style="width: 100px" onclick="history.go(-1)">
                        </td>
                    </tr>              
                        </tbody>
                    </table>
                    <#if ordersList?? && ordersList?size gt 0>
						<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
							<tbody>
							<tr>
							    <td width="13%" nowrap="nowrap" style="background: #fafafa;">订单号</td>
							    <td width="15%" nowrap="nowrap" style="background: #fafafa;">承运方</td>
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
									<td>${orders.driverName}</td>
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
										<#if orders.status == 5 >
											运输方发起交易
										<#elseif orders.status == -10>
											货方驳回交易
										<#elseif orders.status == 35>
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
										<#else>
											${dict("cargoer_orders_status",orders.status)}
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
    $(document).ready(function () {
    	$('#biu a').flyout();
    	$('#biuu a').flyout();
        $("#status").val("${user.status}");
         
        $("#companyType").val("${user.companyInfo.companyType}");
        $("#industryType").val("${user.companyInfo.industryType}");
        $("#yyzzsfrz").val("${user.companyInfo.yyzzsfrz}");
        $("#zzjgdmsfrz").val("${user.companyInfo.zzjgdmsfrz}");   
        
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
        	var companyName = $('#companyName').val();
				companyName = $.trim(companyName);
			var companyAdd = $('#companyAdd').val();	
				companyAdd = $.trim(companyAdd);
			var companyType = $('#companyType').val();
				companyType = $.trim(companyType);
			var industryType = $('#industryType').val();
				industryType = $.trim(industryType);
			var yyzzhm = $('#yyzzhm').val();
				yyzzhm = $.trim(yyzzhm);
			var yyzzsfrz = $('#yyzzsfrz').val();
				yyzzsfrz = $.trim(yyzzsfrz);
			var zzjgdm = $('#zzjgdm').val();
				zzjgdm = $.trim(zzjgdm);
			var zzjgdmsfrz = $('#zzjgdmsfrz').val();
				zzjgdmsfrz = $.trim(zzjgdmsfrz);
			var payName = $('#payName').val();
				payName = $.trim(payName);
			var payMobile = $('#payMobile').val();
				payMobile = $.trim(payMobile);
			var alarmValue = $('#alarmValue').val();
				alarmValue = $.trim(alarmValue);
			var linkName = $('#linkName').val();
				linkName = $.trim(linkName);
			var linkMobile = $('#linkMobile').val();
				linkMobile = $.trim(linkMobile);
			var linkPhone = $('#linkPhone').val();
				linkPhone = $.trim(linkPhone);
			var integral = $('#integral').val();
				integral = $.trim(integral);
			var yyzzfb = $('#yyzzfb').val();
				yyzzfb = $.trim(yyzzfb);
			var alarmPhone = $('#alarmPhone').val();
				alarmPhone = $.trim(alarmPhone);			
			var email = $('#email').val();
				email = $.trim(email);
					
        	var bankType = $('#bankType').val();
				bankType = $.trim(bankType);
			var bankAdd = $('#bankAdd').val();
				bankAdd = $.trim(bankAdd);		
			var bankCard = $('#bankCard').val();
				bankCard = $.trim(bankCard);
			var cardName = $('#cardName').val();
				cardName = $.trim(cardName);	
			var bankCardId = $("#bankCardId").val();
			    if(bankCardId==''){
			    	bankCardId="0";
			    }
        	var companyId=$("#id").val();     	
            $.post("/ajax/updateCompanyInfo.htm", {id:companyId,companyName:companyName,companyAdd:companyAdd,companyType:companyType,industryType:industryType,yyzzhm:yyzzhm,yyzzsfrz:yyzzsfrz,zzjgdm:zzjgdm,zzjgdmsfrz:zzjgdmsfrz,payMobile:payMobile,payName:payName,alarmValue:alarmValue,linkName:linkName,linkPhone:linkPhone,linkMobile:linkMobile,yyzzfb:yyzzfb,integral:integral,email:email,alarmPhone:alarmPhone,bankCardNo:bankCard,cardName:cardName,bankType:bankType,bankAdd:bankAdd,bankCardId:bankCardId},
                    function (re) {
                        if (re.flag == 1) {
                            alert("操作成功！");
                        } else {
                            alert(re.msg);
                        }
                    },
                    "json").error(function () {
                        alert("操作失败");
                    });
            return false;
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
    });  
    function goPage(i) {
        $("#page").val(i);
        $("#myform2").submit();
        return false;
    }
</script>
</body>
</html>