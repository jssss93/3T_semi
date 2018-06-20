<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스트럿츠2 게시판</title>
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
	<table width="80%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="30"></td>
		</tr>
		
		<tr>
			<td align="center" class="text01 formbar"><h2>Notice List.</h2></td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>

	<table width="60%" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" >
		
			<td width="100"><strong>DATE<br>[NO]</br></strong></td>
			<td width="500"><strong>SUBJECT</strong></td>
			<td width="150"><strong>WRITER</strong></td>
			<td width="150"><strong>STATE</strong></td>
			<td width="100"><strong>STATE CHANGE</strong></td>

		</tr>
		<tr>
			<td height="10"></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="8"></td>
		</tr>

		<s:iterator value="list" status="stat">
			<s:url id="viewURL" action="AN_View">
				<s:param name="notice_no">
					<s:property value="notice_no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr>
				<td align="center"><s:property value="notice_regdate" /><br>[<s:property
							value="notice_no" />]</br></td>
				<td align="center"><s:a href="%{viewURL}"><s:property value="notice_subject" /></s:a></td>
				<td align="center"><s:property value="notice_writer" /></td>
				
				<td align="center">
					<s:if test="notice_state==0">미공지</td>
					<td align="center"><input type="button"  value=">>  공지" class="submit"
						onClick="javascript:location.href='AN_List_0to1.action?notice_no=<s:property value="notice_no" />';" />
					
					</s:if>
					<s:elseif test="notice_state==1">공지</td>
					<td align="center"><input type="button" align="center" value=">> 미공지" class="submit"
						onClick="javascript:location.href='AN_List_1to0.action?notice_no=<s:property value="notice_no" />';" />
					
					
					</s:elseif>
				</td>
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
			<td colspan="6"><s:property value="pagingHtml" escape="false" /></td>
		</tr>

		<tr align="right">
			<td colspan="5"><input type="button" value="공지사항 쓰기" class="submit"
				onClick="javascript:location.href='AN_Writeform.action?currentPage=<s:property value="currentPage" />';" />
			</td>
		</tr>

		<tr align="center">
			<td colspan="6">
				<form action="AN_List.action" method="search">
					<select name="searchNum">
						<option value="0">제목</option>
						<option value="1">내용</option>
					</select>
					<s:textfield name="searchKeyword" theme="simple" value=""
						cssStyle="width:120px" maxlength="20" />
					<input name="submit" type="submit" value="검색" class="hreflink">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>











