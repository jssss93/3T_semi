<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스트럿츠2 게시판</title>
<link rel="stylesheet" href="/3T/common/css/css.css" type="text/css">
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h1>QA리스트 </h1></td>
		</tr>
	</table>
	
	<table width="1000" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#f3f3f3">
			<td width="50"><strong>번호</strong></td>
			<td width="50"><strong>카테고리</strong></td>
			<td width="50"><strong>제목</strong></td>
			<td width="50"><strong>name</strong></td>
			<td width="50"><strong>date</strong></td>
			
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="8"></td>
		</tr>

	<s:iterator value="list" status="stat">
		<s:url id="viewURL" action="AFviewAction">
			<s:param name="qa_no">
				<s:property value="qa_no" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
	
		<tr>
			<td align="center"><s:property value="qa_no" /></td>
			<td align="center"><s:property value="qa_category_no" /></td>
			<td align="center"><s:a href="%{viewURL}"><s:property value="qa_subject" /></s:a></td>
			<td align="center"><s:property value="qa_writer" /></td>
			<td align="center"><s:property value="qa_regdate" /></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="8"></td>
		</tr>

	</s:iterator>

	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다</td>
		</tr>
	</s:if>

	<tr align="center">
		<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
	</tr>

	<tr align="right">
		<td colspan="5">
			
		</td>
	</tr>

	<tr align="center">
		<td colspan="5">
			<form action="AQlistAction.action">
				<select name="searchNum" >
					<option value="0">작성자</option>
					<option value="1">ID</option>
					<option value="2">내용</option>
					<option value="3">제목</option>
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb">
			</form>
		</td>
	</tr>
</table>
</body>
</html>











