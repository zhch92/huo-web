<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>运营报表_货管家管理后台</title>
    <link href="/css/admin.css" type="text/css" rel="stylesheet"/>
    <link href="/css/oyes.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" language="javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/jquery.easing.min.js"></script>
    <script type="text/javascript" language="javascript" src="/js/jquery.flyout-1.2.js"></script>
    <script language="javascript" type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <style type="text/css">
        #myform input {
            width: 90%;
        }

        #myform select {
            width: 90%;
        }
        
        #mytable td {
            height: 0px;
        }
        
        .money{
            height: 0px;
            font-size:16px;
        }
        .hgjtitle{
            line-height: 50px;
			font-size: 25px;
			font-family: "微软雅黑";
			margin-left: 10px;
        }
        .hgjtime{
            margin: 60px 17px 0px;
            float:right;
        }
        .hgjnum{
            font-size: 16px;
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
				运营报表
				<form style="float:right;" action="${queryUrl}" id="myform1" method="get">
                	<label>开始时间：<input name="startTime" class="Wdate"  id="startTime" type="text" onClick="WdatePicker()"  value='${startTime}'></label>&nbsp;&nbsp;&nbsp;
					<label>结束时间：<input name="endTime" class="Wdate"  id="endTime" type="text" onClick="WdatePicker()" value="${endTime}"></label>&nbsp;&nbsp;&nbsp;
					<input style="margin-left: 10px" id="clearparams" type="button" value="清除条件" />
        			<input type="submit" value="查 询" />
    			</form>
            </div>
            <div class="rightok">
                	<table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
                       
                        <tbody>
                        	<tr>
	                            <td colspan="5" style="border-bottom: 2px soild;" >
	                            	<font class="hgjtitle">货管家数据报表</font>
	                            	<div id="timedis" class="hgjtime" >2014/08/24   19：36</div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td width="5%">
                            		司机用户总数：<font class="hgjnum">${hgjUserReports['drivers']!0}</font><br/><br/>
                            		认证数：<font class="money" style="color:red">${hgjUserReports['rzdrivers']!0}</font>&nbsp;<br/>
                            		认证比例：<font class="money" style="color:red">${reportMaps['authDriverPerc']!0}</font>&nbsp;
	                            </td>
	                            <td width="5%">
	                            	企业注册用户总数：<font class="hgjnum">${hgjUserReports['companys']!0}</font><br/><br/>
	                            	认证数：<font class="money" style="color:red">${hgjUserReports['rzcompanys']!0}</font>&nbsp;<br/>
	                            	认证比例：<font class="money" style="color:red">${reportMaps['authCompanyPerc']!0}</font>
	                            </td>
	                            <td width="5%">
	                            	订单总述数：<font class="hgjnum">${ordersReports['orders']!0}</font><br/><br/><br/><br/><br/>
	                            </td>
	                            <td width="5%">
	                            	成交总吨数：<font class="hgjnum">${(ordersReports['weighttotal']!0)+(ordersReports['squareweighttotal']!0)}</font><br/><br/><br/><br/><br/>
	                            </td>
	                            <td width="5%">
	                            	APP装机量：<font class="hgjnum">&nbsp;--</font><br/><br/><br/><br/><br/>
	                            </td>
	                        </tr>
	                        
	                        
	                        
                        </tbody>
                    </table>
                    
                    <#--用户行为 -->
                    <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
	                        <thead>
		                        <tr>
		                            <td style="background: #eee;height:25px;font-family:微软雅黑;font-weight:bold;font-size:15px;" colspan="3" >
		                            	用户行为&nbsp;
		                            </td>
		                        </tr>
			                    <tr>
			                        <th nowrap="nowrap" width="5%">编号</th>
			                        <th nowrap="nowrap" width="15%">指标名称</th>
			                        <th nowrap="nowrap">数值</th>
			                    </tr>
		                    </thead>
	                        <tbody>
	                        <tr>
	                            <td nowrap="nowrap" >1</td>
	                            <td nowrap="nowrap" >新增用户数</td>
	                            <td nowrap="nowrap"><font class="money">${userActionReports['newUsers']!0}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >2</td>
	                            <td nowrap="nowrap" >网站登陆用户数</td>
	                            <td nowrap="nowrap"><font class="money">${userActionReports['currLoginUsers']!0}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >3</td>
	                            <td nowrap="nowrap" >手机登陆用户数</td>
	                            <td nowrap="nowrap"><font class="money">&nbsp;--</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >4</td>
	                            <td nowrap="nowrap" >7天用户留存率</td>
	                            <td nowrap="nowrap"><font class="money">&nbsp;--&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >5</td>
	                            <td nowrap="nowrap" >新增装机量</td>
	                            <td nowrap="nowrap"><font class="money">&nbsp;--&nbsp;</font></td>
	                        </tr>
	                        </tbody>
	                    </table>
	                    
	                    
	                    <#--交易概况 -->
	                    <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
	                        <thead>
		                        <tr>
		                            <td style="background: #eee;height:25px;font-family:微软雅黑;font-weight:bold;font-size:15px;" colspan="3" >
		                            	交易概况&nbsp;</td>
		                        </tr>
			                    <tr>
			                        <th nowrap="nowrap"  width="5%">编号</th>
			                        <th nowrap="nowrap"  width="15%">指标名称</th>
			                        <th nowrap="nowrap">数值</th>
			                    </tr>
		                    </thead>
	                        <tbody>	
	                        <tr>
	                            <td nowrap="nowrap" >1</td>
	                            <td nowrap="nowrap" >新增订单数</td>
	                            <td nowrap="nowrap"><font class="money">${ordersReports['newOrders']!0}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >2</td>
	                            <td nowrap="nowrap" >支付保证金的订单数</td>
	                            <td nowrap="nowrap"><font class="money">${ordersReports['bzjOrders']!0}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >3</td>
	                            <td nowrap="nowrap" >在途订单数</td>
	                            <td nowrap="nowrap"><font class="money">${ordersReports['ztOrders']!0}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >4</td>
	                            <td nowrap="nowrap" >待收货订单数</td>
	                            <td nowrap="nowrap"><font class="money">${ordersReports['dshOrders']!0}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >5</td>
	                            <td nowrap="nowrap" >异常订单数</td>
	                            <td nowrap="nowrap"><font class="money">${ordersReports['disputeOrders']!0}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >6</td>
	                            <td nowrap="nowrap" >纠纷订单数</td>
	                            <td nowrap="nowrap"><font class="money">${ordersReports['disingOrders']!0}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >7</td>
	                            <td nowrap="nowrap" >已完成交易订单数</td>
	                            <td nowrap="nowrap"><font class="money">${ordersReports['orders']!0}&nbsp;</font></td>
	                        </tr>
	                        </tbody>
	                    </table>
	                    
	                    <#--资金汇总 -->
	                    <table id="mytable" style="border-left: none;word-break:break-all;" cellpadding="0" cellspacing="0">
	                        <thead>
		                        <tr>
		                            <td style="background: #eee;height:25px;font-family:微软雅黑;font-weight:bold;font-size:15px;" colspan="3" >
		                            	资金汇总&nbsp;</td>
		                        </tr>
			                    <tr>
			                        <th nowrap="nowrap" width="5%">编号</th>
			                        <th nowrap="nowrap" width="15%">指标名称</th>
			                        <th nowrap="nowrap">数值(元)</th>
			                    </tr>
		                    </thead>
	                        <tbody>	
	                        <tr>
	                            <td nowrap="nowrap" width="5%" >1</td>
	                            <td nowrap="nowrap" width="15%" >司机帐户余额</td>
	                            <td nowrap="nowrap"><font class="money">${(moneyReports['driverstotal']!0/100)?string("##0.##")}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >2</td>
	                            <td nowrap="nowrap" >司机保证金总额</td>
	                            <td nowrap="nowrap"><font class="money">${(moneyReports['driverdeposittotal']!0/100)?string("##0.##")}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >3</td>
	                            <td nowrap="nowrap" >企业备付金总额</td>
	                            <td nowrap="nowrap"><font class="money">${(moneyReports['companymoney']!0/100)?string("##0.##")}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >4</td>
	                            <td nowrap="nowrap" >企业保证金总额</td>
	                            <td nowrap="nowrap"><font class="money">&nbsp;--</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >5</td>
	                            <td nowrap="nowrap" >在途运费</td>
	                            <td nowrap="nowrap"><font class="money">${(moneyReports['freight']!0/100)?string("##0.##")}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >6</td>
	                            <td nowrap="nowrap" >提现总金额</td>
	                            <td nowrap="nowrap"><font class="money">${(moneyReports['withdrawtotal']!0/100)?string("##0.##")}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >7</td>
	                            <td nowrap="nowrap" >成功交易总额</td>
	                            <td nowrap="nowrap"><font class="money">${(ordersReports['successMoneyTotal']!0/100)?string("##0.##")}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >8</td>
	                            <td nowrap="nowrap" >交易吨数</td>
	                            <td nowrap="nowrap"><font class="money">${((ordersReports['onOrdersWeight']!0)+(ordersReports['onOrdersSquareWeight']!0))?string("##0.##")}&nbsp;</font></td>
	                        </tr>
	                        <tr>
	                            <td nowrap="nowrap" >9</td>
	                            <td nowrap="nowrap" >纠纷总额</td>
	                            <td nowrap="nowrap"><font class="money">${(moneyReports['disputetotal']!0/100)?string("##0.##")}&nbsp;</font></td>
	                        </tr>
	                        </tbody>
	                    </table>

            </div>
        </div>
        <div class="clear"></div>
    </div>
<#include "common/bottom.ftl">
</div>
<script type="text/javascript">


//获得当前时间,刻度为一千分一秒
var initializationTime=(new Date()).getTime();
function showLeftTime()
{
	var now=new Date();
	var week;
    switch (now.getDay()){
        case 1: week="星期一"; break;
        case 2: week="星期二"; break;
        case 3: week="星期三"; break;
        case 4: week="星期四"; break;
        case 5: week="星期五"; break;
        case 6: week="星期六"; break;
        default: week="星期天";
    }
	var year=now.getFullYear();
	var month = add_zero(now.getMonth()+1);
    var days = add_zero(now.getDate());
    var hours = add_zero(now.getHours());
    var minutes = add_zero(now.getMinutes());
    var seconds=add_zero(now.getSeconds());
	var showHtml=""+year+"年"+month+"月"+days+"日 "+hours+":"+minutes+":"+seconds+" "+week;
	$("#timedis").text(showHtml);
	//一秒刷新一次显示时间
	var timeID=setTimeout(showLeftTime,1000);
};
function add_zero(temp)
{
    if(temp<10) return "0"+temp;
    else return temp;
}

	
$(document).ready(function () {
	$('#biuuuu a').flyout();
	showLeftTime();
	
    $("#startTime,#endTime").change(function () {
        $("#page").val('');
    });

    $("#clearparams").click(function () {
        $("#startTime").val('');
        $("#endTime").val('');
    });

    $("#mytable").find("td").mouseenter(function () {
        $(this).parent("tr").find("td").css("background", "#fafafa");
    });

    $("#mytable").find("td").mouseleave(function () {
        $(this).parent("tr").find("td").css("background", "#fff");
    });
    
});

</script>
</body>
</html>