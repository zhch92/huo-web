<#compress >
    <#escape x as x?html>
  <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>企业个人中心-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/style.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/index.js"></script>
    <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?39f1eef3f577e574e809dcb29d873fd2";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
    
</head>

<body>
<#include "common/head.ftl"/>
    <div class="arrived">
        <div class="arrive clearfix">
            <div class="logo">
                <a href="/index.htm"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
            </div>
            <div class="user_info">
                <ul>
                    <li class="name">${helloUser('${user_id}')}<span> <div class="more">  
                <dl>
                    <dd class="set"><b class="b_1"></b><a href="/companyInfo/toCompanyInfo.htm">设置</a></dd>
                    <dd class="out"><b class="b_2"></b><a href="javascript:void(0);" onclick="logout();">退出</a></dd>
                </dl>
                </div></span>
                    </li>
                    <li>发货${helloUser('${user_id}','3','3')}笔</li>
                    <li>装货率${helloUser('${user_id}','4','3','3')}%</li>
                    <li>结款率${helloUser('${user_id}','5','3','3','3')}%</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main_p">
        <div class="main">
            <div class="title clearfix">
                <h3><a class="all"  href="javascript:void(0);" id="allTrad">我的交易</a>  <b>
                <div class="more">
                <dl><dd>
                    <a class="record"href="javascript:void(0);" id="applyRecord" onclick="applyRecordFunc();">全部货源</a>
                </dd></dl>
                </div>
                     
                </b></h3>
                <ul>
                    <li class="publish"><b></b><a href="javascript:void(0);" onclick="addcargo();" style="color: #ffa335;font-size: 16px;">发布货源</a></li>
                </ul>
            </div>
             <div id="content">
                
             </div>
    
           <div class="page"  id="pagebar">
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 蜀ICP备15006511号-1</p>
        </div>
    </div>
    <div id="opacity-bg" class="opacity-bg">
    </div>
    <div id="popdivset">
    </div>
  
<script type="text/javascript">
var styleorder="";
var pagevar=0;
var sizeval=-6;
var typesearch=1;
$(document).ready(function () {
	getoders();
});

function allTradFunc(){
	  $("#allTrad").html("我的交易");
	  $("#applyRecord").html("全部货源");
	  document.getElementById("applyRecord").setAttribute("onclick","applyRecordFunc()");
	   pagevar=0;
	   sizeval=-6;
	  getoders();
	  typesearch=1;
}
function applyRecordFunc(){
	  $("#allTrad").html("全部货源");
	  $("#applyRecord").html("我的交易");
	  document.getElementById("applyRecord").setAttribute("onclick","allTradFunc()");
	   pagevar=0;
	   sizeval=-6;
	  applyCargo();
	  typesearch=2;
}
//get货物
function getoders(){
	  var paras= {ordersStatus:styleorder,currentPage:Number(pagevar)+1};
	  $.ajax({
        type: "POST",
        url: "/orders/cargoerOrdersajaxList.htm",
        data:paras,
        datatype:"json",
        success: function(data)
        {
        	  if(data!=null && data!=""){
        		    var obj=eval('('+data+')'); 
        	      	getodersList(obj.ordersList)
        	      	 getPageList(Number(obj.flag));
              }else{
            	  $('#content').empty();
            	  $("#content").append("<div class=\"reminder\">暂无交易</div>");
              }
        }
        });
}
//发布货源
function addcargo(){
	 var paras= {userId:'${user_id}'};
	  $.ajax({
	        type: "POST",
	        url: "/cargo/checkCertification.htm",
	        data:paras,
	        datatype:"json",
	        success: function(data)
	        {
	        	  if(data!=null && data!=""){
	        		    var obj=eval('('+data+')'); 
	        		    if(obj.flag==1){
	        		    	 window.location.href="/cargo/cargoadd.htm";
	        		    }else{
	        		    	alert(obj.msg);
	        		    }
	              }else{
	            	  $('#content').empty();
	            	  $("#content").append("<div class=\"reminder\">暂无货源</div>");
	              }
	        }
	        });
}

function hidediv(){
	$(".hidden_1").hide();
	$(".hidden_2").hide();
	$(".hidden_3").hide();
	$(".hidden_4").hide();
}

