<@compress single_line=true>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台操作记录_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="main">
<#include "common/top.ftl">
    <div class="context">
    <#include "common/left.ftl">
        <div class="right" style="">
            <div class="righttop">
              后台操作记录
            </div>
            <div class="rightok">
                <div style=" height: 35px; line-height: 35px; padding-left: 12px">
                    <form action="${queryUrl}" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <label>操作人：<input name="operator" id="operator" type="text"></label>
                        <label>操作类型：
                            <select name="operateType" id="operateType" style="width: 100px">
                                <option value="0"></option>
                                <option value="1">交易管理</option>
                                <option value="3">账户管理</option>
                                <option value="4">线下充值</option>
                                <option value="2">财务支付通过</option>
                                <option value="21">财务支付驳回</option>
                                <option value="5">财务审核通过</option>
                                <option value="51">财务审核驳回</option>
                                <option value="6">强制下架</option>
                            </select>
                        </label>
                        <label>开始时间：<input name="startTime" class="Wdate"  id="startTime" type="text" onClick="WdatePicker()"  value='${startTime}'></label>&nbsp;&nbsp;&nbsp;
                        <label>结束时间：<input name="endTime" class="Wdate"  id="endTime" type="text" onClick="WdatePicker()" value="${endTime}"></label>&nbsp;&nbsp;&nbsp;
                        <input style="margin-left: 10px" id="clearparams" type="button" value="清除条件">
                        <input type="submit" value="查 询">
                        
                    </form>
                </div>
                
                <div id="apkUploadDiv" style="display:none;">
                	<form id="uploadForm" action="" method="post" enctype="multipart/form-data" >
	                	<input id="sessionsubmit" type="hidden" value="" />
	                	<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
							<thead><tr><th colspan="2" ><b>&nbsp;&nbsp;APK上传</b></th></tr></thead>
							<tbody>
								<tr>
								    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >强制更新：</td>
								    <td width="35%">
									    &nbsp;
										<input type = "radio" name="isforce" value="1" checked />是
										&nbsp;&nbsp;&nbsp;
										<input type = "radio" name="isforce" value="2"/>否
									</td>
								</tr>
								<tr>
								    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >版本号：</td>
								    <td width="35%">
									   <input type ="text" name="version"  class='txt' />
									</td>
								</tr>
								<tr>
								    <td width="2%" nowrap="nowrap" style="background: #fafafa;" >上传 :&nbsp;</td>
								    <td width="35%">
									   <input type="file" name="apkfile" id="fileField" size="28" />
									</td>
								</tr>
								<tr>
								    <td nowrap="nowrap" colspan="2" align="left">&nbsp;
								    	<input id="submitBtn" type="button" name="button" class="btn" value="上传" />
										<!--<input id="submitUpdateBtn" type="button" name="button" class="btn" value="更新" />-->
										<input type="button" id="cancelUpload" name="cancel" class="btn" value="取消" />
								    </td>
								</tr>
										
							</tbody>
						</table>
					</form>
				</div>
                <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <th nowrap="nowrap">编号</th>
                        <th nowrap="nowrap">操作人</th>
                        <th nowrap="nowrap">操作类型</th>
                        <th nowrap="nowrap">操作时间</th>
                        <th nowrap="nowrap">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if sensitiveInfoAdmins??>
                        <#list sensitiveInfoAdmins as sensitiveInfoAdmin>
	                        <tr>
	                            <td width="5%">${sensitiveInfoAdmin.id!''}&nbsp;</td>
	                            <td width="5%">${sensitiveInfoAdmin.operator!''}&nbsp;</td>
	                            <td width="3%">
	                                <#if sensitiveInfoAdmin.operateType == 1>交易管理
	                                <#elseif sensitiveInfoAdmin.operateType == 2>财务支付通过
	                                <#elseif sensitiveInfoAdmin.operateType == 3>账户管理
	                                <#elseif sensitiveInfoAdmin.operateType == 4>线下充值	
	                                <#elseif sensitiveInfoAdmin.operateType == 5>财务审核通过	
	                                <#elseif sensitiveInfoAdmin.operateType == 51>财务审核驳回
	                                <#elseif sensitiveInfoAdmin.operateType == 21 || sensitiveInfoAdmin.operateType == 22>财务支付驳回
	                                <#elseif sensitiveInfoAdmin.operateType == 6>强制下架
	                                <#else>&nbsp;
	                                </#if>
	                            </td>
	                            <td width="15%">${sensitiveInfoAdmin.operateTime!''}&nbsp;</td>
	                            <td width="15%">
	                            	<#if sensitiveInfoAdmin.operateType == 1>
	                                <#elseif sensitiveInfoAdmin.operateType == 2 || sensitiveInfoAdmin.operateType=21 || sensitiveInfoAdmin.operateType=22>
	                                	<a href="javascript:void(0);" onclick="javascript:window.location.href='/toPayUpload.htm?accRecordId=${sensitiveInfoAdmin.objId}&type=2'">
                                			查看
                                		</a>
	                                <#elseif sensitiveInfoAdmin.operateType == 3>
	                                <#elseif sensitiveInfoAdmin.operateType == 4>
	                                	<a href="javascript:void(0);" onclick="javascript:window.location.href='/userrechargedetail.htm?accountRecordId=${sensitiveInfoAdmin.objId}&opertatorId=${sensitiveInfoAdmin.operateId}'">
	                                		查看
	                                	</a>
	                                <#elseif sensitiveInfoAdmin.operateType == 5 || sensitiveInfoAdmin.operateType=51>
	                                	<a href="javascript:void(0);" onclick="javascript:window.location.href='/toWithdrawAudit.htm?accRecordId=${sensitiveInfoAdmin.objId}'">
		                                	查看
										</a>
                                	</#if>
                                </td>
	                        </tr>
                        </#list>
                        <#include "common/page.ftl">
                        <@pageUI col="4"/>
                    <#else>
                    <tr>
                        <td colspan="4" align="center" class="nobottom_border noright_border">暂无数据</td>
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
        $("#operator").val("${operator}");
        $("#operateType").val("${operateType}");

        $("#operator, #operateType, #startTime, #endTime").change(function () {
            $("#page").val('');
        });

        $("#clearparams").click(function () {
            $("#page").val('');
            $("#operator").val('');
            $("#operateType").val('');
            $("#startTime").val('');
            $("#endTime").val('');
            $("#myform").submit();
        });

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
</@compress>