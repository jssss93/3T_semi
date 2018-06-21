<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>REVIEW</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
#form td.tdstyle2 {
	background-color: #000000;
	border: #ccc 1px solid;
	width: 400px;
	padding: 20px;
	font-size: 14px;
	font-weight: bold;
	color: #000;
}
</style>
</head>

<body>


	<table width="60%" border="0" cellspacing="0" cellpadding="1">
		<tr>
			<td height="50"></td>
		</tr>
		<tr>

			<td align="center" class="text01 formbar"><h2>REVIEW</h2></td>

		</tr>
		<tr>
			<td height="50"></td>
		</tr>




		<table width="60%" border="0" width="60%" border="0" cellspacing="0" cellpadding="1">
			<tr align="center">
				<td width="50"><strong>NO</strong></td>
				<td width="80"><strong>ITEM </strong></td>
				<td width="350"><strong>SUBJECT</strong></td>
				<td width="50"><strong>NAME</strong></td>


			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="4"></td>
			</tr>

			<s:iterator value="list" status="stat">
				<!-- listAction에서의 Arraylist에 넣어논걸 for문을 돌려 한줄한줄 꺼낸다 -->

				<s:url id="viewURL" action="Review_View">
					<s:param name="REV_no">
						<s:property value="REV_no" />
					</s:param>
					<s:param name="currentPage">
						<s:property value="currentPage" />
					</s:param>
				</s:url>


				<tr align="center" height="50">
					<td class="tdstyle2"><s:property value="REV_no" /></td>
					<td align="center"><img src="/3T/upload/${REV_goods_img}"
						width="50"></td>



					<td align="center">&nbsp; <s:if test="REV_re_level != 0">
							<c:forEach var="i" begin="${REV_re_level}" end="0">&nbsp;</c:forEach>→
            </s:if> <s:a href="%{viewURL}">
							<s:property value="REV_goods_name" />
							<br>
							<s:property value="REV_subject" />

						</s:a></td>
					<td align="center"><s:property value="REV_name" /></td>

				</tr>
				<tr bgcolor="#777777">
					<td height="1" colspan="4"></td>
				</tr>

			</s:iterator>



			<s:if test="list.size() <= 0">
				<!-- list에 들어있는게 없다면 -->

				<tr bgcolor="#FFFFFF" align="center">
					<td colspan="5">등록된 게시물이 없습니다.</td>
				</tr>
				<tr bgcolor="#777777">
					<td height="1" colspan="5"></td>
				</tr>

			</s:if>
			<tr height="20"></tr>
			<tr align="center">
				<td colspan="6"><s:property value="pagingHtml" escape="false" /></td>
			</tr>
			
			
			<tr>


				<td colspan="5" align="right"><input class="hreflink"
					type="button" value="WRITE"
					onClick="javascript:location.href='ReviewWriteForm.action?currentPage=<s:property value="currentPage" />';"></td>

			</tr>
			
			
			
			<tr align="center">
				<td colspan="5">
					<form>
						<select name="searchNum" style="width: 100px; height: 30px;">
							<option value="0">작성자</option>
							<option value="1">제목</option>

						</select>
						<s:textfield name="searchKeyword" theme="simple" value=""
							cssStyle="width:200px; height:30px;" maxlength="20" />
						<input name="submit" type="submit" value="SEARCH" class="submit">
					</form>
				</td>
			</tr>
			





		</table>
</body>
</html>