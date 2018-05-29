<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>

</head>
<body>

	<table width="100%" height="100%" border="1" cellpadding="0"
		cellspacing="0">


		<tr>
			<td valign="center" align="center" height="20%"><tiles:insertAttribute
					name="header" /></td>

		</tr>
		<tr>
			<td valign="top" align="center"><tiles:insertAttribute
					name="body" /></td>
		</tr>
		<tr>
			<td valign="center" align="center" height="20%"><tiles:insertAttribute
					name="footer" /></td>

		</tr>


	</table>
</body>
</html>