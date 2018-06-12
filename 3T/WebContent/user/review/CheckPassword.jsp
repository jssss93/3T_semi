<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>비밀번호 확인</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<table width="370">
		<tr>
			<td align="center" class="text01 formbar">비밀번호 확인</td>
		</tr>
	</table>
	<form action="Review_CheckAction.action" method="post">
		<s:hidden name="REV_no" value="%{REV_no}" />
		<s:hidden name="currentPage" value="%{currentPage}" />

		<table width="370" border="0" cellspacing="0" cellpadding="0"  id="form">

		

			<tr>
				<td width="120" class="tdstyle1">비밀번호 입력</td>
				<td width="350" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:textfield
						name="REV_passwd" theme="simple" cssStyle="width:100px"
						maxlength="20" /> &nbsp;&nbsp;<input name="submit" type="submit"
					value="확인" class="submit"></td>
			</tr>

	

		</table>

	</form>
</body>
</html>