//全部货源
function applyCargo(){
	 var paras= {currentPage:Number(pagevar)+1};
	  $.ajax({
       type: "POST",
       url: "/orders/cargoerApplyList.htm",
       data:paras,
       datatype:"json",
       success: function(data)
       {
    	   if(data!=null && data!=""){
    		   var obj=eval('('+data+')'); 
    	     	getcargoList(obj.cargoList)
    	     	 getPageList(Number(obj.flag));
    	   }else{
         	  $('#content').empty();
        	  $("#content").append("<div class=\"reminder\">暂无申请</div>");
           }
       }
       });
}
//我的交易
function getodersList(obj){
	 if (obj) {
        $('#content').empty();
        $('#popdivset').empty();
         if (obj.length > 0) {
       	  var addhtml="";
       	var drvierary=new Array();
    	var drvierary1=new Array();
       	    driverarytemp=0;
         	 driverarytemp1=0;
         	var cargodriverhtml="";
             for (var i = 0; i < obj.length; i++) {
           	  var orders = obj[i];
           	  var statusval="";
           	  var statusbtn="";
          		drvierary[driverarytemp]=orders.cargoId;
           	  if(orders.status==5){
           		  statusval="<a href=\"\">申请中</a><span></span>";
           		  statusbtn="<a  href=\"javascript:void(0);\" class=\"look\">查看详情</a>";
           	  }else if(orders.status==100){
           		  statusval="<a href=\"javascript:;\" onclick=\"checkdetaok(\'1\','"+orders.id+"');\">违约投诉</a><span></span>";
           		  statusbtn="<a class=\"look\" href=\"javascript:;\" onclick=\"popcheck('"+orders.cargoId+"');\">查看详情</a>";
           	  }
           	  if(orders.status==100 && orders.dispute==1){//装货投诉
           		  statusval="<a class=\"look introduce_color\" href=\"javascript:;\"  onclick=\"checkdetaok(\'1\','"+orders.id+"');\">装货投诉中</a><span></span>";
           		  statusbtn="<a class=\"look\" href=\"javascript:;\" onclick=\"popcheck('"+orders.cargoId+"');\">查看详情</a>";
           	  }else if(orders.status==100 && orders.dispute==2){//结款投诉
           		  statusval="<a class=\"look introduce_color\"href=\"javascript:;\"  onclick=\"checkdetaok(\'1\','"+orders.id+"');\">结款投诉中</a><span></span>";
           		  statusbtn="<a class=\"look\" href=\"javascript:;\"  onclick=\"popcheck('"+orders.cargoId+"');\">查看详情</a>";
           	  }
         	  if(orders.status==100 && orders.dispute==5){//装货投诉
           		  statusval="<a class=\"look\" href=\"javascript:;\"  onclick=\"checkdetaok(\'1\','"+orders.id+"');\">装货投诉中</a><span></span>";
           		  statusbtn="<a class=\"look\" href=\"javascript:;\"  onclick=\"popcheck('"+orders.cargoId+"');\">查看详情</a>";
           	  }else if(orders.status==100 && orders.dispute==6){//结款投诉
           		  statusval="<a class=\"look introduce_color\"href=\"javascript:;\"  onclick=\"checkdetaok(\'1\','"+orders.id+"');\">交付投诉中</a><span></span>";
           		  statusbtn="<a class=\"look\" href=\"javascript:;\"  onclick=\"popcheck('"+orders.cargoId+"');\">查看详情</a>";
           	  }
           	  
           	  if((orders.isCargoDownShelve==1 && orders.status==-1) || (orders.isCargoDownShelve==2  && orders.status==-1)){
           		  statusval="<a href=\"javascript:;\" onclick=\"popcheck('"+cargo.id+"');\">修改货源</a><span>暂停调车</span>";
           		  statusbtn="<a class=\"look\" href=\"#\">查看详情</a>";
           	  }
           	  if(orders.status==101){
           		 statusval="<a href=\"javascript:;\">交易完成</a>";
       		    statusbtn="<a class=\"gray_btn\" href=\"javascript:;\">交易已完成</a>";
           	  }
           	  var carlength=carlengthset(orders.carLength);
           	  var cartype=cartypeset(orders.carType);
           	  var hiddendiv="";
           	  
           	/*交易中*/
       	  if(orders.status==100 && (orders.dispute==0 || orders.dispute==3 || orders.dispute==4 || orders.dispute==7)){
       	  //取消投诉
       	  var cancelok="<div class=\"hidden_2 hidden js_hidden_2\" id='apply2"+orders.id +"'><div class=\"hide sure_apply_1\"><p>投诉<span>交易编号："+orders.orderNo+"</span>"
       	  +" </p><div class=\"bttn\"><button class=\"back sure\" onclick=\"checkcancelok('6','"+orders.id+"');\">交付投诉</button><button class=\"apple_a sure\" onclick=\"checkcancelok('5','"+orders.id+"');\">"
       	  +"装货投诉</button><button class=\"cancel\" onclick=\"cancelapplyyes('0','"+orders.id+"');\">返回</button></div></div></div>";
       	  //详细信息
       	      //详细地址
      /*   var  detaok="<div class=\"hidden_4 hidden js_hidden_4\"  id='apply1"+orders.id +"'><div class=\"hide d_adress\"><p class=\"owner\">"
           +"接货方联系人 ：<em>"+orders.driver.driverName+"</em> </p><p class=\"owner\">联系电话 ：<em>"+orders.driver.mobile+"</em> <span></span>"
           +" </p><p class=\"mar_t\">接货地址： <span>"+orders.countyStr+"</span></p><p>目的地址： <span>"+orders.arrivalCountyStr+"</span>"
           +"</p><p class=\"mar_t\">车牌号：<span>"+orders.driver.carNumber+"</span></p><button class=\"cancel js_backBtn\" onclick=\"cancelapplyno('0','"+orders.id+"');\">返回</button></div></div>";*/
       	  hiddendiv=cancelok;
       	  
       	  // 弹出框修改
       	cargodriverhtml+="<div class=\"details_box\" id=popdiv"+orders.cargoId+" style=\"display: none;\"><h3>查看详情 <a href=\"javascript:void(0);\" onclick=\"closebox('popdiv"+orders.cargoId+"');\"]><b></b></a></h3>"+
  		"<div class=\"particulars clearfix\"><p class=\"coding\">货源编号："+orders.cargoNo+"</p><div class=\"lside\">"+
  		"<table><tr><td class=\"titl\">"+orders.cityStr+"</td><td width=\"55\"><img src=\"http://192.168.2.50:8089/statics/images/r1.png\" alt=\"\"></td><td width=\"80\" class=\"titl\">"+orders.arrivalCityStr+"</td></tr><tr><td>"+orders.countyStr+"</td><td></td><td>"+orders.arrivalCountyStr+"</td></tr><tr><td>"
  		+ orders.sendTimeStr+"</td><td></td><td>"+orders.arrivalTimeStr+"</td></tr></table><div class=\"text\"><p>车辆要求&nbsp&nbsp"+carlength+"&nbsp&nbsp"
  		+cartype+"</p></div></div><div class=\"mside\">"
  		+"<ul class=\"clearfix\"><li class=\"li_1\">接货地址:</li><li class=\"li_2\">"+orders.cityStr+orders.countyStr+orders.startAdd+"</li><li class=\"li_1\">"
  		+"到货地址：</li><li class=\"li_2\">"+orders.arrivalCityStr+orders.arrivalCountyStr+orders.arrivalAdd+"</li></ul>"
  		+"</div><div class=\"rside\"><p class=\"price\">RMB"+(orders.quote/100)+"/吨</p><p class=\"introduce\">"+orders.cargoName+"/"+orders.weight+"吨/"+orders.square+"立方</p></div></div>"
  		+"<ul><li class=\"title_b\"><table class=\"title\"><tr><td width=\"115\" style=\"padding-left:22px;\">申请时间</td><td width=\"202\">申请报价</td><td width=\"93\">车牌号"
  	    +"</td><td width=\"85\">车型</td><td width=\"102\">车长</td><td width=\"65\"></td></tr></table></li><li><table class=\"detail_item\"><tr>"
    	+"<td width=\"115\" style=\"padding-left:22px;\">"+new Date(orders.createTime).toLocaleDateString()+"</td><td width=\"202\">"+orders.money/100+"元/吨×"+orders.count+"吨=<span>"+orders.total/100+"元</span></td>"
    	+"<td width=\"93\">"+orders.driver.carNumber+"</td><td width=\"85\">"+cartypeset(orders.driver.carType)+"</td><td width=\"102\">"+carlengthset(orders.driver.carLength)+"</td><td width=\"65\">"
    	+"</td></tr></table><div class=\"details clearfix\" style=\"display: block;\" id='xiangq"+orders.id+"'><dl><dd class=\"title\">联系电话: </dd>"
    	+"<dd>司机信息:</dd></dl><dl><dd class=\"title\"><strong>"+orders.driver.mobile+"</strong></dd><dd>"+orders.driver.driverName+" <span>"+orders.driver.carNumber+"</span>"
    	+" <span class=\"end\">"+renzheng(orders.driver.xszsfrz)+"</span></dd><dd>车型 <span>"+cartypeset(orders.driver.carType)+"</span><span>车长 </span> <span>"+carlengthset(orders.driver.carLength)+"</span></dd>"
    	+"<dd>驾驶证 <span class=\"end\">"+renzheng(orders.driver.jszsfrz)+"</span></dd><dd>身份证 <span class=\"end\">"+renzheng(orders.driver.sfzsfrz)+"</span></dd>"
        +"<dd>信用 <span>拉货"+orders.driver.jhds+"笔 </span><span>装货率&nbsp"+orders.driver.zhl+"%</span> <span>交付率&nbsp"+orders.driver.jkl+"%</span></dd>"
    	+"</dl><div class=\"bttn\"></div></div></li></ul></div>";
    	$("#popdivset").append(cargodriverhtml);
       	  }
       	  
          /*投诉受理中*/
          if(orders.dispute==1 || orders.dispute==2 || orders.dispute==5 || orders.dispute==6){
          	   var tempstatu="";
        	   var tempsbtn="";
        	   if(orders.dispute==1){
        		   tempstatu="司机发货投诉中...";
        	   }else if(orders.dispute==2){
        		   tempstatu="司机结款投诉中...";
        		 
        	   }else if(orders.dispute==5){
        		   tempstatu="货主接货投诉中..."; 
        		   tempsbtn="<button class=\"sure cancel_1\" onclick=\"checkcancelok('4','"+orders.id+"');\">取消投诉</button>";
        	   }else{
        		   tempstatu="货主交付投诉中...";
        		   tempsbtn="<button class=\"sure cancel_1\" onclick=\"checkcancelok('4','"+orders.id+"');\">取消投诉</button>";
        	   }
          //详细地址
       /*    var detatousu="<div class=\"hidden_4 hidden js_hidden_4\"  id='apply1"+orders.id +"'><div class=\"hide d_adress\"><p class=\"owner\">"
           +"接货方联系人 ：<em>"+orders.driver.driverName+"</em> </p><p class=\"owner\">联系电话 ：<em>"+orders.driver.mobile+"</em> <span></span>"
           +" </p><p class=\"mar_t\">接货地址： <span>"+orders.countyStr+"</span></p><p>目的地址： <span>"+orders.arrivalCountyStr+"</span>"
           +"</p><p class=\"mar_t\">车牌号：<span>"+orders.driver.carNumber+"</span></p><button class=\"cancel js_backBtn\" onclick=\"cancelapplyno('0','"+orders.id+"');\">返回</button></div></div>";*/
   	    //取消投诉
   	    var canceltousu="<div class=\"hidden_2 hidden js_hidden_2\"  id='apply2"+orders.id +"'><div class=\"hide sure_apply_1\"><p>投诉<span>交易编号："+orders.orderNo+"</span> "
   	    +"</p><div class=\"bttn\"><button class=\"ing\">"+tempstatu+"</button>"+tempsbtn
   	    +"<button class=\"cancel cancel_1\" onclick=\"cancelapplyyes('0','"+orders.id+"');\" >返回</button></div></div></div>";
   	    hiddendiv=canceltousu;
   	    
   	       
   	   cargodriverhtml+="<div class=\"details_box\" id=popdiv"+orders.cargoId+" style=\"display: none;\"><h3>查看详情 <a href=\"javascript:void(0);\" onclick=\"closebox('popdiv"+orders.cargoId+"');\"]><b></b></a></h3>"+
		"<div class=\"particulars clearfix\"><p class=\"coding\">货源编号："+orders.cargoNo+"</p><div class=\"lside\">"+
		"<table><tr><td class=\"titl\">"+orders.cityStr+"</td><td width=\"55\"><img src=\"http://192.168.2.50:8089/statics/images/r1.png\" alt=\"\"></td><td width=\"80\" class=\"titl\">"+orders.arrivalCityStr+"</td></tr><tr><td>"+orders.countyStr+"</td><td></td><td>"+orders.arrivalCountyStr+"</td></tr><tr><td>"
		+ orders.sendTimeStr+"</td><td></td><td>"+orders.arrivalTimeStr+"</td></tr></table><div class=\"text\"><p>车辆要求&nbsp&nbsp"+carlength+"&nbsp&nbsp"
		+cartype+"</p></div></div><div class=\"mside\">"
		+"<ul class=\"clearfix\"><li class=\"li_1\">接货地址:</li><li class=\"li_2\">"+orders.cityStr+orders.countyStr+orders.startAdd+"</li><li class=\"li_1\">"
		+"到货地址：</li><li class=\"li_2\">"+orders.arrivalCityStr+orders.arrivalCountyStr+orders.arrivalAdd+"</li></ul>"
		+"</div><div class=\"rside\"><p class=\"price\">RMB"+(orders.quote/100)+"/吨</p><p class=\"introduce\">"+orders.cargoName+"/"+orders.weight+"吨/"+orders.square+"立方</p></div></div>"
		+"<ul><li class=\"title_b\"><table class=\"title\"><tr><td width=\"115\" style=\"padding-left:22px;\">申请时间</td><td width=\"202\">申请报价</td><td width=\"93\">车牌号"
	    +"</td><td width=\"85\">车型</td><td width=\"102\">车长</td><td width=\"65\"></td></tr></table></li><li><table class=\"detail_item\"><tr>"
 	+"<td width=\"115\" style=\"padding-left:22px;\">"+new Date(orders.createTime).toLocaleDateString()+"</td><td width=\"202\">"+orders.money/100+"元/吨×"+orders.count+"吨=<span>"+orders.total/100+"元</span></td>"
 	+"<td width=\"93\">"+orders.driver.carNumber+"</td><td width=\"85\">"+cartypeset(orders.driver.carType)+"</td><td width=\"102\">"+carlengthset(orders.driver.carLength)+"</td><td width=\"65\">"
 	+"</td></tr></table><div class=\"details clearfix\" style=\"display: block;\" id='xiangq"+orders.id+"'><dl><dd class=\"title\">联系电话: </dd>"
 	+"<dd>司机信息:</dd></dl><dl><dd class=\"title\"><strong>"+orders.driver.mobile+"</strong></dd><dd>"+orders.driver.driverName+" <span>"+orders.driver.carNumber+"</span>"
 	+" <span class=\"end\">"+renzheng(orders.driver.xszsfrz)+"</span></dd><dd>车型 <span>"+cartypeset(orders.driver.carType)+"</span><span>车长 </span> <span>"+carlengthset(orders.driver.carLength)+"</span></dd>"
 	+"<dd>驾驶证 <span class=\"end\">"+renzheng(orders.driver.jszsfrz)+"</span></dd><dd>身份证 <span class=\"end\">"+renzheng(orders.driver.sfzsfrz)+"</span></dd>"
     +"<dd>信用 <span>拉货"+orders.driver.jhds+"笔 </span><span>装货率&nbsp"+orders.driver.zhl+"%</span> <span>交付率&nbsp"+orders.driver.jkl+"%</span></dd>"
 	+"</dl><div class=\"bttn\"></div></div></li></ul></div>";
 	$("#popdivset").append(cargodriverhtml);
          }
           	  
           	  
           	 var contentvar="<p class=\"coding\">交易编号："+orders.orderNo+statusval+"</p><div class=\"lside\"><table>"+
           	"<tr><td class=\"titl\">"+orders.cityStr+"</td><td width=\"55\"><img src=\"http://192.168.2.50:8089/statics/images/r1.png\" alt=\"\">"+
           	"</td><td width=\"80\" class=\"titl\">"+orders.arrivalCityStr+"</td></tr><tr><td>"+orders.countyStr+"</td><td></td><td>"+orders.arrivalCountyStr
           	 +"</td></tr><tr><td>"+ orders.sendTimeStr+"</td>"+
           	"<td></td><td>"+orders.arrivalTimeStr+"</td></tr></table><div class=\"text\"><p>车辆要求&nbsp&nbsp"+carlength+"&nbsp&nbsp"+cartype+"</p><p></p>"+
           	"</div></div><div class=\"rside\"><p class=\"price\">RMB&nbsp"+(orders.quote/100)+"/吨</p><p class=\"introduce\">"+orders.cargoName
           	+"/"+orders.count+"吨/"+(((orders.square)/(orders.weight))*(orders.count)).toFixed(0)+"立方</p><p class=\"number\"></p>"+statusbtn+"</div>"+hiddendiv;
           	  
           	  //头尾
           	   if(chk(i)==="1"){
                	  if(i+2< obj.length){
                		  addhtml+="<div class=\"floor clearfix\"><div class=\"padd_r\"><div class=\"show clearfix\">"+contentvar+"</div></div>";
                	  }else{
                		  addhtml+="<div class=\"floor clearfix\"><div class=\"padd_r\"><div class=\"show clearfix\">"+contentvar+"</div></div>";; 
                	  }
                  }else if(chk(i)==2){
                	  addhtml+="<div class=\"padd_l\"><div class=\"show clearfix\">"+contentvar+"</div></div></div>";
                  }
           	      if(i+1< obj.length==false && chk(i)==="1"){
                	  addhtml+="</div>";
                  }
             }
             $("#content").append(addhtml);
            }
         }
	 }
	 
