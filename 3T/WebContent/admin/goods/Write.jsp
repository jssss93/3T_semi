<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ��ǰ ���</title>


<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function validation() {
		var frm = document.forms[0];

		if (frm.goods_name.value == "") {
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
		<table width="80%" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center" class="text01 formbar"><h2>��ǰ ���</h2></td>
			</tr>
		</table>
		<form action="AG_Write.action" method="post"
			enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>

	<s:else>
		<table width="60%" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center" class="text01 formbar"><h2>��ǰ ����</h2></td>
			</tr>
		</table>
		<form action="AG_Modify.action" method="post"
			enctype="multipart/form-data">
			<s:hidden name="goods_no" value="%{resultClass.goods_no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.goods_sav_filename}" />
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
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				��ǰ��</td>
			<td width="500" class="tdstyle2"><s:textfield name="goods_name"
					theme="simple" value="%{resultClass.goods_name}"
					cssStyle="width:370px" maxlength="50" /></td>
		</tr>

		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				��ǰ ����</td>
			<td width="500" class="tdstyle2"><s:textfield
					name="goods_color" theme="simple"
					value="%{resultClass.goods_color}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				��ǰ ����</td>
			<td width="500"class="tdstyle2""><s:textfield
					name="goods_price" theme="simple"
					value="%{resultClass.goods_price}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				��ǰ ������</td>
			<td   width="500"class="tdstyle2"><s:textfield name="goods_size"
					theme="simple" value="%{resultClass.goods_size}"
					cssStyle="width:370px" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				��ǰ ī�װ�</td>
			<td   width="500" class="tdstyle2"><s:textfield
					name="goods_category" theme="simple"
					value="%{resultClass.goods_category}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				��ǰ �� ����</td>
			<td  class="tdstyle2" width="500"><s:textfield
					name="goods_totalcount" theme="simple"
					value="%{resultClass.goods_totalcount}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				���û�ǰ</td>
			<td  class="tdstyle2"  width="500"><s:textfield
					name="goods_related_product" theme="simple"
					value="%{resultClass.goods_related_product}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>


		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> ��ǰ ����</td>
			<td  class="tdstyle2"><s:textarea name="goods_content"
					theme="simple" value="%{resultClass.goods_content}" cols="50"
					rows="10" /></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> ���λ���</td>
			<td class="tdstyle2"><s:file label="File1" name="uploads"
					theme="simple" /> <s:if test="resultClass.goods_org_file != NULL">
				&nbsp; * ������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
			</s:if></td>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> �󼼻���1</td>
			<td class="tdstyle2"><s:file label="File2" name="uploads"
					theme="simple" /></td>

		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> �󼼻���2</td>
			<td class="tdstyle2"><s:file label="File3" name="uploads"
					theme="simple" /> 
		</tr>
			<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> �󼼻���3</td>
			<td class="tdstyle2"><s:file label="File4" name="uploads"
					theme="simple" /> 
		</tr>
			<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> �󼼻���4</td>
			<td class="tdstyle2"><s:file label="File5" name="uploads"
					theme="simple" /> 
		</tr>
		

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>


		<tr>
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="�ۼ��Ϸ�" class="submit"> <input name="list"
				type="button" value="���" class="hreflink"
				onClick="javascript:location.href='AG_List.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

	</table>
	</form>
</body>
</html>