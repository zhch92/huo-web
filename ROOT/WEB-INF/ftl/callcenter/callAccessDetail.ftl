<#compress>
    <#escape x as x?html>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="75">
    <title>呼叫中心</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="css/new_call_detail.css">
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
            <div class="rside">
                <div class="table">
                    <p class="back"><a href="javascript:history.go(-1)">返回</a></p>
                    <h3>信息录入</h3>
                    <div class="info">
                        <ul class="clearfix">
                            <li class="li_1">姓名
                                <input type="text">
                            </li>
                            <li class="li_2">电话
                                <input type="text">
                            </li>
                            <li class="li_3">车牌
                                <input type="text">
                            </li>
                            <li class="li_4">位置偏好
                                <input type="text">
                            </li>
                            <li class="li_1">车长
                                <select name="" id="">
                                    <option value="9.6米">9.6米</option>
                                    <option value="13米">13米</option>
                                    <option value="17.5米">17.5米</option>
                                    <option value="其它">其它</option>
                                </select>
                            </li>
                            <li class="li_2">车型
                                <select name="" id="">
                                    <option value="箱式">箱式</option>
                                    <option value="高栏车">高栏车</option>
                                    <option value="平板车">平板车</option>
                                    <option value="其它">其它</option>
                                </select>
                            </li>
                        </ul>
                        <button class="save">保存</button>
                    </div>
                    <h3 style="margin-top:90px;border-bottom:1px dashed #ccc;padding-bottom:20px;">推荐货源 <div class="search"><select name="" id="">
                  			<option value="车型">车型</option>
                  			<option value="箱式">箱式</option>
                  			<option value="高栏车">高栏车</option>
                  			<option value="平板车">平板车</option>
                  			<option value="其它">其它</option>
                  		</select>
                  		<select name="" id="">
                  			<option value="出发地">出发地</option>
                  		</select>
                  		<select name="" id="">
                  			<option value="目的地">目的地</option>
                  		</select>
                  		<button class="sure"></button>
                  		</div> <a class="sendMsg" href="#">发送安装短信</a></h3>
                    <div class="history">
                        <ul class="clearfix">
                            <li>
                                <p class="code">发货编码：<span>C15070682562229</span></p>
                                <div class="table_item clearfix">
                                    <div class="side_info">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td width="80" height="25">天津市</td>
                                                    <td width="50"><img src="http://192.168.2.50:8089/statics/images/r1.png" alt=""></td>
                                                    <td width="85" class="title">北京市</td>
                                                </tr>
                                                <tr>
                                                    <td height="20">和平区</td>
                                                    <td></td>
                                                    <td>西城区</td>
                                                </tr>
                                                <tr>
                                                    <td>9月1日</td>
                                                    <td></td>
                                                    <td>9月4日</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <p class="require">车型要求 17.5米 &nbsp;&nbsp;&nbsp;不限车型
                                        </p>
                                    </div>
                                    <div class="rside_info">
                                        <p class="price">RMB&nbsp;1<b>/吨</b></p>
                                        <p class="introduce">14/21吨/11立方</p>
                                        <p id="345ed" class="number"></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <p class="code">发货编码：<span>C15079549212582</span></p>
                                <div class="table_item clearfix">
                                    <div class="side_info">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td width="80" height="25">北京市</td>
                                                    <td width="50"><img src="http://192.168.2.50:8089/statics/images/r1.png" alt=""></td>
                                                    <td width="85" class="title">天津市</td>
                                                </tr>
                                                <tr>
                                                    <td height="20">朝阳区</td>
                                                    <td></td>
                                                    <td>和平区</td>
                                                </tr>
                                                <tr>
                                                    <td>8月30日</td>
                                                    <td></td>
                                                    <td>9月2日</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <p class="require">车型要求 17.5米 &nbsp;&nbsp;&nbsp;不限车型
                                        </p>
                                    </div>
                                    <div class="rside_info">
                                        <p class="price">RMB&nbsp;12<b>/吨</b></p>
                                        <p class="introduce">15/11吨/111立方</p>
                                        <p id="352ed" class="number"></p>
                                    </div>
                                </div>
                            </li>
                        </ul> <ul class="clearfix">
                            <li>
                                <p class="code">发货编码：<span>C15070682562229</span></p>
                                <div class="table_item clearfix">
                                    <div class="side_info">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td width="80" height="25">天津市</td>
                                                    <td width="50"><img src="http://192.168.2.50:8089/statics/images/r1.png" alt=""></td>
                                                    <td width="85" class="title">北京市</td>
                                                </tr>
                                                <tr>
                                                    <td height="20">和平区</td>
                                                    <td></td>
                                                    <td>西城区</td>
                                                </tr>
                                                <tr>
                                                    <td>9月1日</td>
                                                    <td></td>
                                                    <td>9月4日</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <p class="require">车型要求 17.5米 &nbsp;&nbsp;&nbsp;不限车型
                                        </p>
                                    </div>
                                    <div class="rside_info">
                                        <p class="price">RMB&nbsp;1<b>/吨</b></p>
                                        <p class="introduce">14/21吨/11立方</p>
                                        <p id="345ed" class="number"></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <p class="code">发货编码：<span>C15079549212582</span></p>
                                <div class="table_item clearfix">
                                    <div class="side_info">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td width="80" height="25">北京市</td>
                                                    <td width="50"><img src="http://192.168.2.50:8089/statics/images/r1.png" alt=""></td>
                                                    <td width="85" class="title">天津市</td>
                                                </tr>
                                                <tr>
                                                    <td height="20">朝阳区</td>
                                                    <td></td>
                                                    <td>和平区</td>
                                                </tr>
                                                <tr>
                                                    <td>8月30日</td>
                                                    <td></td>
                                                    <td>9月2日</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <p class="require">车型要求 17.5米 &nbsp;&nbsp;&nbsp;不限车型
                                        </p>
                                    </div>
                                    <div class="rside_info">
                                        <p class="price">RMB&nbsp;12<b>/吨</b></p>
                                        <p class="introduce">15/11吨/111立方</p>
                                        <p id="352ed" class="number"></p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
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
