<#compress>
    <#escape x as x?html>
        <!DOCTYPE html>
        <html lang="zh-CN">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>呼叫中心-发布货源</title>
            <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
            <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/info_fill.css">
            <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
            <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
            <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/laydate.js"></script>
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
                            <p class="back"><a href="javascript:history.go(-1)">返回</a></p>
                            <div class="compang_info clearfix">
                                <ul>
                           <li>公司名称<input id='companyName' type="text" onblur="infoFill()" onfocus="{$('#finded').text('')}"><span id="finded" ></span></li>
                           <li>电话号码<input  id='companyMobile' type="text" onblur="infoFill()"  onfocus="{$('#finded').text('')}"></li>
                     </ul>
                    <dl>
                    <dd>信用 ：<span id="honey">暂无</span>      </dd>
                        <dd>总运量 ：暂无</dd>
                    </dl>
                    <dl>
                    <dd>注册时间 ：<span id="time">暂无</span></dd>
                        <dd>偏好 ：暂无</dd>
                    </dl>
                    <dl>
                        <dd>&nbsp</dd>
                        <dd>最大装载量：暂无</dd>
                    </dl>
                            </div>
                            <div class="info_fill">
                                <div class="fill">
                                    <ul class="clearfix">
                                        <li>货物类型
                         <input type="text"  maxlength="4" name="cargoName" id="cargoName" onblur="if(this.value==''){ checkCargoName();}"  onfocus="{$('#cargoName_msg').text('')}"  placeholder="1-4字"><span id="cargoName_msg" class="error_msg" >
                       </li>
                                        <li>货物重量
                                            <input type="text" id="weight" name="weight"  onblur="if(this.value==''||this.value==0){ checkWeight();}else{countTotal();}"  onkeyup="istnum(this);"  onfocus="{$('#weightSquare_msg').text('')}"  onafterpaste="istnum(this);">&nbsp&nbsp&nbsp吨
                                            <input type="text" id="square" name="square"  onfocus="{$('#weightSquare_msg').text('')}"  onblur="if(this.value==''||this.value==0){ checkSquare();}"   onkeyup="istnum(this);"  onafterpaste="istnum(this);">&nbsp&nbsp&nbsp立方<span id="weightSquare_msg" class="error_msg"></li>
                                        <li>货物价格
                                            <input type="text" id="quote" name="quote" class="f_text" onblur="if(this.value==''|| this.value==0){ checkQuote();}else{countTotal();}" onfocus="{$('#quote_msg').text('')}"  onkeyup="this.value=this.value.replace(/\D/g,'');isMmoney(this);" 
                           onafterpaste="this.value=this.value.replace(/\D/g,'')" onfocus="{$('#quote_msg').text('')}">&nbsp&nbsp&nbsp 元/吨
               &nbsp&nbsp&nbsp&nbsp &nbsp总&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp价
                                            <input id="totalprice" onblur="if(this.value==''||this.value==0){ checkTotalPrice();}else{countquoteAuto();}"  onkeyup="istnum(this);"  onafterpaste="istnum(this);" type="text"><span id="quote_msg" class="error_msg"></span>
                                        </li>
                                        <li>车&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp长
                                            <select name="" id="carLength">
                                                <option value="4">不限车长</option>
                                                <option value="1">9.6米</option>
                                                <option value="2">13米</option>
                                                <option value="3">17.5米</option>
                                                <option value="0">其它</option>
                                            </select>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp车&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp型
                                            <select name="" id="carType">
                                                <option value="4">不限车型</option>
                                                <option value="7">箱式</option>
                                                <option value="11">高栏</option>
                                                <option value="1">平板</option>
                                                <option value="0">其它</option>
                                            </select>
                                        </li>
                                    </ul>
                                </div>
                                <div class="data">
                                    <ul>
                                      <li>接货日期
                                            <input id="start" type="text"  onfocus="{$('#start_msg').text('')}"><i></i><span id="start_msg" class="error_msg">
                                        </li>

                                        <li>接货地址
                                            <select class="mar_l" id="province" onchange="setCityGB2260(this.value);" name="province">
                                                <option selected="selected">请选择省</option>
                                            </select>&nbsp&nbsp省&nbsp&nbsp
                                            <select id="city" onchange="setCountyGB2260(this.value);" name="city">
                                                <option selected="selected">请选择市</option>
                                            </select>&nbsp&nbsp市&nbsp&nbsp
                                            <select id="county" name="county">
                                                <option selected="selected">请选择县</option>
                                              </select>&nbsp&nbsp区/县<span id="startAdd_msg" class="error_msg"></span></li>
                                    </ul>
                                </div>
                                <div class="data">
                                    <ul>
                                    <!--
                                       <li>到货日期
                                            <input id="end" type="text"   onfocus="{$('#end_msg').text('')}" ><i></i><span id="end_msg" class="error_msg">
                                        </li> 
                                        -->
                                        <li>到货地址
                                            <select id="province1" class="mar_l" onchange="setCityGB22601(this.value);" name="province1">
                                                <option selected="selected">请选择省</option>
                                            </select>省
                                            <select id="city1" onchange="setCountyGB22601(this.value);" name="city1">
                                                <option selected="selected">请选择市</option>
                                            </select>市
                                            <select id="county1" name="county1">
                                                <option value="" selected="selected">请选择县</option>
                                            </select>区/县<span id="arrivalAdd_msg" class="error_msg"></span>
                                        </li>
                                    </ul>
                                </div>
                                <p class="remark">备&nbsp&nbsp&nbsp&nbsp&nbsp 注
                                    <input type="text" maxlength="40"  placeholder='40字以内（可不填）'>
                                </p>
                                 <p class="bttn"><button class="sure"  onclick="info_fill()" style="float:right;margin-right:260px;">发布</button></p>
                            </div>
                            
                        </div>
                </div>
            </div>
            <#include "common/foot.ftl">
                <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/dq.js"></script>
                <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/dqcopy.js"></script>
                <script>
                $(document).ready(function() {
                    $(".li_7").addClass("active");
                     $("#province,#city,#county").on("click",function(){
                      $("#startAdd_msg").text('');
                     });
                      $("#province1,#city1,#county1").on("click",function(){
                      $("#arrivalAdd_msg").text('');
                     });
                     showDialog() ;
                });
                var userId=0;
                
