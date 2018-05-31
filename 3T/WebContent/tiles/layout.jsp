<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" href="/tiles/tiles/css.css"
	type="text/css">
<html>
<head>
	<title><tiles:getAsString name="title" /></title>
</head>
<body>
<table width="100%" height="950" border="0" cellpadding="0" cellspacing="0">
<tr colspan="1" height="10%" align="center">
<td><tiles:insertAttribute name="header"/></td>
</tr>
<tr>
	<td valign="top"><tiles:insertAttribute name="body" /></td>
	
<tr>
	
	<td colspan="1" height="10%" align="center">
	<tiles:insertAttribute name="footer" />
	</td>
	
</tr>
</table>
</body>
</html>
<!-- order by date asc -->