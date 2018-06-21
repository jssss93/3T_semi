<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/3T/user/notice/common/css/css.css"
	type="text/css">
	
<style>
#myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

.abc {  font-size: 17px; color: #000000;}
</style>
</head>

<body>
	<table width="80%" border="0" height="300" align="center"
		cellpadding="0" cellspacing="10">
	
		<tr>
		
			<td width="80%" colspan=6 align="center"><h1 class="abc">BEST</h1></td>
		</tr>
	
		<tr>
		<td width="50"></td>
			<s:iterator value="list1" status="stat1">

				<s:if test="#stat1.index 4 eq 0">

				</s:if>



				<s:url id="viewURL" action="GoodsView">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url>




				<td width="300" height="300" align="center"><s:a
						href="%{viewURL}">

						<img id="myImg" src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>" width="300"
							height="300">

					</s:a><br> <s:property value="goods_name" /><br> \&nbsp;<s:property
						value="goods_price" /></td>

			</s:iterator>
			<td width="50"></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<table width="1100" border="0" align="center" cellpadding="0"
		cellspacing="30">

		

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

						<img id="myImg" src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>" width="500"
							height="500">
					</s:a><br> <s:property value="goods_name" /><br> \&nbsp;<s:property
						value="goods_price" /></td>

			</s:iterator>
			
			<s:if test="list.size() <= 0">
			<tr>
				<td colspan="3" align="center">등록된 게시물이 없습니다</td>
			</tr><BR><BR><BR>
		</s:if>


	
		<tr align="center">
		
		<td align="center" colspan="3"><s:property value="pagingHtml" escape="false" /></td>
	</tr>
	</table>
	

	


</body>
</html>