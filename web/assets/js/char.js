var path=$("#path").attr("path");
$(function() {
	var title = {
		text : '近12个月账单曲线图'
	};
	var subtitle = {
		text : 'CHANGEX'
	};
	var xAxis = {
		categories : [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月',
				'十月', '十一月', '十二月' ]
	};
	var yAxis = {
		title : {
			text : '金额 (\元)'
		},
		plotLines : [ {
			value : 0,
			width : 1,
			color : '#808080'
		} ]
	};

	var tooltip = {
		valueSuffix : '\元'
	}

	var legend = {
		layout : 'vertical',
		align : 'right',
		verticalAlign : 'middle',
		borderWidth : 0
	};

	var series = [
			{
				name : '近十二个月账单曲线',
				data : [ 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3,
						18.3, 13.9, 9.6 ]
			},
	 ];

	var json = {};
	json.title = title;
	json.subtitle = subtitle;
	json.xAxis = xAxis;
	json.yAxis = yAxis;
	json.tooltip = tooltip;
	json.legend = legend;
	json.series = series;
	$("#monthChart").highcharts(json);
});
$(function(){
	var title = {
			text : '近5年账单曲线图'
		};
		var subtitle = {
			text : 'Source: runoob.com'
		};
		var xAxis = {
			categories : [ '一月', '二月', '三月', '四月', '五月' ]
		};
		var yAxis = {
			title : {
				text : '金额 (\元)'
			},
			plotLines : [ {
				value : 0,
				width : 1,
				color : '#808080'
			} ]
		};

		var tooltip = {
			valueSuffix : '\元'
		}

		var legend = {
			layout : 'vertical',
			align : 'right',
			verticalAlign : 'middle',
			borderWidth : 0
		};

		var series = [
			
				{
					name : 'London',
					data : [ 3.9, 4.2, 5.7, 8.5, 11.9 ]
				} ];

		var json = {};
		json.title = title;
		json.subtitle = subtitle;
		json.xAxis = xAxis;
		json.yAxis = yAxis;
		json.tooltip = tooltip;
		json.legend = legend;
		json.series = series;
		$("#yearChart").highcharts(json);
});