//全部货源
function getcargoList(obj){
	 if (obj) {
       $('#content').empty();
       $('#popdivset').empty();
        if (obj.length > 0) {
      	  var addhtml="";
      	var cargodriverhtml="";
            for (var i = 0; i < obj.length; i++) {
          	  var cargo = obj[i];
          	  var statusval="";
          	  var statusbtn="";
          	  if(cargo.shelve==1){//已上架
          		  if(!((cargo.ordersList).length>0)){
          		  statusval="<a href=\"javascript:void(0);\" onclick=\"upcargo('"+cargo.id+"');\">修改货源</a><span></span>";  
          		  }
          		  statusbtn="<a  href=\"javascript:void(0);\" onclick=\"popcheck('"+cargo.id+"');\" class=\"look\">查看详情</a>";
          	  }else if(cargo.shelve==2){
          		  statusval="<a href=\"javascript:;\" onclick=\"upcargo('"+cargo.id+"');\">修改货源</a><span>暂停调车</span>";
          		  statusbtn="<a  class=\"gray_btn\" href=\"javascript:;\" onclick=\"checkdetaok(\'0\','"+cargo.id+"');\">查看详情</a>";
          	  }
          	  var carlength=carlengthset(cargo.carLength);
           	  var cartype=cartypeset(cargo.carType);
          	 var hiddendiv;
          	  
          	 var tempcolor1="";
    	     if((cargo.ordersList).length<=0){
    	    	 tempcolor1="<p class=\"number\">";
    	     }else{
    	    	 tempcolor1="<p class=\"introduce_color\">";
    	     }
          	 var contentvar="<p class=\"coding\">货源编号："+cargo.cargoNo+statusval+"</p><div class=\"lside\"><table>"+
          	"<tr><td class=\"titl\">"+cargo.cityStr+"</td><td width=\"55\"><img src=\"http://192.168.2.50:8089/statics/images/r1.png\" alt=\"\">"+
          	"</td><td width=\"80\" class=\"titl\">"+cargo.arrivalCityStr+"</td></tr><tr><td>"+cargo.countyStr+"</td><td></td><td>"+cargo.arrivalCountyStr
          	 +"</td></tr><tr><td>"+ cargo.sendTimeStr+"</td>"+
          	"<td></td><td>"+cargo.arrivalTimeStr+"</td></tr></table><div class=\"text\"><p>车辆要求&nbsp&nbsp"+carlength+"&nbsp&nbsp"+cartype+"</p><p></p>"+
          	"</div></div><div class=\"rside\"><p class=\"price\">RMB&nbsp"+(cargo.quote/100)+"/吨</p><p class=\"introduce\">"+cargo.cargoName
          	+"/"+cargo.weight+"吨/"+cargo.square+"立方</p>"+tempcolor1+(cargo.ordersList).length+"申请</p>"+statusbtn+"</div>";
          	  
          	  //头尾
          	   if(chk(i)==="1"){
               	  if(i+2< obj.length){
               		  addhtml+="<div class=\"floor clearfix\"><div class=\"padd_r\"><div class=\"show clearfix\">"+contentvar+"</div></div>";
               	  }else{
               		  addhtml+="<div class=\"floor clearfix\"><div class=\"padd_r\"><div class=\"show clearfix\">"+contentvar+"</div></div>";; 
               	  }
                 }else if(chk(i)==2){
               	  addhtml+="<div class=\"padd_l\"><div class=\"show clearfix\">"+contentvar+"</div></div></div>";
                 }
          	      if(i+1< obj.length==false && chk(i)==="1"){
               	  addhtml+="</div>";
                 }
          	      
          	//弹框
          //	if((cargo.ordersList).length>0){//id='xiangq"+cargo.id+"'introduce_color
        	      var tempcolor="";
        	     if((cargo.ordersList).length<=0){
        	    	 tempcolor="<p class=\"introduce\">";
        	     }else{
        	    	 tempcolor="<p class=\"introduce_color\">";
        	     }
        	  
          		cargodriverhtml+="<div class=\"details_box\" id=popdiv"+cargo.id+" style=\"display: none;\"><h3>查看详情 <a href=\"javascript:void(0);\" onclick=\"closebox('popdiv"+cargo.id+"');\"]><b></b></a></h3>"+
          		"<div class=\"particulars clearfix\"><p class=\"coding\">货源编号："+cargo.cargoNo+"</p><div class=\"lside\">"+
          		"<table><tr><td class=\"titl\">"+cargo.cityStr+"</td><td width=\"55\"><img src=\"http://192.168.2.50:8089/statics/images/r1.png\" alt=\"\"></td><td width=\"80\" class=\"titl\">"+cargo.arrivalCityStr+"</td></tr><tr><td>"+cargo.countyStr+"</td><td></td><td>"+cargo.arrivalCountyStr+"</td></tr><tr><td>"
          		+ cargo.sendTimeStr+"</td><td></td><td>"+cargo.arrivalTimeStr+"</td></tr></table><div class=\"text\"><p>车辆要求&nbsp&nbsp"+carlength+"&nbsp&nbsp"
          		+cartype+"</p></div></div><div class=\"mside\">"
          		+"<ul class=\"clearfix\"><li class=\"li_1\">接货地址："
          		+"</li><li class=\"li_2\">"+cargo.cityStr+cargo.countyStr+cargo.startAdd+"</li><li class=\"li_1\">"
          		+"到货地址：</li><li class=\"li_2\">"+cargo.arrivalCityStr+cargo.arrivalCountyStr+cargo.arrivalAdd+"</li></ul>"
          		+"</div><div class=\"rside\"><p class=\"price\">RMB"+(cargo.quote/100)+"/吨</p><p class=\"introduce\">"+cargo.cargoName+"/"+cargo.weight+"吨/"+cargo.square+"立方</p>"+tempcolor+(cargo.ordersList).length+"人申请</p></div></div>"
          		+"<ul><li class=\"title_b\"><table class=\"title\"><tr>"
          	    +"<td width=\"115\" style=\"padding-left:22px;\">申请时间</td><td width=\"202\">申请报价</td><td width=\"93\">车牌号"
          	    +"</td><td width=\"85\">车型</td><td width=\"102\">车长</td><td width=\"65\"></td></tr></table></li>";
          	for (var j = 0; j < (cargo.ordersList).length; j++) {
          		var orders = (cargo.ordersList)[j];
          	  var carlength=carlengthset(orders.driver.carLength);
           	  var cartype=cartypeset(orders.driver.carType);
           	
           	
           	
          		cargodriverhtml+="<li><table class=\"detail_item\"><tr>"
          	    +"<td width=\"115\" style=\"padding-left:22px;\">"+new Date(orders.createTime).toLocaleDateString()+"</td><td width=\"202\">"+orders.money/100+"元/吨×"+orders.count+"吨=<span>"+orders.total/100+"元</span></td>"
          	    +"<td width=\"93\">"+orders.driver.carNumber+"</td><td width=\"85\">"+cartypeset(orders.driver.carType)+"</td><td width=\"102\">"+carlengthset(orders.driver.carLength)+"</td><td width=\"65\"><a href=\"javascript:void(0);\" onclick=\"xiangqing('xiangq"+orders.id+"');\" ><span class=\"togg\">"
          	    +"<i id=\"arrowI\"></i>查看详情</span></a></td>"
          	    +"</tr></table><div class=\"details clearfix\" id='xiangq"+orders.id+"'><dl><dd class=\"title\">联系电话: </dd>"
          	    +"<dd>司机信息:</dd></dl><dl><dd class=\"title\"><strong>"+orders.driver.mobile+"</strong></dd><dd>"+orders.driver.driverName+" <span>"+orders.driver.carNumber+"</span>"
          	    +" <span class=\"end\">"+renzheng(orders.driver.xszsfrz)+"</span></dd><dd>车型 <span>"+cartypeset(orders.driver.carType)+"</span><span>车长 </span> <span>"+carlengthset(orders.driver.carLength)+"</span></dd>"
          	    +"<dd>驾驶证 <span class=\"end\">"+renzheng(orders.driver.jszsfrz)+"</span></dd><dd>身份证 <span class=\"end\">"+renzheng(orders.driver.sfzsfrz)+"</span></dd>"
          	    +"<dd>信用 <span>拉货"+orders.driver.jhds+"笔 </span><span>装货率&nbsp"+orders.driver.zhl+"%</span> <span>交付率&nbsp"+orders.driver.jkl+"%</span></dd>"
          	    +"</dl><div class=\"bttn\"><button class=\"confirm\" onclick=\"agreeApply(this,'popdiv"+cargo.id+"','"+orders.id+"');\">同意</button>"
          	    +"<button class=\"cel\" onclick=\"xiangqing('xiangq"+orders.id+"');\"  >返回</button></div></div></li>";
			}
          	var tempno="";
          	if((cargo.ordersList).length<=0){
          		tempno="<div class=\"reminder\">暂无人申请</div>";
          	}
          	cargodriverhtml+="</ul>"+tempno+"</div>";
          	//}
            }
            $("#content").append(addhtml);
            $("#popdivset").append(cargodriverhtml);
           }
        }
	 } 
	 function popcheck(val){
			document.getElementById("popdiv"+val).style.display = "block";
			document.getElementById("opacity-bg").style.display = "block";
	 }
	 
