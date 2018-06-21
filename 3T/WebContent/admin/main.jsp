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
						<td width="200" align="center">ID[등급]</td>
						<td width="200" align="center">회원 이름</td>
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
						<td width="200" align="center">ID[등급]</td>
						<td width="200" align="center">회원 이름</td>
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