var path = $("#path").attr("path");
$(function() {
	$(".chartBtn").click(
			function() {
				$.ajax({
					url:path+"/chart.do?opr=dateChart",
					dateType:"json",
					success:function(data){
						var categories=new Array();
						/*var y=new Array();*/
						var points=new Array();
						var realMoney=new Array();
						for ( var i = 0; i < data.length; i++) {
							categories[i]=data[i].todayDate;
							/*y[i]=data[i].realMoney;*/
							points[i]=data[i].totalMoney;
							realMoney[i]=data[i].realMoney;
						}
						/*y.sort(function(a,b){return a-b});*/
						var title = {
								text : '近30天账单曲线图'
							};
							var subtitle = {
								text : 'CHANGEX'
							};
							var xAxis = {
								categories :categories
							};
							var yAxis = {
								title : {
									text : '金额 (\元)'
								}
							};

							var tooltip = {
								valueSuffix : '\元'
							}

							var legend = {
								layout : 'vertical',
								align : 'right',
								verticalAlign : 'middle',
								borderWidth : 1
							};

							var series = [
							{
								name : '实际收入',
								data :points
							},{
								name : '总消费',
								data :realMoney
							} ];

							var json = {};
							json.title = title;
							json.subtitle = subtitle;
							json.xAxis = xAxis;
							json.yAxis = yAxis;
							json.tooltip = tooltip;
							json.legend = legend;
							json.series = series;
							$("#dateChart").highcharts(json);
							$("#dateChartModal").modal("show");
					}
				});
			});

});