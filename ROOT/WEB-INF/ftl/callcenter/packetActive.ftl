<#compress>
    <#escape x as x?html>
        <!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>红包</title>
    <link rel="stylesheet" href="http://www.huo68.com:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://www.huo68.com:8089/statics/css/packet.css">
    <script type="text/javascript" src="http://www.huo68.com:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://www.huo68.com:8089/statics/js/common.js"></script>
</head>

<body>
    <div class="header">
        <div class="head">
            <div class="logo">
                <a href="#"><img src="http://www.huo68.com:8089/statics/images/logo.png" alt=""></a>
            </div>
        </div>
    </div>
    <div class="content ">
        <div class="main clearfix">
            <#include "common/leftbar.ftl">
            <div class="rside">
                <div class="table clearfix">
                 <form action="/packetActive.htm" id="myform" method="get">
                   <input name="page" id="page" type="hidden" value="0">
                    <div class="clearfix">
                        <div class="nav"><input type="text" placeholder="电话搜索"  name="userName" id="userName" ><input class="btn" type="submit"   value=" " onclick="phonesearch();">
                        </div>
                    </div>
                    <table border='1' cellspacing="0" rules="all">
                        <thead>
                            <tr>
                                <th width="155">姓名</th>
                                <th width="320">电话</th>
                                <th width="130">剩余次数</th>
                                <th width="110">付款状态</th>
                                <th width="140">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <#if activityMUserList??>
                                <#list activityMUserList as activity_m_user>
                            <tr>
                              <td>${activity_m_user.driver.driverName}</td>
                                <td>${activity_m_user.driver.mobile}</td>
                                <td>${3-activity_m_user.num}</td>
                                <td>
                                <#if activity_m_user.status==0>
                                未结清
                                <#else>
                                <span>已结清</span>
                                </#if>
                                </td>
                                <td> <a  href="javascript:void(0);" onclick="javascript:window.location.href='/packetActiveDetails.htm?userId=${activity_m_user.driver.userId}'" >查看</a></td>
                            </tr>
                            </#list>
                            <#else>
                             <tr>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
                                <td>--</td>
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
                      共 &nbsp&nbsp${recordsSize}&nbsp&nbsp条信息&nbsp&nbsp&nbsp&nbsp;总共&nbsp&nbsp${(recordsSize/10)?ceiling}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;当前第&nbsp&nbsp${page+1}&nbsp&nbsp页&nbsp&nbsp&nbsp&nbsp
                            
                        </div>
                         </#if>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
  
    <#include "common/foot.ftl">
    <script>
    $(document).ready(function() {
    $(".lside .li_9").addClass("active");
    $("#page").val('${page}');
    $("#userName").val('${userName}');
    })
  function goPage(i) {
        $("#page").val(i);
        $("#myform").submit();
        return false;
    }
	 function phonesearch() {
        $("#page").val(0);
        $("#myform").submit();
        return false;
    }
    </script>
</body>

</html>

    </#escape>
</#compress>
