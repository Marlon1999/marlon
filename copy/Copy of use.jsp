<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/common/header.jspf"%>

<title>天行数科账单管理系统</title>
</head>
<body>
<div id="use">
    <div class="container_zhe">
        <ul>
			<li><a href="${basePath}select.action">我要查看余额</a></li>
			<li><a href="${basePath}money.action">我要查看账单详情</a></li>
		</ul>
		<a class="tx-back" href="${basePath}index.action">返回目录页</a>
        <div class="input">
			<label for="start">开始时间<input type="date" id="start"
						class="start" value="" /></label> <label for="end">结束时间<input
						type="date" id="end" class="end" value="" /></label>
			<button id="search">查询</button>
		</div>
        <div class="month" id="month"></div>
        <div class="total" id="total"></div>
    </div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.2.3/echarts.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		monthChart.showLoading();
		totalChart.showLoading();	    
	    var nowdays = new Date();
	    var year = nowdays.getFullYear();
	    var month = nowdays.getMonth();
	    if(month==0)
	    {
	        month=12;
	        year=year-1;
	    }
	    if (month < 10) {
	        month = "0" + month;
	    }
	    var firstDay = year + "-" + month + "-" + "01";//上个月的第一天
	    var myDate = new Date(year, month, 0);
	    var lastDay = year + "-" + month + "-" + myDate.getDate();//上个月的最后一天
	    $("#start").val(firstDay);
	    $("#end").val(lastDay);
		var startTime=firstDay;
		var endTime=lastDay;
		var namearr =new Array();
		var totalarr =new Array();
		$.getJSON("totalbyapi.action",{startTime:startTime,endTime:endTime},function(arr){
			for(var i=0;i<arr.length;i++){
				var obj =arr[i];
				namearr[i]=obj.name;
				totalarr[i]=obj.total;
				console.log(obj);
			}
			totalChart.hideLoading();
			totalChart.setOption({
				yAxis:{
					data:namearr
				},
				series:{
					data:totalarr
				}
			});
		});
		var totalarr1=new Array();
		var datearr =new Array();
		$.getJSON("totalbymonth.action",{},function(arr){
			for(var i=0;i<arr.length;i++){
				var obj=arr[i];
				totalarr1[i]=obj.total;
				datearr[i]=obj.date;
			}
			monthChart.hideLoading();
			monthChart.setOption({
				xAxis:{
					data:datearr
				},
				series:{
					data:totalarr1
				}
			})
		});
		
		$("#search").click(function(){
			var startTime=$("#start").val();
			var endTime=$("#end").val();
			totalChart.showLoading();
			var namearr =new Array();
			var totalarr =new Array();
			$.getJSON("totalbyapi.action",{startTime:startTime,endTime:endTime},function(arr){
				for(var i=0;i<arr.length;i++){
					var obj =arr[i];
					namearr[i]=obj.name;
					totalarr[i]=obj.total;
				}
				totalChart.hideLoading();
				totalChart.setOption({
					yAxis:{
						data:namearr
					},
					series:{
						data:totalarr
					}
				});
			});
		});
	});
	
	
    var totalChart = echarts.init(document.getElementById('total'));
     totalChart.setOption({
    		color: ['#3398DB'],
            tooltip: {
                trigger: 'axis',
                axisPointer: { 
                    type: 'shadow'
                }
            },
            grid: {
            	top:10,
                left:170
            },
            xAxis: {
            	
            },
            yAxis: {
            	data:[],
            	 axisLabel:{
                  interval:0 
                }
            },
            series: [{
            	itemStyle:{normal:{label:{show:true,position:'right'}}},
                name: '使用量',
                type: 'bar',
                barWidth: '40%',
                data: []
            }]
        });
   var monthChart =echarts.init(document.getElementById('month'));
   monthChart.setOption({
	   color:['#3398DB'],
	   tooltip: {
           trigger: 'axis',
           axisPointer: { 
               type: 'shadow'
           }
       },
       grid: {
       },
       xAxis: {
    	   data: [],
    	   axisLabel:{
               interval:0, 
               rotate:20
             }
       },
       yAxis: {},
       series: [{
    	   itemStyle:{normal:{label:{show:true,position:'top'}}},	
           name: '使用量',
           type: 'bar',
           barWidth: '40%',
           data: []
       }]
   });
</script>
</body>
</html>