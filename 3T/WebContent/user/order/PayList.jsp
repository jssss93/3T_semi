<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ֹ� �󼼳���</title>
</head>
<body>
	<s:if test="g_resultClass.goods_no != 0">
	<form name="form">
	<table width="300" border="0" cellspacing="0" cellpadding="2">
			<tr>
			
				<td colspan="2" align="right"><font style="font-weight: bold;" color="#FF0000"><h3> KRW ${g_resultClass.goods_price*sgoods_cnt}</h3></font></td>
			</tr>
			<p>
			<tr>
				<td>
					����ǰ�ݾ�
				</td>
				<td align="right">
				  <font style="font-weight: bold;"><h5>= KRW ${g_resultClass.goods_price} </h5></font>

				</td>
			</tr>
			<tr>
				<td>
					������
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>=  <%= request.getParameter("sgoods_cnt") %>��</h5></font>
				</td>
			</tr>
			<tr>
				<td>
					����ۺ�
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>= KRW 0</h5></font>
				</td>
			</tr>
			<tr>
				<td align="right"><input type="button" name="close" onclick="window.close()" value="�ݱ�"/></td>
			</tr>
	</table>
	</form>
	</s:if>
	<s:else>
	<form name="form">
	<table width="300" border="0" cellspacing="0" cellpadding="2">
			<tr>
			
				<td colspan="2" align="right"><font style="font-weight: bold;" color="#FF0000"><h3> KRW <s:property value="b" /></h3></font></td>
			</tr>
			<p>
			<tr>
				<td>
					����ǰ�ݾ�
				</td>
				<td align="right">
				  <font style="font-weight: bold;"><h5>= KRW  <s:property value="a" />  </h5></font>

				</td>
			</tr>
			<tr>
				<td>
					������
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>=  <s:property value="c" /> ��</h5></font>
				</td>
			</tr>
			<tr>
				<td>
					����ۺ�
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>= KRW 0</h5></font>
				</td>
			</tr>
			<tr>
				<td align="right"><input type="button" name="close" onclick="window.close()" value="�ݱ�"/></td>
			</tr>
	</table>
	</form>
	</s:else>
</body>
</html>