function checkdetaok(pra,val){
	hidediv();
	if(pra==="0"){
		$("#apply1"+val+"").show(400);
	}else{
		$("#apply2"+val+"").show(400);
	}
}
function renzheng(val){
	temprenzheng="";
	if(val==10){
		temprenzheng="已认证";
	}else if(val==1){
		temprenzheng="认证中";
	}else if(val==2){
		temprenzheng="认证未通过";
	}else{
		temprenzheng="未认证";
	}
	return temprenzheng;
}

function cartypeset(val){
  	  var cartype="其它车型";
  	  if(val==0){
  		     cartype="其它车型";
    	  }else if(val==7){
    		 cartype="箱式车";
    	  }else if(val==11){
    		 cartype="高栏车";
    	  }else if(val==4){
    		 cartype="不限车型";
    	  }else{
    		 cartype="平板车";  
    	  }
  	 return cartype;
}
function carlengthset(val){
	  var carlength="其它车长";
	  if(val==0){
	  		carlength="其它车长";
	  	  }else if(val==1){
	  		carlength="9.6米";
	  	  }else if(val==2){
	  		carlength="12米";
	  	  }else if(val==4){
    		 cartype="不限车长";
    	  }else{
	  		carlength="17.5米";  
	  	  }
	  return carlength;
}
//同意申请
function agreeApply(obj,closeval,val){
	obj.style.display = "none";
	 var paras= {ordersId:val};
	 $.ajax({
         type: "POST",
         url: "/orders/agreeCargoTrade.htm",
         data:paras,
         datatype:"json",
         success: function(data)
         {
       	  var obj=eval('('+data+')'); 
       	  	if(obj.flag==1){
				        alert("同意拉货成功!");
				        document.getElementById(closeval).style.display = "none";
				    	document.getElementById("opacity-bg").style.display = "none";
				    	applyCargo();
				    	
				  	}else{
				  		obj.style.display = "";
				    	alert(obj.msg);
				    }
         }
         });
}
var temparrowI=1;
function xiangqing(val){
	$("#"+val+"").toggle();
	if(temparrowI==0){
	$("#arrowI").css("background",'url(http://192.168.2.50:8089/statics/images/look.png) no-repeat 0px 0px');
	temparrowI=1;
	}else{
	$("#arrowI").css("background",'url(http://192.168.2.50:8089/statics/images/look.png) no-repeat -7px 0px');	
	temparrowI=0;
	}
	
}

