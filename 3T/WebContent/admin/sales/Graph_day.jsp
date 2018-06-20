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
			<td colspan="4" height="100" align="left"><h2>Order Graph
					(Day)</h2></td>
		</tr>
		<tr>
			<td colspan="4" height="15"></td>
		</tr>
		<tr height="450">
			<td id="container" width="300" height="700" colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" height="50"></td>
		</tr>
	</table>
</body>
<script language="JavaScript">
	$(function() {
		$('.click-btn')
			.click(
				function() { //push��ư�� Ŭ���ϸ� �������� �����ϰ� ajax����!
					var ids = $(this).parent().attr("id");
					var sfl = "���۽�ų����1";
					var stx = "���۽�ų����2";
					var tot = "���۽�ų����3";
					//alert(ID);
					$.ajax({ //ajax start!
						type : "POST", //���۹�� POST�� GET �߿� �ϳ�
						url : "./ajax.test.php", //ajax�� ������ ���� ���
						data : {
									"tot" : tot,
									"sfl" : sfl,
									"stx" : stx
								}, //���۹���� POST�� ��쿡 ������ �����͵��� �������ش�
									dataType : "json",
									cache : false,
									success : function(data) { //���ۼ���!
									console.log(data); //�ܼ�â�� ������ ����(�迭 �����Ͱ� ��µ�)
									var htmls = "";
									data.forEach(function(element,indes, array) {
											htmls += "<a href='"+element.urls+"'><article class='mo-index-tab-content-in'><span class='mo-index-tab-content-in-condition'>"
											+ element.istatus+ "</span>";
											htmls += "<div class='mo-index-tab-content-in-star'>";
											htmls += star+ "</div>";
											htmls += "<p class='mo-index-tab-content-in-gu'>"+ element.addr+ "</p><p class='mo-index-tab-content-in-name'>"
													+ element.ca_name+ "</p>";
											htmls += "<p class='mo-index-tab-content-in-description'>"	+ element.wr_subject+ "</p><span class='mo-index-tab-review'>���� : <b>"
													+ element.comment+ "</b></span>";
											htmls += "<img src='"+element.img+"' alt='��õ����Ʈ' /></article></a>";
									});
						$(".morebox").before(htmls);
							if (tot > nextID) {
								$(".morebox").attr("id","more" + nextID); //���� limit �ɾ��� ���� ��ưid�� �������ֱ�
							} else {
								$(".morebox").remove();
							}
						}
					});
			});
	});

	$(document).ready(
			function() {
				var title = {
					text : ''

				};

				var xAxis = {
					title : {
						text : '(Day)'
					},
					categories : [ '2018/06/19', '2', '3', '4', '5', '6', '7',
							'8', '9', '10', '11', '12', '13', '14', '15', '16',
							'17', '18', '19', '20', '21', '22', '23', '24',
							'25', '26', '27', '28', '29', '30' ]
				};
				var yAxis = {
					title : {
						text : 'Won'
					},
					plotLines : [ {
						value : 0,
						width : 1,
						color : '#808080'
					} ]
				};

				var tooltip = {
					valueSuffix : 'Won'
				}

				var legend = {
					layout : 'vertical',
					align : 'right',
					verticalAlign : 'middle',
					borderWidth : 0
				};

				var series = [
						{
							name : 'ACC',
							data : [ 70000, 69000, 95000, 145000, 182000,
									215000, 252000, 265000, 233000, 183000,
									139000, 96000, 1111111 ]
						},
						{
							name : 'shoes',
							data : [ 111000, 80000, 57000, 11300, 170000,
									220000, 248000, 241000, 201000, 141000,
									86000, 25000, 1111111 ]
						},
						{
							name : 'Shirt',
							data : [ 30900, 42000, 57000, 85000, 119000, 15200,
									170000, 166000, 142000, 103000, 66000,
									48000, 1111111 ]
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