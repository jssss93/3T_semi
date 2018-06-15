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
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
	<style type="text/css">
#form td.tdstyle2 {background-color :#000000; border:#ccc 1px solid; width:400px; padding:20px; font-size:14px; font-weight:bold; color:#000;}

</style>
</head>
<body>
	<table width="1000" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="50"></td>
		</tr>
		<tr>
			<td align="center" class="text01 formbar"><h2>Q&A</h2></td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>
	<form name="inputForm">
	<table width="1000" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" >
			<td width="70"><strong>NO</strong></td>
			<td width="70"><strong>ITEM</strong></td>
			<td width="70"><strong>CATEGORY</strong></td>
			<td width="600"><strong> </strong></td>
			<td width="70"><strong>NAME</strong></td>
			<td width="70"><strong>DATE</strong></td>
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
	
		<tr align="center">
			<td align="center"><s:property value="QA_NO" /></td>
			<td align="center"><img src="/3T/upload/${QA_GOODS_IMG}" width="50"></td>
			<td align="center">
				<s:if test="QA_CATEGORY_NO==1">
					<input type="text" value="상품문의" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
				</s:if>
				<s:if test="QA_CATEGORY_NO==2">
					<input type="text" value="배송문의" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
				</s:if>
				<s:if test="QA_CATEGORY_NO==3">
					<input type="text" value="입금확인문의" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
				</s:if>
				<s:if test="QA_CATEGORY_NO==4">
					<input type="text" value="기타문의" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" />
				</s:if>
			</td>				
			<td align="center">
				<s:if test="QA_RE_LEVEL != 0">
					<c:forEach var = "i" begin = "${QA_RE_LEVEL}" end = "0">&nbsp;</c:forEach>→
				</s:if>	
 				<s:a href="%{viewURL}"><s:property value="QA_GOODS_NAME" /><br><s:property value="QA_SUBJECT"/></s:a>
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
			<input type="button" value="글쓰기" class="hreflink" onClick="javascript:location.href='qa_writeForm.action?currentPage=<s:property value="currentPage" />';" />
		</td>
	</tr>

	<tr align="center">
		<td colspan="6">
			<form>
				<select name="searchNum" style="width: 100px; height: 30px;" >
					<option value="0">작성자</option>
					<option value="1">제목</option>
					<option value="2">내용</option>
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:200px; height:30px;" maxlength="20" />
				<input name="submit" type="submit" value="SEARCH" class="submit" >
			</form>
		</td>
	</tr>
</table>
</form>
</body>
</html>











