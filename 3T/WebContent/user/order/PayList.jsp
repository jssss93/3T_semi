<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ֹ� �󼼳���</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

</head>
<body>
<h2>
	<form name="form">
	<table width="400" border="0" cellspacing="0" cellpadding="2" id="form" border=1>
			<tr>
			
				<td colspan="2" align="right"><font style="font-weight: bold;" color="#FF0000"><h1> KRW ${g_resultClass.goods_price*sgoods_cnt}</h1></font></td>
			</tr>
			<p>
			<tr>
				<td class="tdstyle1">
					<h3>����ǰ�ݾ�</h3>
				</td>
				<td align="right"  >
				  <font style="font-weight: bold;"><h3>= KRW ${g_resultClass.goods_price}</h3> </font>

				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					<h3>������</h3>
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h3>= KRW <%= request.getParameter("sgoods_cnt") %></h3></font>
				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					<h3>����ۺ�</h3>
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h3>= KRW 0</h3></font>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2"><input  class="hreflink" type="button" name="close" onclick="window.close()" value="�ݱ�"/></td>
			</tr>
			</h2>
	</table>
	</form>
</body>
</html>