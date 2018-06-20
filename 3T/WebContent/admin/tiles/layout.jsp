<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" href="/tiles/tiles/css.css" type="text/css">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>


<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<table width="100%" height="950" border="0" cellpadding="0"
		cellspacing="0">
		<tr colspan="1" height="10%" align="center" >
			<td><tiles:insertAttribute name="header" /></td>
		</tr>
		<tr>
			<td valign="top" align="center" ><tiles:insertAttribute
					name="body" /></td>
		<tr>

			<td colspan="1" height="300" align="center" ><tiles:insertAttribute
					name="footer" /></td>

		</tr>
	</table>
</body>
</html>
