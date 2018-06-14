<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>
</head>
<body>
	<table width="400" border="0" cellspacing="0" cellpadding="1">
		<tr>
			<td align="left"><h3>REVIEW</h3></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
	
		
	</table>
	<form action="Review_CheckAction2.action" method="post">
		<s:hidden name="REV_C_no" value="%{REV_C_no}" />
		<s:hidden name="REV_C_originno" value="%{REV_C_originno}" />
		<s:hidden name="currentPage" value="%{currentPage}" />

		<table width="400" border="0" cellspacing="0" cellpadding="1">

			<tr>
				<td align="left" width="130" >댓글 등록 시 비밀번호를 입력하여 주십시오</td>
				
			</tr>
				<tr>
			<td height="20"></td>
		</tr>
			<td align="left" width="200" bgcolor="#FFFFFF">&nbsp;&nbsp; <s:textfield
						name="REV_C_passwd" theme="simple" cssStyle="width:100px"
						maxlength="20" /> &nbsp;&nbsp; <input name="submit" type="submit"
					value="확인" class="inputb">
				</td>
					<tr>
			<td height="20"></td>
		</tr>
				<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
			
		</table>
	</form>
</body>
</html>