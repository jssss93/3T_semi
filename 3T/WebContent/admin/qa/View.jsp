<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ��ǰ �󼼺���</title>
<link rel="stylesheet" href="/3T/common/css/css.css" type="text/css">

<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=600, height=500");
		
	}
</script>
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>QA �󼼺���</h2></td>
	</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		
		
		<tr>
			<td width="100">����</td>
			<td width="500">
			<!-- �̷��Ե� ���� �ִٴ°Ŵ� ���ڽĵ�� -->
				${resultClass.qa_subject }
			</td>
		</tr>
		
		<tr>
			<td width="100">����</td>
			<td width="500">
			<!-- �̷��Ե� ���� �ִٴ°Ŵ� ���ڽĵ�� -->
				${resultClass.qa_content }
			</td>
		</tr>
		
		
		
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" height="10">
				
			</td>
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
				<s:url id="modifyURL" action="AQ_Modify">
					<s:param name="qa_no">
						<s:property value="qa_no" />
					</s:param>
				</s:url>
				<s:url id="deleteURL" action="AQ_Delete">
					<s:param name="qa_no">
						<s:property value="qa_no" />
					</s:param>
				</s:url>
				<input name="modify_b" type="button" value="����" class="inputb" onClick="javascript:location.href='AQ_ModifyForm.action?qa_no=<s:property value="resultClass.qa_no" />&currentPage=<s:property value="currentPage" />','modify'">
				<input name="delete_b" type="button" value="����" class="inputb" onClick="javascript:location.href='AQ_Delete.action?qa_no=<s:property value="resultClass.qa_no" />&currentPage=<s:property value="currentPage" />','delete'">
				<input name="list_b" type="button" value="���" class="inputb" onClick="javascript:location.href='AQ_List.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
		
	</table>
</body>
</html>















