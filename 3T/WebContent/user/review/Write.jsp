<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
#form td.tdstyle2 {background-color :#000000; border:#ccc 1px solid; width:400px; padding:20px; font-size:14px; font-weight:bold; color:#000;}

</style>

<title>REVIEW</title>
<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=600, height=500");
		
	}
</script>


<script type="text/javascript">
	function validation() {

		var frm = document.forms[0];

		if (frm.REV_subject.value == "") {
			alert("������ �Է����ּ���.");
			return false;
		} else if (frm.REV_name.value == "") {
			alert("�̸��� �Է����ּ���.");
			return false;
		} else if (frm.REV_passwd.value == "") {
					alert("��й�ȣ�� �Է����ּ���.");
					return false;
				} else if (frm.REV_content.value == "") {
			alert("������ �Է����ּ���.");
			return false;
		}/*  else if (frm.objChkBox.value == "") {
					alert("�������� ���� �� �̿뿡 �������ּ���.");
					return false;
				} */

		return true;
	}
</script>

</head>
<body>




	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center" class="text01 formbar">REVIEW</td>

		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<s:if test="reply">
		<form action="Review_ReplyAction.action" method="post"
			enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="REV_ref" value="%{resultClass.REV_ref}" />
			<s:hidden name="REV_re_level" value="%{resultClass.REV_re_level}" />
			<s:hidden name="REV_re_step" value="%{resultClass.REV_re_step}" />
	</s:if>



	<s:elseif test="resultClass == NULL">
		<form action="Review_Write.action?goods_no=${goods_no }" method="post"
			enctype="multipart/form-data" onsubmit="return validation();">
			<s:param name="REV_goods_no">
				<s:property value="REV_goods_no" />
			</s:param>
	</s:elseif>


	<s:else>
		<form action="Review_ModifyAction.action?goods_no=${goods_no }" method="post"
			enctype="multipart/form-data">
			<s:hidden name="REV_no" value="%{resultClass.REV_no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.REV_file_savname}" />
	</s:else>
<table width="600" border="0" cellspacing="0" height="120" background="/3T/upload/QA_BG.png">
<s:if test="goods_no <=0">
<input type="hidden" name="REV_goods_no" value="goods_no"/>
<tr>
<td align="center" width="120"><img src="/3T/upload/QA.PNG" width="80" height="100"></td>
	<td colspan="2"><hr align="center" width="470" color="#8C8C8C"  ><br>
	<input type="button" name="button" value="��ǰ�������� ��"
					class="inputb"
					onClick="javascript:open_win_noresizable('Review_SearchGoodsForm.action?currentPage=<s:property value="currentPage" />', write)">
					</td>
			
			</tr>
			
				
			</s:if>
			<s:else>
					<s:url id="viewURL" action="GoodsView">
							<s:param name="goods_no">
								<s:property value="goods_no" />
							</s:param>
							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>
				<tr>                                             
					<td align="center" width="120"><img src="/3T/upload/<s:property value="goods_resultClass.goods_file_savname.split(',')[0]"/>" width="80" height="100"></td>
				
					<td colspan="2"> <s:property value="goods_resultClass.goods_name" /><br>KRW <s:property value="goods_resultClass.goods_price" />
					<hr align="center" width="470" color="#8C8C8C"  ><br>
						<s:a href="%{viewURL}"><input type="button" name="button" value="��ǰ �󼼺��� ��"/></s:a>
						<input type="button" name="button" value="��ǰ���� ���� ��"  onclick="javascript:open_win_noresizable('Review_SearchGoodsForm.action?currentPage=<s:property value="currentPage" />', write)"/>
					</td>
				</tr>
			</s:else>
