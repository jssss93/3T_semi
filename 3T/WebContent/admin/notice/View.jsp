<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ��ǰ �󼼺���</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=600, height=500");
		 
	}
</script>
</head>

<body>
	<table width="80%" border="0" cellspacing="0" cellpadding="2">
	<tr>
			<td height="30"></td>
		</tr>
	<tr>
		<td align="center" class="text01 formbar"><h2>�������� �󼼺���</h2></td>
	</tr>
	
		<tr>
			<td height="50"></td>
		</tr>
	</table>

	<table width="60%" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		
		
		<tr>
			<td width="100" align="center">����</td>
			<td width="500" >
			<!-- �̷��Ե� ���� �ִٴ°Ŵ� ���ڽĵ�� -->
				${resultClass.notice_subject }
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>
		
		<tr>
			<td width="100" align="center">����</td>
			<td width="500" >
			<!-- �̷��Ե� ���� �ִٴ°Ŵ� ���ڽĵ�� -->
				${resultClass.notice_content }
			</td>
		</tr>
		
		
		
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="20"></td>
		</tr>
		
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>

	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
	
	
		<tr>
			<td colspan="2" align="right">
				<s:url id="modifyURL" action="ANmodifyForm">
					<s:param name="notice_no">
						<s:property value="notice_no" />
					</s:param>
				</s:url>
				<s:url id="deleteURL" action="ANdeleteAction">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url>
				<input name="modify_b" type="button" value="����" class="submit" onClick="javascript:location.href='AN_ModifyForm.action?notice_no=<s:property value="resultClass.notice_no" />&currentPage=<s:property value="currentPage" />','modify'">
				<input name="delete_b" type="button" value="����" class="hreflink" onClick="javascript:location.href='AN_Delete.action?notice_no=<s:property value="resultClass.notice_no" />&currentPage=<s:property value="currentPage" />','delete'">
				<input name="list_b" type="button" value="���" class="submit" onClick="javascript:location.href='AN_List.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
		
	</table>
</body>
</html>