function closebox(val){
	document.getElementById(val).style.display = "none";
	document.getElementById("opacity-bg").style.display = "none";
}

function cancelapplyno(pra,val){
	if(pra==='0'){
		$("#apply1"+val+"").hide(400);
	}else{
		 var paras= {ordersId:val,cancelCause:0,remark:"无"};
		 $.ajax({
	          type: "POST",
	          url: "/ajax/drivercanelorder.htm",
	          data:paras,
	          datatype:"json",
	          success: function(data)
	          {
	        	  var obj=eval('('+data+')'); 
	        	  	if(obj.flag==1){
					        alert("取消交易成功!");
					  	}else{
					    	alert(obj.msg);
					    }
	          }
	          });
		
	}
}

function checkcancelok(pra,val){
	var tempval="";
	var causeM="";
	if(pra==="5"){
		tempval="确定交付投诉!?";
		causeM="货主交付投诉";
	}else if(pra==="6"){
		tempval="确定装货投诉!?";
		causeM="货主装货投诉";
	}else if(pra==="4"){
		tempval="确定取消投诉!?";
		causeM="货主取消投诉";
	}
	if (confirm(tempval))  {  
		 var paras= {ordersIdM:val,causeM:"货主投诉",tstype:pra};
		 $.ajax({
	          type: "POST",   
	          url: "/ajax/complainCargoer.htm",
	          data:paras,
	          datatype:"json",
	          success: function(data) { 
	        	  var obj=eval('('+data+')'); 
	        	  	if(obj.flag==1){
					        alert("操作成功!");
					        getoders();
					  	}else{
					    	alert(obj.msg);
					    }
	          }
	          });
		}
	
}
function cancelapplyyes(pra,val,cargoid,optime){
	if(pra==='0'){
		$("#apply2"+val+"").hide(400);
	}else{
		if($("#danjia"+val).val()!="" && $("#totle"+val).val()!="" && $("#dun"+val).val()!=""){
			 var paras= {cargoIdM:cargoid,orderIdM:val,operateTimeM:optime,unitPriceM:$("#danjia"+val).val(),countM:$("#dun"+val).val(),totalPriceM: $("#totle"+val).val()};
    		 $.ajax({
    	          type: "POST",   
    	          url: "/orders/driverUpdateapplye.htm",
    	          data:paras,
    	          datatype:"json",
    	          success: function(data)
    	          {  
    	        	  var obj=eval('('+data+')'); 
    	        	  	if(obj.flag==1){
    					        alert("修改申请成功!");
    					  	}else{
    					    	alert(obj.msg);
    					    }
    	          }
    	          });
		}else{
			alert("报价和重量都不能为空!");
		}
		
		
	}
}

