<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>操作中心</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/account.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
</head>

<body>
    <div class="header">
        <div class="head">
            <div class="logo">
                <a href="#"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
            </div>
        </div>
    </div>
    <div class="content ">
        <div class="main clearfix">
            <#include "common/leftbar.ftl">
            <div class="rside">
                <div class="table">
                    <div class="account">
                     <div class="chose  clearfix">
                        <ul class="chose_item clearfix">
                            <li class="chose_active" ><a href="/mobilelist.htm">手机APK</a></li>
							<#if Session["操作中心-交易投诉"]==1><li  class="l_side" id="complain"><a href="/tradecomplaints.htm">交易投诉</a></li></#if> 
							<#if Session["操作中心-批量发送短信"]==1><li class="l_side"><a href="/smsbatchsendtoday.htm">批量发送短信</a></li></#if> 
							
                               
                              
                        </ul>
                    </div>
                    <div class="uploading"><a href="#" id="displayApkUpload" >上传 APK</a></div>
                     <div id="apkUploadDiv" style="display:none;">
                    <form id="uploadForm" action="" method="post"  >
                    <input id="sessionsubmit" type="hidden" value="" />
                     <table  id="mytable" border="1" cellspacing="0" rules="all">
                          <tbody>
                              <tr>
                                  <td class="name" width="13%">强制更新</td>
                                  <td width="87%">
                                  <input type = "radio" class="choose1" name="isforce" value="1" checked />是
                                  	<input type = "radio" class="choose" name="isforce" value="0"/>否
                                  </td>
                              </tr>
                              <tr>
                                  <td class="name">版本号</td>
                                  <td><input type ="text" name="version"  class="ipt"  /></td>
                              </tr>
                              <tr >
                                  <td class="name">上传</td>
                                  <td>
                                  <p><input type="button" id="cancelUpload" name="cancel" class="btn" value="取消" />
                                  <input id="submitBtn" type="button" name="button" class="btn" value="上传" /></p>
                                  </td>
                              </tr>
                          </tbody>
                        </table>
                    </form>
                    </div>
                        <div class="record">
                        <table  border="1" cellspacing="0" rules="all">
                          <thead>
                            <tr>
                              <th width="14%">文件名</th>
                              <th width="12%">版本号</th>
                              <th width="35%">下载路径</th>
                              <th width="10%">下载次数</th>
                              <th width="10%">强制更新</th>
                              <th width="19%">更新时间</th>
                            </tr>
                          </thead>
                          <tbody>
                   <#if sysapks??>
                        <#list sysapks as sysapk>
                        <tr>
                            <td >${sysapk.fileName!''}&nbsp;</td>
                            <td style="text-align:left;padding-left:30px;">${sysapk.fileVersion!''}&nbsp;</td>
                            <td >${sysapk.realPath!''}--</td>
                            <td >${sysapk.num!''}&nbsp;</td>
                            <td >
                                <#if sysapk.isforce == 1>是
                                <#elseif sysapk.isforce == 2>否
                                </#if>
                                &nbsp;
                            </td>
                            <td >${sysapk.operateTime?string("YYYY年MM月dd日")}&nbsp;</td>
                        </tr>
                        </#list>
                    <#else>
                    <tr>
                        <td  align="center" class="nobottom_border noright_border">暂无数据</td>
                    </tr>
                    </#if>
                          
                          </tbody>
                        </table>
                                                   <#if pageSum gte 1>
                          <div class="page clearfix" style="text-align:right;line-height: 25px;"><ul class="clearfix">
                              <#if page != 0 >
                                <li class="home" >
                                    <a href="javascript:;" onclick="javascript:goPage(0)">&nbsp;&nbsp;</a>
                                </li>
                                 </#if>
                                  <#if page-1 gte 0 >
                                <li class="pgup"  >
                                    <a href="javascript:;" onclick="javascript:goPage(${page}-1)">&nbsp;&nbsp;</a>
                                </li>
                                  </#if>
                                <#if page+1 lte pageSum >
                                <li class="end" >
                                    <a href="javascript:;" onclick="javascript:goPage(${page}+1)">&nbsp;&nbsp;</a>
                                </li>
                                 </#if>
                                 <#if page != pageSum >
                                <li class="pgdn" >
                                    <a href="javascript:;" onclick="javascript:goPage(${pageSum})">&nbsp;&nbsp;</a>
                                </li>
                                  </#if>
                            </ul>
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/12)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                            
                        </div>
                         </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
        </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function () {
    	 $(".li_4").addClass("active");
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
