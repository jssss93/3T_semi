<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
</head>
<body><table width="500">
<tr><td align="center" class="text01 formbar">
비밀번호 확인
</td>
</tr>
</table>
	<form action="qa_checkAction2.action" method="post">
		<s:hidden name="QA_NO" value="%{QA_NO}" />
		<s:hidden name="QA_ORIGINNO" value="%{QA_ORIGINNO}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
		<br><br>
		
		<table width="450" border="0" cellspacing="0" cellpadding="0" id="form">
			<tr>
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td class="tdstyle1"> 비밀번호 입력</td>
				<td>
					&nbsp;&nbsp; <s:textfield name="QA_PASSWD" theme="simple"/>
					&nbsp;&nbsp; <input name="submit"class="submit" type="submit" value="확인">
				</td>
			</tr>
		
		</table>
	</form>
</body>
</html>