//奇偶结果
function chk(num){ 
	  return num?num%2?"2":"1":"1" 
	} 
//翻页
function pagechange(obj,val,sizevals){
	 pagevar=val;
	 sizeval=sizevals;
	 if(typesearch==1){
		 getoders();//全部货源
	 }else if(typesearch==2)
	  {
		 applyCargo();//申请
	 }
}
//数组比较
function contains(arr, obj) {
    var i = arr.length;
    while (i--) {
        if (arr[i] === obj) {
            return true;
        }
    }
    return false;
}

function  upcargo(val){
	window.location.href="/cargo/cargoup.htm?cargoId="+val; 
}

//pagediv
function getPageList(pagesizemy){
	 $('#pagebar').empty();
	 //-4:首页;-1:上一页；-2：下一页；-3：尾页
	 var addhtmlpage="";
	 var pagevarInt=Number(pagevar);
	 if(pagesizemy>5){
	  // if(sizeval==-1){}else 
		/*if(sizeval==3){//准备换页数字
			 if()
		 }else if(sizeval==4){//省略号后面的..
			 
		 }*/
		 if(pagevarInt!=0){
		    addhtmlpage+="<ul><li class=\"home p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+0+"\',\'"+0+"\');return false;\">&nbsp&nbsp</a></li><li class=\"pgup p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-1)+"\',\'"+(pagevarInt-1)+"\');return false;\">&nbsp&nbsp</a></li>";//黑色todo:还未做
			}else{
		    addhtmlpage+="<ul><li class=\"home\"><a href=\"javascript:;\" ></a></li><li class=\"pgup\"><a href=\"javascript:;\" ></a></li>";//不是黑色	
			}

		 if(pagevarInt>=3 && (pagevarInt+2)<pagesizemy){
			//中部
			for (var i = 0; i <5; i++) {
				 if(i==0){
					  addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-2)+"\',\'"+(pagevarInt-2)+"\');return false;\">"+(pagevarInt-1)+"</a></li>";   
				 }else if(i==1){
						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-1)+"\',\'"+(pagevarInt-1)+"\');return false;\">"+(pagevarInt)+"</a></li>";  
				 }else if(i==2){
						 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+pagevarInt+"\',\'"+pagevarInt+"\');return false;\">"+(pagevarInt+1)+"</a></li>";  
				 }else if(i==3){
						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+1)+"\',\'"+(pagevarInt+1)+"\');return false;\">"+(pagevarInt+2)
						      +"</a></li><li class=\"excessive\"></li>";
				 }else{
					 if(pagesizemy>pagevarInt+7){
						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+6)+"\',\'"+(pagevarInt+6)+"\');return false;\">"+(pagevarInt+7)+"</a></li>";  
					 }else{
						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(Number(pagesizemy)-1)+"\',\'"+(Number(pagesizemy)-1)+"\');return false;\">"+pagesizemy+"</a></li>"; 
					 }
				 }
			}
			}else if(pagevarInt<3){
				for (var i = 0; i <5; i++) {
					 if(i==4){
						 if(pagesizemy>10){
   						 addhtmlpage+="<li class=\"excessive\"></li><li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+10+"\',\'"+10+"\');return false;\">"+10+"</a></li>";  
   					 }else{
   						 addhtmlpage+="<li class=\"excessive\"></li><li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">"+pagesizemy+"</a></li>"; 
   					 } 
					 }else{
					 if(i==sizeval || sizeval==-6){
	    				 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>"; 
	    				 sizeval=-1;
	    			 }else{
	    				 addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>";
	    			 }
					 }
  			}
			}else{//尾页
				addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-5)+"\',\'"+(pagevarInt-5)+"\');return false;\">"+(pagevarInt-4)+"</a></li>"+"<li class=\"excessive\"></li>"; 	
				addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-4)+"\',\'"+(pagesizemy-4)+"\');return false;\">"+(pagesizemy-3)+"</a></li>"; 	
				addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-3)+"\',\'"+(pagesizemy-3)+"\');return false;\">"+(pagesizemy-2)+"</a></li>"; 	
			    if((pagevarInt+1)==Number(pagesizemy)){
			    	addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-2)+"\',\'"+(pagesizemy-2)+"\');return false;\">"+(pagesizemy-1)+"</a></li>";
			    	addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+pagevarInt+"\',\'"+pagevarInt+"\');return false;\">"+pagesizemy+"</a></li>"; 	
			    }else{
			    	addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-2)+"\',\'"+(pagesizemy-2)+"\');return false;\">"+(pagesizemy-1)+"</a></li>";
			    	addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">"+pagesizemy+"</a></li>"; 	
			    }
			}
		 if(pagesizemy!=(pagevarInt+1)){
			 addhtmlpage+="<li class=\"end p_active\" ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+1)+"\',\'"+(pagevarInt+1)+"\');return false;\">&nbsp&nbsp</a></li><li class=\"pgdn p_active\"><a  href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">&nbsp&nbsp</a></li></ul>";//不是黑色	
			}else{
				 addhtmlpage+="<li class=\"end \" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn \"><a  href=\"javascript:;\"></a></li></ul>";//黑色todo:还未做
			}
	 }else{//少于5页
		 if(pagevarInt==0){
			 addhtmlpage+="<ul><li class=\"home \"><a href=\"javascript:;\" ></a></li><li class=\"pgup \"><a href=\"javascript:;\"  ></a></li>"; 
		 }else{
			 addhtmlpage+="<ul><li class=\"home  p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+0+"\',\'"+0+"\');return false;\">&nbsp&nbsp</a></li><li class=\"pgup p_active\"><a href=\"javascript:;\"  onClick=\"pagechange(this,\'"+(pagevarInt-1)+"\',\'"+(pagevarInt-1)+"\');return false;\">&nbsp&nbsp</a></li>";  
		 }
		 for (var i = 0; i < pagesizemy; i++) {
			 if(i==sizeval || sizeval==-6){
				 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>"; 
				 sizeval=-1;
			 }else{
				 addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>";
			 }
		}
		 if(pagesizemy==(pagevarInt+1)){
			 addhtmlpage+="<li class=\"end \" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn \"><a  href=\"javascript:;\" ></a></li></ul>";
		 }else{
			 addhtmlpage+="<li class=\"end p_active\" ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+1)+"\',\'"+(pagevarInt+1)+"\');return false;\">&nbsp&nbsp</a></li><li class=\"pgdn p_active\"><a  href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">&nbsp&nbsp</a></li></ul>";
		 }
		
	 }
	 $("#pagebar").append(addhtmlpage);
	 
}
</script>
</body>

</html>
  
    </#escape>
</#compress>