<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A</title>
<link rel="stylesheet" href="/3T/user/qa/common/css/css.css" type="text/css">
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="left"><h2>Q&A</h2></td>
		</tr>
	</table>
	
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#f3f3f3">
			<td width="50"><strong>NO</strong></td>
			<td width="350"><strong>ITEM</strong></td>
			<td width="70"><strong>CATEGORY</strong></td>
			<td width="80"><strong> </strong></td>
			<td width="50"><strong>NAME</strong></td>
			<td width="50"><strong>DATE</strong></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="6"></td>
		</tr>

	<s:iterator value="list" status="stat">
		<s:url id="viewURL" action="qa_viewAction">
			<s:param name="QA_NO">
				<s:property value="QA_NO" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
	
		<tr>
			<td align="center"><s:property value="QA_NO" /></td>
			<td align="center"><img src="/3T/upload/${QA_FILE_SAVNAME}" width="50"></td>
			<td align="center"><s:property value="QA_CATEGORY_NO" /></td>
			<td align="left">
				<s:if test="QA_RE_LEVEL != 0">
					<c:forEach var = "i" begin = "${QA_RE_LEVEL}" end = "0">&nbsp;</c:forEach>→
				</s:if>	
 				<s:a href="%{viewURL}"><s:property value="QA_SUBJECT" /></s:a>
 			</td>
			<td align="center"><s:property value="QA_NAME" /></td>
			<td align="center"><s:property value="QA_REGDATE" /></td>
			
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="6"></td>
		</tr>

	</s:iterator>

	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="6" align="center">등록된 게시물이 없습니다</td>
		</tr>
	</s:if>

	<tr align="center">
		<td colspan="6"><s:property value="pagingHtml" escape="false" /></td>
	</tr>

	<tr align="right">
		<td colspan="6">
			<input type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='qa_writeForm.action?currentPage=<s:property value="currentPage" />';" />
		</td>
	</tr>

	<tr align="center">
		<td colspan="6">
			<form>
				<select name="searchNum" >
					<option value="0">작성자</option>
					<option value="1">제목</option>
					<option value="2">내용</option>
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb">
			</form>
		</td>
	</tr>
</table>
</body>
</html>











