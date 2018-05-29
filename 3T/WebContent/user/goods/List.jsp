<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	<table width="1100" border="1" height="300" align="center"
		cellpadding="0" cellspacing="3">
		<tr>
			<td colspan=3 align="center"><h2>3t3t3t</h2>3t3t3t3t3t3t3t3t<br>------------------------</td>
		</tr>
		<tr>
			<td width="100" height="200"></td>
			<td width="100" height="200"></td>
			<td width="100" height="200"></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<table width="1100" border="1" align="center" cellpadding="0"
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
			
				

				<s:url id="viewURL" action="viewAction">
					<s:param name="no">
						<s:property value="goods_no" />
					</s:param>
					<s:param name="currentPage">
						<s:property value="currentPage" />
					</s:param>
				</s:url>

				


					<td width="150" height="400" align="center"><s:a
							href="%{viewURL}">
							
							<img src="/list/image/${goods_sav_filename}.PNG" width="100"
								height="100">
						</s:a><br> <s:property value="goods_name" /><br> <s:property
							value="goods_price" /></td>

			</s:iterator>

			<s:if test="list.size() <= 0">
				<tr>
					등록된 상품이 없습니다.
				</tr>
			</s:if>

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
	<table width="1100" border="1" height="300" align="center"
		cellpadding="0" cellspacing="10">
		<tr>
			<td colspan=3 align="center"><h2>best</h2> <br>------------------------</td>
		</tr>

		<tr>
		<tr>
			<td width="150" height="400"></td>
			<td width="150" height="400"></td>
			<td width="150" height="400"></td>
		</tr>
		<tr>
			<td width="150" height="400"></td>
			<td width="150" height="400"></td>
			<td width="150" height="400"></td>
		</tr>
		<tr align="center">
			<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
		</tr>
	</table>

</body>
</html>