<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>FAQ</title>
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

#form td.tdstyle2 {
	background: #2bae9f;
	border: #ccc 1px solid;
	width: 400px;
	padding: 20px;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
}
</style>
<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window.open(url, name,
				"scrollbars=no,status=no,resizable=no,width=300,height=150");
	}
</script>
</head>

<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="30"></td>
		</tr>
		<tr>
			<td align="center" class="text01 formbar">FAQ</td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>
	<table width="600" border="0" cellspacing="0" cellpadding="0">

		<tr>
			<td height="1" ></td>
		</tr>
			<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td><b>번호</b></td>
			<td>&nbsp;&nbsp;<s:property value="resultClass.FAQ_NO" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="#F4F4F4"><b>제목</b></td>
			<td width="500" class="tdstyle1">&nbsp;&nbsp;<s:property
					value="resultClass.FAQ_SUBJECT" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><b>글쓴이</b></td>
			<td class="tdstyle2">&nbsp;&nbsp;<s:property
					value="resultClass.FAQ_WRITER" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><b>내용</b></td>
			<td class="tdstyle1">&nbsp;&nbsp;<pre>
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
			<td align="right" colspan="2"><input name="list" type="button"
				class="submit" value="목록"
				onClick="javascript:location.href='UserFaqList.action?currentPage=<s:property value="currentPage" />'"></td>
		</tr>

	</table>
</body>
</html>












