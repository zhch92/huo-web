<#compress>
    <#escape x as x?html>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="75">
    <title>呼叫中心</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="css/new_call_Access.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
</head>

<body>
    <div class="header">
        <div class="head">
            <div class="logo"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></div>
        </div>
    </div>
    <div class="content ">
        <div class="main clearfix">
            <div class="lside">
                <ul>
                    <li class="li_1">
                        <a href="/usermanagement.htm"></a>
                    </li>
                    <li class="li_2">
                        <a href="/cargoList.htm"></a>
                    </li>
                    <li class="li_3">
                        <a href="/datauser.htm"></a>
                    </li>
                    <li class="li_4">
                        <a href="/mobilelist.htm"></a>
                    </li>
                    <li class="li_6">
                        <a href="/sysuserlist.htm"></a>
                    </li>
                    <li class="li_7">
                        <a href="/taskcargo.htm"></a>
                    </li>
                    <li class="li_9">
                        <a href="/packetActive.htm"></a>
                    </li>
                    <li id="exitSys" class="li_8">
                        <a href="#"></a>
                    </li>
                </ul>
            </div>
            <script type="text/javascript">
            $('#exitSys').click(function() {
                if (confirm("确认要退出？")) {
                    exitSys();
                }
            });

            function exitSys() {
                $.post("/ajax/outLogin.htm",
                    function(data) {
                        if (data.flag == 1) {
                            window.location.href = "/login.htm";
                        } else {
                            $.alert('抱歉，退出失败！');
                        }
                    }, "json");
            }
            </script>
            <div class="rside">
                <div class="table">
                    <div class="chose clearfix">
                        <ul class="chose_item clearfix">
                            <li><a href="/taskcargo.htm">发布货源</a></li>
                            <li class="l_side chose_active"><a href="/pushDealmaking.htm">撮合交易</a></li>
                            <li class="l_side"><a href="/transactionTracking.htm">交易跟踪</a></li>
                            <li class="l_side"><a href="/userinfolist.htm">用户认证</a></li>
                        </ul>
                    </div>
                    <div class="title"><a href="#">主动撮合</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a class="active" href="#">呼入撮合</a>
</div>
                    <div class="chose clearfix">
                        <ul class="clearfix">
                            <li class="add"><a href="/taskcargoadd.htm">新建呼入</a></li>
                        </ul>
                    </div>
                    <table border="1" cellspacing="0" rules="all">
                        <thead>
                            <tr>
                                <th width="8%">姓名</th>
                                <th width="14%">电话</th>
                                <th width="16%">车牌</th>
                                <th width="10%">车长</th>
                                <th width="10%">车型</th>
                                <th width="24%">位置偏好</th>
                                <th width="18%">来电时间</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="text-align:center"> 马国明</td>
                                <td style="padding-left:15px;">13438383838</td>
                                <td style="padding-left:45px;">川A45612</td>
                                <td style="padding-left:15px;">13米</td>
                                <td style="padding-left:15px;">高栏车</td>
                                <td style="padding-left:8px;">成都、兰州
                                、云南、重庆、昆明</td>
                                <td style="padding-left:20px;">2015年8月10日12:35</td>
                            </tr>
                            <tr>
                                <td style="text-align:center"> 马国明</td>
                                <td style="padding-left:15px;">13438383838</td>
                                <td style="padding-left:45px;">川A45612</td>
                                <td style="padding-left:15px;">13米</td>
                                <td style="padding-left:15px;">高栏车</td>
                                <td style="padding-left:8px;">成都、兰州
                                、云南、重庆、昆明</td>
                                <td style="padding-left:20px;">2015年8月10日12:35</td>
                            </tr><tr>
                                <td style="text-align:center"> 马国明</td>
                                <td style="padding-left:15px;">13438383838</td>
                                <td style="padding-left:45px;">川A45612</td>
                                <td style="padding-left:15px;">13米</td>
                                <td style="padding-left:15px;">高栏车</td>
                                <td style="padding-left:8px;">成都、兰州
                                、云南、重庆、昆明</td>
                                <td style="padding-left:20px;">2015年8月10日12:35</td>
                            </tr><tr>
                                <td style="text-align:center"> 马国明</td>
                                <td style="padding-left:15px;">13438383838</td>
                                <td style="padding-left:45px;">川A45612</td>
                                <td style="padding-left:15px;">13米</td>
                                <td style="padding-left:15px;">高栏车</td>
                                <td style="padding-left:8px;">成都、兰州
                                、云南、重庆、昆明</td>
                                <td style="padding-left:20px;">2015年8月10日12:35</td>
                            </tr><tr>
                                <td style="text-align:center"> 马国明</td>
                                <td style="padding-left:15px;">13438383838</td>
                                <td style="padding-left:45px;">川A45612</td>
                                <td style="padding-left:15px;">13米</td>
                                <td style="padding-left:15px;">高栏车</td>
                                <td style="padding-left:8px;">成都、兰州
                                、云南、重庆、昆明</td>
                                <td style="padding-left:20px;">2015年8月10日12:35</td>
                            </tr><tr>
                                <td style="text-align:center"> 马国明</td>
                                <td style="padding-left:15px;">13438383838</td>
                                <td style="padding-left:45px;">川A45612</td>
                                <td style="padding-left:15px;">13米</td>
                                <td style="padding-left:15px;">高栏车</td>
                                <td style="padding-left:8px;">成都、兰州
                                、云南、重庆、昆明</td>
                                <td style="padding-left:20px;">2015年8月10日12:35</td>
                            </tr>
                        </tbody>
                        
                    </table>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="foot">
                <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">&copy 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
            </div>
        </div>
        <script>
        $(document).ready(function() {
            $(".li_7").addClass("active");
        });

        function goPage(i) {
            $("#page").val(i);
            $("#myform").submit();
            return false;
        }
        </script>
</body>

</html>

    </#escape>
</#compress>
