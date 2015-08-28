<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>数据引擎--货主数据</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
      <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/data_engine.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/common.js"></script>
</head>

<body>
    <div class="header">
        <div class="head">
            <div class="logo"><a href="#"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a></div>
        </div>
    </div>
    <div class="content ">
        <div class="main clearfix">
        <#include "common/leftbar.ftl">
            <div class="rside">
                <div class="table">
                    <div class="chose  clearfix">
                        <ul class="chose_item clearfix">
                                                    
   
							<#if Session["数据引擎-司机"]==1><li id="user" ><a href="/datauser.htm">司机 </a></li></#if> 
							<li class="l_side chose_active" id="complain"><a href="/datashipper.htm">企业</a></li>
						    <#if Session["数据引擎-交易"]==1><li class="l_side " id="user"><a href="/dataorders.htm">交易</a></li></#if> 
							 <#if Session["数据引擎-货源"]==1><li class="l_side " id="complain"><a href="/datacargo.htm">货源</a></li></#if> 
							  <#if Session["数据引擎-金融"]==1><li class="l_side" id="user"><a href="/databank.htm">金融</a></li></#if> 
							
                        </ul>
                    </div>
                  <div class="data" >
                      <h3  style="margin-bottom:0;">货主数据</h3 >
                    <div class="data_img">
           <div id="main" align=left style="height:300px;width: 430px;float:left;"></div>
<div id="main1" align=center style="height:300px;width: 430px;float:left;"></div>
<div id="main2" align=right style="height:300px;width: 890px;"></div>
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
        <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
        <script type="text/javascript">
        $(document).ready(function () {
      	  $(".li_3").addClass("active");
          $("#page").val('${page}');
      });
        // 路径配置
        require.config({
        	 paths:{   
        	      echarts: 'http://192.168.2.50:8089/statics/build/dist'
             }  
        });
        // 货主分布
        require(
            [
                 'echarts',
                  'echarts/chart/pie',
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                option = {
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    title : {
                	        text: '货主分布',
                	        x:'center'
                	    },
                	    legend: {
                	    	  orient : 'horizontal',
                	          x : 'center',
                	          y : 'bottom',
                	        data:['成都']
                	    },
                	    toolbox: {
                	        show : false,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: true, 
                	                type: ['pie', 'funnel'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'center',
                	                        max: 1548
                	                    }
                	                }
                	            },
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    series : [
                	        {
                	            name:'货主分布',
                	            type:'pie',
                	            radius : ['50%', '70%'],
                	            itemStyle : {
                	                normal : {
                	                    label : {
                	                        show : false
                	                    },
                	                    labelLine : {
                	                        show : false
                	                    }
                	                },
                	                emphasis : {
                	                    label : {
                	                        show : true,
                	                        position : 'center',
                	                        textStyle : {
                	                            fontSize : '30',
                	                            fontWeight : 'bold'
                	                        }
                	                    }
                	                }
                	            },
                	            data:[{value:100, name:'成都'}]
                	        }
                	    ]
                	};
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
        // 发运量
        require(
            [
                 'echarts',
                  'echarts/chart/pie',
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main1')); 
                
                option = {
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    title : {
                	        text: '发运量',
                	        x:'center'
                	    },
                	    legend: {
                	    	  orient : 'horizontal',
                	          x : 'center',
                	          y : 'bottom',
                	        data:['0笔','1-10笔','10-50笔','50-200笔','200笔以上']
                	    },
                	    toolbox: {
                	        show : false,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: true, 
                	                type: ['pie', 'funnel'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'center',
                	                        max: 1548
                	                    }
                	                }
                	            },
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    series : [
                	        {
                	            name:'发运量',
                	            type:'pie',
                	            radius : ['50%', '70%'],
                	            itemStyle : {
                	                normal : {
                	                    label : {
                	                        show : false
                	                    },
                	                    labelLine : {
                	                        show : false
                	                    }
                	                },
                	                emphasis : {
                	                    label : {
                	                        show : true,
                	                        position : 'center',
                	                        textStyle : {
                	                            fontSize : '30',
                	                            fontWeight : 'bold'
                	                        }
                	                    }
                	                }
                	            },
                	            data:eval(${orderingStr})
                	        }
                	    ]
                	};
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );    	
 
        // 当前状态
        require(
            [
                 'echarts',
                  'echarts/chart/bar',
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main2')); 
                
                option = {
                	    title : {
                	        text: '当前状态',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    legend: {
                	    	  orient : 'horizontal',
                	          x : 'center',
                	          y : 'bottom',
                	        data:['发运中','空闲']
                	    },
                	    toolbox: {
                	        show : false,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : ['成都']
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value'
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'发运中',
                	            type:'bar',
                	            data:eval(${shipperStarting}),
                	        },
                	        {
                	            name:'空闲',
                	            type:'bar',
                	            data:eval(${shippersstop}),
                	        }
                	    ]
                	};
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );   	                    
    </script>
</body>

</html>
