<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ��ǰ ���</title>


<link rel="stylesheet" href="/3T/common/css/css.css" type="text/css">

<script type="text/javascript">
	function validation() {
		var frm = document.forms[0];

		if (frm.subject.value == "") {
			alert("�Է����ּ���");
			return false;
		} else if (frm.name.value == "") {
			alert("�Է����ּ���");
			return false;
		} else if (frm.password.value == "") {
			alert("�Է����ּ���");
			return false;
		} else if (frm.content.value == "") {
			alert("�Է����ּ���");
			return false;
		}

		return true;
	}

	$(document).ready(function() {
		$("#content").cleditor();
	});
</script>
</head>
<body>


	<s:if test="resultClass == NULL">
		<table width="600" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center"><h2>FAQ ���</h2></td>
			</tr>
		</table>
		<form action="AF_Write.action" method="post"
			onsubmit="return validation();">
	</s:if>

	<s:else>
		<table width="600" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center"><h2>FAQ ����</h2></td>
			</tr>
		</table>
		<form action="AF_Modify.action" method="post">
			<s:hidden name="faq_no" value="%{resultClass.faq_no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
	</s:else>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">*</font>�� �ʼ�
				�Է»����Դϴ�.</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>�ۼ���</td>
			<td width="500" bgcolor="#FFFFFF"><s:textfield name="faq_writer"
					theme="simple" value="%{resultClass.faq_writer}"
					cssStyle="width:370px" maxlength="50" /></td>
		</tr>
		

		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>����</td>
			<td width="500" bgcolor="#FFFFFF"><s:textfield
					name="faq_subject" theme="simple"
					value="%{resultClass.faq_subject}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> ��ǰ ����</td>
			<td bgcolor="#FFFFFF"><s:textarea name="faq_content"
					theme="simple" value="%{resultClass.faq_content}" cols="50"
					rows="10" /></td>
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
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="�ۼ��Ϸ�" class="inputb"> <input name="list"
				type="button" value="���" class="inputb"
				onClick="javascript:location.href='AF_List.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

	</table>
	</form>
</body>
</html>