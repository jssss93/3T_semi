<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="euc-kr" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
function windowclose(){
	opener.document.Reg_form.M_ID.value="${M_ID}";

	self.close(); 
}

function check() {
	var f=document.checkId;  //����.Form name="";
	if(f.M_ID.value==""){
		alert("�г����� �Է����ּ���.");
		f.M_ID.focus();
		return false;
	}
	if (f.M_ID.value.length < 2) {
		alert("�ּ� 2�ڸ� �̻� �Է����ּ���!");
		f.M_ID.focus();
		return false;
	}
}
</script>
</head>
<body bgcolor=#f5f5f5>
<s:if test="chkNo==1">
	<form name = "checkId" action="CheckIdAction.action" method="post" onsubmit="return check()">
	<table width=400 border=0 cellspacing=0 cellpadding=5 class="BTABLE">
		<tr align=center>
			<td height=30>
				<font><b>${M_ID}</b> ��(��) <br>
				�̹� ��� ���� �г����Դϴ�!</font>
			</td>
		</tr>
	</table><br/>
	<table width=400 border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td align=center>
				<font>�ٸ� ID�� �����ϼ���!</font><br/>
				<input type="text" size="10" maxlength="20" name="M_ID" />
				<input type="submit"  value="�ߺ�Ȯ��"">
			</td>
		</tr>
	</table>
	</form>
</s:if>

<s:else>
	<table width=400 border=0 cellspacing=0 cellpadding=5>
		<tr>
			<td align=center>
				<br><br>
				�Է��Ͻ� <b>${M_ID}</b> ��(��) <br>
				����� �� �ִ� �г����Դϴ�.</font>
				<br/><br/>
				<input type="button" value="�ݱ�" onclick="windowclose()"/>
			</td>
		</tr>
	</table>
</s:else>
</body>
</html>