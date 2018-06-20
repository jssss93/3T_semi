<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<title>Insert title here</title>
</head>
<style>
#myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

#myImg:hover {
	opacity: 0.7;
}
</style>
<body>
	<table border="0" width="80%" align="center">
		<tr>
			<td colspan="4" height="50"></td>
		</tr>
		<tr>
			<td colspan="4" align="left"><h2>Order Graph</h2></td>
		</tr>
		<tr>
			<td colspan="4" height="15"></td>
		</tr>
		<tr height="450">
			<td id="container" width="300" height="200" colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" height="100"></td>
		</tr>
		<tr>
			<td colspan=4 align="left"><h2>BEST GOODS</h2></td>
		</tr>
		<tr>
			<td colspan="4" height="15"></td>
		</tr>

		<tr height="300">
			<s:iterator value="list_goods_best" status="stat">

				<s:if test="#stat.index 4 eq 0">

				</s:if>

				<s:url id="viewURL" action="AG_View.action">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url>

				<td width="300" height="300" align="center"><s:a
						href="%{viewURL}">

						<img id="myImg"
							src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>"
							width="250" height="250">

					</s:a><br> <s:property value="goods_name" /><br> \&nbsp;<s:property
						value="goods_price" /></td>

			</s:iterator>
		</tr>
		<tr>
			<td colspan="4" height="100"></td>
		</tr>
		<tr>
			<td colspan="4" align="left"><h2>NEW GOODS</h2></td>
		</tr>
		<tr>
			<td colspan="4" height="15"></td>
		</tr>

		<tr height="300">
			<s:iterator value="list_goods_new" status="stat">

				<s:if test="#stat.index 4 eq 0">

				</s:if>

				<s:url id="viewURL" action="AG_View.action">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url>

				<td width="300" height="300" align="center"><s:a
						href="%{viewURL}">

						<img id="myImg"
							src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>"
							width="250" height="250">

					</s:a><br> <s:property value="goods_name" /><br> \&nbsp;<s:property
						value="goods_price" /></td>

			</s:iterator>
		</tr>
		<tr>
			<td colspan="4" height="100" align="right"><input type="button"
				value=">상품 더보기" onClick="javascript:location.href='AG_List.action?'"></td>
		</tr>

		<tr height="300">


			<td colspan="2" align="left"><h2>VIP Member.</h2>
				<table border="0" align="center">

					<tr>
						<td width="200" align="center">ID[이름]</td>
						<td width="200" align="center">회원 등급</td>
						<td width="200" align="center">구매금액(누적)</td>
					</tr>
					<tr bgcolor="#777777">
						<td height="1" colspan="8"></td>
					</tr>

					<tr>
						<s:iterator value="list_member_best" status="stat">
							<s:url id="viewURL" action="AM_View">
								<s:param name="m_no">
									<s:property value="m_no" />
								</s:param>
							</s:url>
					</tr>

					<tr>

						<td align="center"><s:a href="%{viewURL}">
								<s:property value="m_id" />
								<br>[
								<s:if test="m_admin==0">ADMIN</s:if>
								<s:elseif test="m_admin==1">SILVER</s:elseif>
								<s:elseif test="m_admin==2">GOLD</s:elseif>
								<s:elseif test="m_admin==3">VIP</s:elseif>
								]
							</s:a></td>
						<td align="center"><s:a href="%{viewURL}">
								<s:property value="m_name" />
							</s:a></td>
						<td align="center"><s:property value="m_total" /></td>
					</tr>

					<tr bgcolor="#777777">
						<td height="1" colspan="8"></td>
					</tr>

					</s:iterator>

				</table></td>
			<td colspan="2" align="left"><h2>New Member.</h2>
				<table border="0" align="center">

					<tr>
						<td width="200" align="center">ID[이름]</td>
						<td width="200" align="center">회원 등급</td>
						<td width="200" align="center">구매금액(누적)</td>
					</tr>
					<tr bgcolor="#777777">
						<td height="1" colspan="8"></td>
					</tr>
					<tr>
						<s:iterator value="list_member_new" status="stat">
							<s:url id="viewURL" action="AM_View">
								<s:param name="m_no">
									<s:property value="m_no" />
								</s:param>
							</s:url>
					</tr>

					<tr>

						<td align="center"><s:a href="%{viewURL}">
								<s:property value="m_id" />
								<br>[
								<s:if test="m_admin==0">ADMIN</s:if>
								<s:elseif test="m_admin==1">SILVER</s:elseif>
								<s:elseif test="m_admin==2">GOLD</s:elseif>
								<s:elseif test="m_admin==3">VIP</s:elseif>
								]
							</s:a></td>
						<td align="center"><s:a href="%{viewURL}">
								<s:property value="m_name" />
							</s:a></td>
						<td align="center"><s:property value="m_total" /></td>
					</tr>

					<tr bgcolor="#777777">
						<td height="1" colspan="8"></td>
					</tr>

					</s:iterator>

				</table></td>

		</tr>
		<tr>
			<td colspan="4" height="50" align="right"><input type="button"
				value=">회원 더보기" onClick="javascript:location.href='AM_List.action?'">
			</td>
		</tr>
	</table>
</body>
<script language="JavaScript">


	$(document).ready(
			function() {
				var title = {
					text : '일별 매출'
				};

				var xAxis = {
					categories : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'10' ]
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
					valueSuffix : '\xB0C'
				}

				var legend = {
					layout : 'vertical',
					align : 'right',
					verticalAlign : 'middle',
					borderWidth : 0
				};

				var series = [
						{
							name : 'Tokyo',
							data : [ 7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2,
									26.5, 23.3, 18.3, 13.9, 9.6 ]
						},
						{
							name : 'New York',
							data : [ -0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8,
									24.1, 20.1, 14.1, 8.6, 2.5 ]
						},
						{
							name : 'London',
							data : [ 3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0,
									16.6, 14.2, 10.3, 6.6, 4.8 ]
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