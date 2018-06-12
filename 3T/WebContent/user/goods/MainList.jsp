<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/3T/user/notice/common/css/css.css"
	type="text/css">
</head>
<body>
	<table width="1100" border="0" height="300" align="center"
		cellpadding="0" cellspacing="3">
		<tr>
			<td colspan=3 align="center"><h2>New Item</h2><img src="/3T/upload/mainline.PNG"/></td>
		</tr>
		<tr>
			<s:iterator value="list1" status="stat1">
			
			<s:if test="#stat1.index 3 eq 0">
					
				</s:if>
			
				

				<s:url id="viewURL" action="GoodsView">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url>

				


					<td width="100" height="200" align="center"><s:a
							href="%{viewURL}">
							
							<img src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>" width="350"
								height="200">   
						</s:a></td>

			</s:iterator>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<table width="1100" border="0" align="center" cellpadding="0"
		cellspacing="10">

		<tr>
			<td colspan="3" align="center"><h2>new item</h2>----------------------------</td>
		</tr>
		<tr>
		<tr>

			<s:iterator value="list" status="stat">
			
			<s:if test="#stat.index % 3 eq 0">
					<tr></tr>
				</s:if>
			
				

				<s:url id="viewURL" action="GoodsView">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url>

				


					<td width="150" height="400" align="center"><s:a
							href="%{viewURL}">
							
							<img src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>" width="350"
								height="400">
						</s:a><br> <s:property value="goods_name" /><br> \&nbsp;<s:property
							value="goods_price" />
							
							</td>

			</s:iterator>

			

		</tr>
	</table>
	<br>
	<br>
	<br>
	<table width="1100" border="1" height="300" align="center"
		cellpadding="0" cellspacing="10">
		<tr height="200">
			<td colspan="3" align="center"><h1>3t3t3t</h1></td>
		</tr>
	</table>

	<br>
	<br>
	<br>
	<table width="1100" border="0" height="300" align="center"
		cellpadding="0" cellspacing="10">
		<tr>
			<td colspan=3 align="center"><h2>best</h2> <br>------------------------</td>
		</tr>

		<tr>
		<s:iterator value="list2" status="stat2">
			
			<s:if test="#stat2.index % 3 eq 0">
					<tr></tr>
				</s:if>
			
				

				<s:url id="viewURL" action="GoodsView">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url>

				


					<td width="150" height="400" align="center"><s:a
							href="%{viewURL}">
							
							<img src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>" width="350"
								height="400">
						</s:a><br> <s:property value="goods_name" /><br> \&nbsp;<s:property
							value="goods_price" />
							
							</td>

			</s:iterator>
		
	</table>

</body>
</html>