function infoFill(){
            var cName=$("#companyName").val();
            var cMobile=$("#companyMobile").val();
            if (cName!='' || cMobile !='') {
            $.ajax({
                url:"/ajax/getCompanyByNamePhone.htm",
                type:"post",
                data:{userName:cName,phone:cMobile},
                dataType:"json",
                success:function(data){
               if (data.flag ==1) {
                 var Name=data.data.companyName;
                 var Mobile=data.data.linkMobile;
                 var yezz=data.data.yyzzsfrz;
               var  id =data.data.userId
                 var  honey="发货"+data.data.fhds+"次"+"  " +"装货率"+data.data.zhl+"%"+"  " +"结款率"+data.data.jkl+"%";
                 var time=data.data.operateTime;
                 var timer;
                  var t=new Date(time);
                  var year = t.getFullYear(); 
                    var month = t.getMonth() + 1; 
                    var date = t.getDate(); 
                    if (month < 10) { month = "0" + month; } 
                    if (date < 10) { date = "0" + date; } 
                   var timer=year +" 年" + month +"月" + date+"日" ;
                    var hours = t.getHours();
                    var mins = t.getMin
                    var mins = t.getMinutes();
                    var second = t.getSeconds();  
                 if(yezz==0||yezz==1){
                  $("#finded").text("未认证用户，不能发货"); 
                  return;
                 }
               if(cName==""){
               $("#companyName").val(Name);
               }
               if(cMobile==''){
               $("#companyMobile").val(Mobile);
               }
              $("#honey").text(honey);
              $("#time").text(timer) ;
                } else {
                 $("#finded").text(data.msg);
                }
                 userId=id
                },
                error:function(){
                    setDialog('温馨提示',"系统繁忙，请稍后再试")
                }

            })
        };
        }
        function getthedate(dd,dadd)
{
//可以加上错误处理
var a = new Date(dd)
a = a.valueOf()
a = a + dadd * 24 * 60 * 60 * 1000
a = new Date(a);
var m = a.getMonth() + 1;
if(m.toString().length == 1){
    m='0'+m;
}
var d = a.getDate();
if(d.toString().length == 1){
    d='0'+d;
}

return a.getFullYear() + "-" + m + "-" + d;
}

          function checkCargoName(){$("#cargoName_msg").text('货物类型不能为空或为0!');}
          function checkQuote(){$("#quote_msg").text('货物价格不能为空或为0!');}
          function checkWeight(){$("#weightSquare_msg").text('货物重量不能为空或为0!');}
          function checkSquare(){$("#weightSquare_msg").text('货物方量不能为空或为0!');}
          function checkStart(){$("#start_msg").text('接货日期不能为空!');}
          function checkStartAdd(){$("#startAdd_msg").text('请选泽接货地址!');}
       
          function checkArrivalAdd(){$("#arrivalAdd_msg").text('请选择到货地址!');}
                function info_fill() {
                $(".sure").attr('disabled','disabled');
                    var cargoName = $.trim($("#cargoName").val());
                    var quote = $.trim($("#quote").val());
                    var weight = $.trim($("#weight").val());
                    var square = $.trim($("#square").val());
                    var carLength = $.trim($("#carLength").val());
                    var carType = $.trim($("#carType").val());
                    var start = $.trim($("#start").val());
                    var end=getthedate(start ,3);
                    var province = $.trim($("#province").val());
                    var city = $.trim($("#city").val());
                    var county = $.trim($("#county").val());
                    var startAdd = $.trim($("#startAdd").val());
                    var province1 = $.trim($("#province1").val());
                    var city1 = $.trim($("#city1").val());
                    var county1 = $.trim($("#county1").val());
                    var arrivalAdd = $.trim($("#arrivalAdd").val());
                    if (cargoName == "" || cargoName == 0) {
                      $("#cargoName_msg").text('温馨提示,货物类型不能为空或为0!');
                            //alert("密码错误");
                       // return;
                    }
                    if (quote == "" || quote == 0) {
                        $("#quote_msg").text('货物价格不能为空或为0!');
                            //alert("密码错误");
                        // return;
                    }
                    if (weight == "" || weight == 0) {
                        $("#weightSquare_msg").text('货物重量不能为空或为0!');
                            //alert("密码错误");
                        // return;
                    }
                    if (square == "" || square == 0) {
                       $("#weightSquare_msg").text('货物方量不能为空或为0!');
                            //alert("密码错误");
                        // return;
                    }
                    if (start == "" || start == 0) {
                      $("#start_msg").text('接货日期不能为空!');
                            //alert("密码错误");
                        // return;
                    }
                    if (province == "" || city == "" || county == "") {
                        $("#end_msg").text('到货日期不能为空!');
                            //alert("密码错误");
                        // return;
                    }
                    if (end == "" || end == 0) {
                        $("#end_msg").text('到货日期不能为空!');
                            //alert("密码错误");
                        // return;
                    }
                     if (province == "请选择省" || city == "请选择市" || county == "请选择县") {
                       checkStartAdd();
                            //alert("密码错误");
                        // return;
                    }

                    if (province1 == "" || city1 == "" || county1 == "") {
                        $("#arrivalAdd_msg").text('请选择到货地址!');
                            //alert("密码错误");
                      //return;
                    }
                    if (!checkTwoDate(start, end)) {
                        return;
                    }
                    start = start + " 23:59:59";
                    end = end + " 23:59:59";
                    var paras = {
                        userId:userId,
                        cargoName: cargoName,
                        quote: quote,
                        weight: weight,
                        square: square,
                        carLength: carLength,
                        carType: carType,
                        sendTime: start,
                        arrivalTime: end,
                        province: province,
                        city: city,
                        county: county,
                        startAdd: startAdd,
                        arrivalProvince: province1,
                        arrivalCity: city1,
                        arrivalCounty: county1,
                        arrivalAdd: arrivalAdd,
                        shelve: 1,
                        sendTimeStr: start,
                        arrivalTimeStr: end
                    };
          if(cargoName=""||quote==""||weight==""||square==""|| start=="" ){
          setDialog('温馨提示', "请完整信息");
          $(".sure").removeAttr('disabled'); 
          return ;
          }
                    $.ajax({
                        type: "POST",
                        url: "/ajax/insertTaskCargo.htm",
                        data: paras,
                        datatype: "json",
                        success: function(data) {
                            var obj = eval('(' + data + ')');
                            if (obj.flag == 1) {
                                 setDialog('温馨提示','发布成功!');
            $("button").click(function(){
                $(".sure").removeAttr('disabled'); 
               $("#cargoName,#weight,#square,#quote,#totalprice").val('');
            });
                            } else {
         setDialog('温馨提示', obj.msg)
                            }  
                           $("button").click(function(){
                $(".sure").removeAttr('disabled'); 
               
            });
                        }
                    });

                };

    //算总价
    function countTotal(){
        var wnum=$("#weight").val();
        var per=$("#quote").val();
        if(wnum!=""&&per!=""){
                $("#totalprice").val(Math.round(wnum*per));
        }
    }
     //算单价
    function countquoteAuto(){
        var totalprice=$("#totalprice").val();
        var wnum=$("#weight").val();
        if(totalprice!=""&&wnum!=""){
                $("#quote").val(Math.round(totalprice/wnum));
        }
    }
  
        function isMmoney(obj){
        if(obj.value>9999){
            obj.value=obj.value.substr(0,obj.value.length-1);
        }
    }
        function istnum(obj){
        var reg =  /^\d{0,9}.\d{0,2}$/;
        if(!reg.test(obj.value)){
            obj.value=obj.value.substr(0,obj.value.length-1);
        }
        var values=obj.value.replace(/(.)(?=[^$])/g,"$1,").split(","); 
        for(var c=0;c<values.length;c++){
            var idReg=/^[0-9][0-9]*$/; 
             if (!idReg.test(values[c])&&values[c]!="."){
                obj.value=obj.value.substr(0,obj.value.length-1);
             }
             if(c>0&&values[0]==0&&values.indexOf(".") == -1){
                obj.value=obj.value.substr(0,0);
             }else if(values[0]==0&&values[1]==0){
                obj.value=obj.value.substr(0,0);
             }else if(values.indexOf(".") != -1 && values[0]=="."){
                obj.value="";
             }
        }
         if(obj.value>999999999.99){
            obj.value='';
        }
    }
    
        //日期比较
        function checkTwoDate( startDate,endDate ) {
        startDate = $.trim(startDate);
        endDate = $.trim(endDate);
        var now= new Date();
        var s=now;
        if(startDate<s){
           setDialog('温馨提示','请完整发货信息');
            $("button").click(function(){
                $(".sure").removeAttr('disabled'); 
            });
           
            // alert("密码错误","提示");
            return ;
        }
        if(endDate<s){
            setDialog('温馨提示', '到货日期不能小于当前日期!');
             $("button").click(function(){
                $(".sure").removeAttr('disabled'); 
            });
            // alert("密码错误");
            return false;
        }
        if( startDate > endDate ) {
            // setDialog('温馨提示', '接货日期不能大于到货日期!');
            alert('接货日期不能大于到货日期!')
             $("button").click(function(){
                $(".sure").removeAttr('disabled'); 
            });
            // alert("密码错误","提示");
            return false;
        }
        return true;
    } 



                var start = {
                    elem: '#start',
                    format: 'YYYY-MM-DD',
                    min: laydate.now(),
                    max: '2099-06-16',
                    istime: false,
                    istoday: false,
                    choose: function(datas) {
                        end.min = datas; //开始日选好后，重置结束日的最小日期
                        end.start = datas //将结束日的初始值设定为开始日
                    }

                };
                var end = {
                    elem: '#end',
                    format: 'YYYY-MM-DD',
                    min: laydate.now(),
                    max: '2099-06-16',
                    istime: false,
                    istoday: false,
                    choose: function(datas) {
                        start.max = datas; //结束日选好后，重置开始日的最大日期
                    }

                };
                laydate(start);
                laydate(end);
                function setDialog(title, info) {
document.getElementById('mydialogtitle').innerHTML = title;
document.getElementById('mydialoginfo').innerHTML = info;
$(".opacity-bg,.sure_box").show();
$(".sure_box h3 b,.sure_box button").click(function(){
$(".opacity-bg,.sure_box").hide();
})
}

function showDialog() {
light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;padding-bottom:30px;border: 1px solid #cccccc;border-radius: 5px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;cursor: pointer;\"></b></h3><p style=\"text-align: center;padding: 30px 20px;font-size: 20px;color: #575757;max-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
$(".footer").after(light_box1);
};
              
                </script>
        </body>

        </html>
    </#escape>
</#compress>
