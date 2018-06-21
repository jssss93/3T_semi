<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table border="0" width="80%" height="800" align="center">
		<tr>
			<td colspan="4" height="50"></td>
		</tr>
		<tr>
			<td colspan="4" height="100"align="left"><h2>Recently 7 Day.</h2></td>
		</tr>
		<tr>
			<td colspan="4" height="15"></td>
		</tr>
		<tr height="450">
			<td id="container" width="300" height="550" colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" height="50"></td>
		</tr>
	</table>
</body>
<script language="JavaScript">

	
	$(document).ready(function() {
		
		// 태그써서 json 객체 가져오기 
		var jsonData = ${jsonData};
		console.log(jsonData);
		
		
		var datearr=[]
		var totalarr=[]
		
		for(key in jsonData) {
		    datearr.push(jsonData[key].date);
		}
		datearr.sort()

		for(key2 in jsonData) {
			totalarr.push(jsonData[key2].total);
		}		
		
		var title = {
			text : ''
		};

		var xAxis = {
			categories : datearr	
		};
		
		var yAxis = {
			title : {
				text : ' Won'
			},
			plotLines : [ {
				value : 0,
				width : 1,
				color : '#808080'
				
			} ]
		};

		var tooltip = {
			valueSuffix : 'WON'
		}

		var legend = {
			layout : 'vertical',
			align : 'right',
			verticalAlign : 'middle',
			borderWidth : 0
		};

		var series = [
				{
					name : '총 매출',
					data : totalarr
				} ];

		var json = {};

		json.title = title;
		json.xAxis = xAxis;
		json.yAxis = yAxis;
		json.tooltip = tooltip;
		json.legend = legend;
		json.series = series;

		$('#container').highcharts(json);
	});
</script>
</html>