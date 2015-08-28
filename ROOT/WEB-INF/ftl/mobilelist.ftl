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
                    <div class="uploading"><a href="#">上传 APK</a></div>
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
                    <#else>
                    <tr>
                        <td colspan="7" align="center" class="nobottom_border noright_border">暂无数据</td>
                    </tr>
                    </#if>
                          
                          </tbody>
                        </table>
                  <#if pageSum gte 1>
                        <div class="page clearfix"><ul class="clearfix">
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
                      共 ${recordsSize}条信息&nbsp;总共${(recordsSize/12)?ceiling}页&nbsp;当前第${page+1}页
                            
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
        </div>
 <script type="text/javascript">
      $(document).ready(function () {
    	  $(".li_5").addClass("active");
          $("#page").val('${page}');
      });
      </script>
</body>

</html>
