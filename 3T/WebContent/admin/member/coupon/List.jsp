<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>��Ʈ����2 �Խ���</title>

<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<table width="1000" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center" class="text01 formbar"><h1>${resultClass.M_id }�������� ���</h1></td>
		</tr>
	</table>

	<table width="1000" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#f3f3f3">
			<td width="50"><strong>������ȣ</strong></td>
			<td width="50"><strong>��������</strong></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="8"></td>
		</tr>

		<s:iterator value="list" status="stat">

			<tr>
				<td align="center"><s:property value="m_coupon_no" /></td>
				<td align="left"><s:property value="m_coupon_content" /></td>

			</tr>

			<tr bgcolor="#777777">
				<td height="1" colspan="8"></td>
			</tr>

		</s:iterator>

		<s:if test="list.size() <= 0">
			<tr>
				<td colspan="5" align="center">������ �����ϴ�</td>
			</tr>
		</s:if>

		<tr align="center">
			<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
		</tr>

		<tr align="right">
			<td colspan="5"></td>
		</tr>

		<tr align="center">
			<td colspan="5">
				<form>
					<select name="searchNum" style="width: 100px; height: 30px;">
						<option value="0">�ۼ���</option>
						<option value="1">����</option>
						<option value="2">����</option>
					</select>
					<s:textfield name="searchKeyword" theme="simple" value=""
						cssStyle="width:200px; height:30px;" maxlength="20" />
					<input name="submit" type="submit" value="�˻�" class="submit">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>











