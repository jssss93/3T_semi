<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>FAQ</title>
<link rel="stylesheet" href="/3T/user/faq/common/css/css.css"
	type="text/css">
<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
</head>

<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="30"></td>
		</tr>
		<tr>
			<td align="left"><h2>FAQ</h2></td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>
	<table width="600" border="0" cellspacing="0" cellpadding="0">

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4">번호</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="resultClass.FAQ_NO" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="#F4F4F4">제목</td>
			<td width="500" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="resultClass.FAQ_SUBJECT" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4">글쓴이</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="resultClass.FAQ_WRITER" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4">내용</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<pre>
					<s:property value="resultClass.FAQ_CONTENT" />
				</pre>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>


		<tr>
			<td align="right" colspan="2">
				<input name="list" type="button" value="목록" 
				onClick="javascript:location.href='UserFaqList.action?currentPage=<s:property value="currentPage" />'">				
			</td>
		</tr>

	</table>
</body>
</html>












