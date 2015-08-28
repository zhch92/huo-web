<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>短信批量发送</title>
	<script type="text/javascript" src="http://www.yunpian.com/static/js/common/jquery-1.8.1.min.js"></script>
    
</head>

<body>

<div style="text-align:center;">
 <br/><br/>电话号码：<br/><br/>
 [提示:多个电话号码用英文逗号(,)隔开]
 <br/>
 <textarea id="sendphones" style="width:800px;height:200px;"></textarea>  
</div>

<!-- <div style="text-align:center;">
 <br/><br/>发送的短信内容：<br/><br/>
 <textarea id="sendcontent" style="width:800px;height:200px;"></textarea>  
</div> -->
<div style="text-align:center;">
  <button onclick="sendSMS()">发送</button>
</div>
<script type="text/javascript">
function sendSMS(){
  //alert($("#sendphones").val());
// alert($("#sendcontent").val());
	$.ajax({  
        url:"/ajax/sendBaSMS.htm",  
        type:"post", 
        data:{sendphones:$("#sendphones").val(),sendcontent:"货管家，免费为司机提供可靠货源。联系电话028-61793885，找货地址：成都市物流大道38号门市（农行ATM旁20米）"},
        dataType:"json",
        success:function(data) { 
        	
      		if(data.flag==1){
      			alert(data.msg);
      		}else{
      			alert(data.msg);
      		}
        },error:function(data) {  
            alert("系统繁忙或未登录，请稍后再试或登录");  
        }  
    });
}

</script>
</body>

</html>
