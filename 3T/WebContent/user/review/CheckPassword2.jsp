<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

</head>
<body>
		<table width="370">
		<tr>
			<td align="center" class="text01 formbar">비밀번호 확인</td>
		</tr>
	</table>
	<form action="Review_CheckAction2.action" method="post">
		<s:hidden name="REV_C_no" value="%{REV_C_no}" />
		<s:hidden name="REV_C_originno" value="%{REV_C_originno}" />
		<s:hidden name="currentPage" value="%{currentPage}" />

		<table width="370" border="0" cellspacing="0" cellpadding="0" id="form">
		
			<tr>
				<td width="120" class="tdstyle1">비밀번호 입력</td>
				<td width="350">&nbsp;&nbsp; <s:textfield
						name="REV_C_passwd" theme="simple" cssStyle="width:100px"
						maxlength="20" /> &nbsp;&nbsp; <input name="submit" type="submit"
					value="확인" class="submit">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>