</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0">


		
		<c:choose>
			<c:when test="${session.M_ID != NULL}">
			
			
				<tr>
					<td width="100" class="tdstyle2"><b>SUBJECT</b></td>
					<td width="500"  class="tdstyle2"><s:textfield
							name="REV_subject" theme="simple"
							value="%{resultClass.REV_subject}" cssStyle="width:370px"
							maxlength="50" /></td>
				</tr>
				

				<tr>

					<td  class="tdstyle2"><b>NAME</b></td>
					<td  class="tdstyle2"><s:textfield name="REV_name"
							theme="simple" value="%{resultClass.REV_name}"
							cssStyle="width:100px" maxlength="20" /></td>
				</tr>
				

			
				
				<tr>

					<td colspan="2" bgcolor="#FFFFFF"><s:textarea
							name="REV_content" theme="simple"
							value="%{resultClass.REV_content}" cols="100" rows="20" /></td>
				</tr>
				

				<tr>
					<td class="tdstyle2"><b>FILE</b></td>
					<td class="tdstyle2"><s:file name="upload" theme="simple" />
						<s:if test="resultClass.REV_file_orgname != NULL">
        	&nbsp; * <s:property value="resultClass.REV_file_orgname" />������ ��� �Ǿ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
        	</s:if></td>
				</tr>
					 <tr>
			<td bgcolor="#FFFFFF"><font color="#FF0000"></font>PASSWORD</td>
			<td bgcolor="#FFFFFF"><s:textfield name="REV_passwd"
					theme="simple" value="%{resultClass.REV_passwd}"
					cssStyle="width:100px" maxlength="20" /></td>
				</tr>  
				<%-- <tr>
			<td bgcolor="#FFFFF">�������� ���� �� �̿� ����</td>
			<td bgcolor="#FFFFF"><s:textarea name="content" theme="simple"
					value="�� ���������� �������̿� ����
���� ���� �� ����� ����, ���� �� ��ݰ���, ��ǰ��� �Ǵ� û���� �߼�, ȸ������ ���� ���� ����
�� �����Ϸ��� ���������� �׸�
�̸�, �ּ�, ����ó ��
�� ���������� ���� �� �̿� �Ⱓ
ȸ��� �������� ���� �� �̿������ �޼��� �Ŀ��� ���ܾ��� �ش������� �ı��մϴ�.
#���������� ��Ź ó������Ŭ�δ� ���� ����� ���� ������ɿ� ���� ȸ���� ���Ǹ� ��ų� ���� ������ ���� �Ǵ� ���� �� ȸ���� ���������� �ܺο� ��Ź�Ͽ� ó���ϰ� �ֽ��ϴ�. ����Ŭ���� ��������ó�� ��Ź�ڿ� �� ������ ������ ������ �����ϴ�. - ��Ź�� : (��)�糪����Ʈ- ��Ź ���� ���� : īī�� �˸��� �߼� ���� ���� �� �Ϻ� ������¿� ����, ���ڻ�ŷ��Һ��ں�ȣ�� �� 21���� �ǰ� ���»翡 ��������� ���� �˴ϴ�."
					cols="80" rows="10"></s:textarea></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#FFFFFF">�������� ���� �� �̿뿡 �����Ͻʴϱ�? <input
				type="radio" name="objChkBox" value="����">����</input> <input
				type="radio" name="objChkBox" value="���Ǿ���">���Ǿ���</input>
			</td>
		</tr> --%>
				
				
				<input type="hidden" name="REV_member_id" value="${session.M_ID }" />
				
				<tr>
					<td align="right" colspan="2"><input name="submit"
						type="submit" value="OK" class="submit"> <input name="list" type="button"
							value="CANCLE" class="hreflink"
							onClick="javascript:location.href='Review_list.action?currentPage=<s:property value="currentPage"/>'"></td>
				</tr>
			</c:when>
			<c:when test="${session.M_ID == NULL }">
				<tr>
					<td><h4>ȸ�����Ը� ���� �ۼ� ������ �ֽ��ϴ�.</h4></td>
					

				</tr>
				<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
			</c:when>
		</c:choose>
	</table>
	</form>
</body>
</html>