<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>��Ʈ����2 �Խ���</title>
<!--  
<script type="text/javascript">
	function validation(){
		
		var frm = document.forms[0]; 
		
		if(frm.subject.value == ""){
			alert("������ �Է����ּ���.");
			return false;
		}
		else if(frm.name.value == ""){
			alert("�̸��� �Է����ּ���.");
			return false;
		}
		else if(frm.password.value == ""){
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}
		else if(frm.content.value == ""){
			alert("������ �Է����ּ���.");
			return false;
		}
		return true;
	}

	
</script>
-->
</head>
<body>


	 <table width="700" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="left"><h2>REVIEW</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  	
	
	
	<s:if test="resultClass == NULL">
		<form action="Review_Write.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>
	
	
	<s:else>
		<form action="Review_Modify.action" method="post" enctype="multipart/form-data">
		<s:hidden name="no" value="%{resultClass.REV_no}"/>
		<s:hidden name="currentPage" value="%{currentPage}"/>
		<s:hidden name="old_file" value="%{resultClass.REV_file_savname}"/>
	</s:else>
	
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000"></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="100" bgcolor="#FFFFFF"><font color="#FF0000"></font>SUBJECT</td>
			<td width="500" bgcolor="#FFFFFF">
			<s:textfield name="subject" theme="simple" value="%{resultClass.REV_subject}" cssStyle="width:370px" maxlength="50"/>
			</td>
		</tr>
		<tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		
		<tr>
			<td bgcolor="#FFFFFF"><font color="#FF0000"></font>NAME</td>
			<td bgcolor="#FFFFFF">
			<s:textfield name="name" theme="simple" value="%{resultClass.REV_name}" cssStyle="width:100px" maxlength="20"/>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#FFFFFF"><font color="#FF0000"></font>PASSWORD</td>
			<td bgcolor="#FFFFFF">
				<s:textfield name="password" theme="simple" value="%{resultClass.REV_passwd}" cssStyle="width:100px" maxlength="20"/>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
         
          <td colspan="2" bgcolor="#FFFFFF">
            <s:textarea name="content" theme="simple" value="%{resultClass.REV_content}" cols="100" rows="20" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
        	<td bgcolor="#FFFFFF">FILE</td>
        	<td bgcolor="#FFFFFF">
        	<s:file name="upload" theme="simple"/>
        	
        	<s:if test="resultClass.REV_file_orgname != NULL">
        	&nbsp; * <s:property value="resultClass.file_orgname"/>������ ��� �Ǿ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
        	</s:if>
        	</td>
        </tr>
        <tr>
        	<td bgcolor="#FFFFF">�������� ���� �� �̿� ���� </td>
        	<td bgcolor="#FFFFF">
        	<s:textarea name="content" theme="simple" value="�� ���������� �������̿� ����
���� ���� �� ����� ����, ���� �� ��ݰ���, ��ǰ��� �Ǵ� û���� �߼�, ȸ������ ���� ���� ����
�� �����Ϸ��� ���������� �׸�
�̸�, �ּ�, ����ó ��
�� ���������� ���� �� �̿� �Ⱓ
ȸ��� �������� ���� �� �̿������ �޼��� �Ŀ��� ���ܾ��� �ش������� �ı��մϴ�.
#���������� ��Ź ó������Ŭ�δ� ���� ����� ���� ������ɿ� ���� ȸ���� ���Ǹ� ��ų� ���� ������ ���� �Ǵ� ���� �� ȸ���� ���������� �ܺο� ��Ź�Ͽ� ó���ϰ� �ֽ��ϴ�. ����Ŭ���� ��������ó�� ��Ź�ڿ� �� ������ ������ ������ �����ϴ�. - ��Ź�� : (��)�糪����Ʈ- ��Ź ���� ���� : īī�� �˸��� �߼� ���� ���� �� �Ϻ� ������¿� ����, ���ڻ�ŷ��Һ��ں�ȣ�� �� 21���� �ǰ� ���»翡 ��������� ���� �˴ϴ�." cols="80" rows="10"></s:textarea>
        	</td>
       		<td colspan="2"></td>
        </tr>
        <tr>
        <td colspan="2" bgcolor="#FFFFFF">�������� ���� �� �̿뿡 �����Ͻʴϱ�?
        <input type="radio"  name="objChkBox" value="����">����</input>
        <input type="radio"  name="objChkBox" value="���Ǿ���">���Ǿ���</input>
        </td>
        </tr>
        <tr bgcolor="#777777">
        	<td height="1" colspan="2"></td>
        </tr>
        <tr>
        	<td height="10" colspan="2"></td>
        </tr>
		
		<tr>
			<td align="right" colspan="2">
				<input name="submit" type="submit" value="OK" >
				<input name="list" type="button" value="CANCLE" onClick="javascript:location.href='Review_list.action?currentPage=<s:property value="currentPage"/>'">
			</td>
		</tr>
		
	</table>
	</form>
</body>
</html>