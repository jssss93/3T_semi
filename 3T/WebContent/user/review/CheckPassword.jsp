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

<table width="400" border="0" cellspacing="0" cellpadding="1">
		<tr>
			<td align="left"><h3>REVIEW</h3></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
	
		
	</table>
	


	<form action="Review_CheckAction.action" method="post">
		<s:hidden name="REV_no" value="%{REV_no}" />
		<s:hidden name="currentPage" value="%{currentPage}" />


		<table width="400" border="0" cellspacing="0" cellpadding="1">

			<tr>
				<td align="left" width="130" >리뷰 등록 시 비밀번호를 입력하여 주십시오</td>
				
			</tr>
				<tr>
			<td height="20"></td>
		</tr>
			
			
			<td align="left" width="200" bgcolor="#FFFFFF">&nbsp;&nbsp;PASSWORD <s:textfield
						name="REV_passwd" theme="simple" cssStyle="width:160px"
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
