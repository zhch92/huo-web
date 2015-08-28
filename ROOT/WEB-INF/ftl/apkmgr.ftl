<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>手机APK管理_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
</head>
<body>
<div class="main">
<#include "common/top.ftl">
    <div class="context">
    <#include "common/left.ftl">
        <div class="right" style="">
            <div class="righttop">
                手机APK管理
            </div>
            <div class="rightok">
                <div style=" height: 35px; line-height: 35px; padding-left: 12px">
                    <form action="${queryUrl}" id="myform" method="get">
                        <input name="page" id="page" type="hidden" value="0">
                        <label>文件名：<input name="fileName" id="fileName" type="text"></label>
                        <label>版本号：<input name="fileVersion" id="fileVersion" type="text"></label>
                        <label>强制更新：
                            <select name="isforce" id="isforce" style="width: 100px">
                                <option value="0"></option>
                                <option value="1">是</option>
                                <option value="2">否</option>
                            </select>
                        </label>
                        <input style="margin-left: 10px" id="clearparams" type="button" value="清除条件">
                        <input type="submit" value="查 询">
                        
                        <input type="button" id="displayApkUpload" value="上传apk">
                        <#-- <input type="button" id="lastApkDownload" value="下载">-->
                        
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
                        <th nowrap="nowrap">文件名</th>
                        <th nowrap="nowrap">版本号</th>
                        <th nowrap="nowrap">下载路径</th>
                        <th nowrap="nowrap">下载次数</th>
                        <th nowrap="nowrap">强制更新</th>
                        <th nowrap="nowrap">注册时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if sysapks??>
                        <#list sysapks as sysapk>
                        <tr>
                            <td width="5%">${sysapk.id!''}&nbsp;</td>
                            <td width="5%">${sysapk.fileName!''}&nbsp;</td>
                            <td width="5%">${sysapk.fileVersion!''}&nbsp;</td>
                            <td width="15%">${sysapk.realPath!''}&nbsp;</td>
                            <td width="3%">${sysapk.num!''}&nbsp;</td>
                            <td width="3%">
                                <#if sysapk.isforce == 1>是
                                <#elseif sysapk.isforce == 2>否
                                </#if>
                                &nbsp;
                            </td>
                            <td width="15%">${sysapk.operateTime!''}&nbsp;</td>
                        </tr>
                        </#list>
                        <#if pageSum gte 1>
                        <tr>
                            <td colspan="7" class=" nobottom_border noright_border">
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
                        <td colspan="7" align="center" class="nobottom_border noright_border">暂无数据</td>
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
        $("#fileName").val("${fileName}");
        $("#fileVersion").val("${fileVersion}");
        $("#isforce").val(${isforce});

        $("#fileName, #isforce, #fileVersion").change(function () {
            $("#page").val('');
        });

        $("#clearparams").click(function () {
            $("#page").val('');
            $("#fileName").val('');
            $("#fileVersion").val('');
            $("#isforce").val('');
            $("#myform").submit();
            $("#uploadForm").resetForm();
        });

        $("#mytable").find("td").mouseenter(function () {
            $(this).parent("tr").find("td").css("background", "#fafafa");
        });

        $("#mytable").find("td").mouseleave(function () {
            $(this).parent("tr").find("td").css("background", "#fff");
        });
        
        //*******apk上传，下载
        $("#apkUploadDiv").hide();
		$('#displayApkUpload').click(function(){
			$("#apkUploadDiv").show();
		});
		$('#lastApkDownload').click(function(){
			window.location.href="/downapk.htm";
		});
		
		
		
		$("#sessionsubmit").val("");
		
		
		$("#submitBtn").click(function(){
		
	        if(!$("#sessionsubmit").val()){
				$("#sessionsubmit").val("submited");
				
				$("#uploadForm").ajaxSubmit({  
		            url:"/ajax/apkUpload.htm",  
		            type:"post",  
		            enctype:'multipart/form-data',  
		            dataType:'json',
		            success:function(data) { 
		            	 if(data && data.flag==1){
					      	 alert("上传成功！");
					      	 window.location.reload();
					      }else{
					      	 alert(data.msg);
					      }
					      $("#sessionsubmit").val();
					      return false;
		            },error:function(data) {  
		                alert('系统或网络错误！',"错误",{fontSize:18});
		            }  
		        });
			}else{
				alert("已提交!正在处理...");
			}
        });
		
		
		
		$('#submitUpdateBtn').click(function(){
			if(!$("#sessionsubmit").val()){
				$("#sessionsubmit").val("submited");
				$("#uploadForm").attr("action","/sysapk/apkUploadUpdate.htm").submit();
			}else{
				$.showMsgAlert("已提交!正在处理..");
			}
		});
		$('#cancelUpload').click(function(){
			$("#apkUploadDiv").hide();
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