<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
	function check() {

		var f = document.Reg_form;

		if (f.M_ID.value == "") {
			alert("���̵� �Է����ֽʽÿ�");
			f.M_ID.focus();
			return false;
		}
	

		if (f.M_PASSWD.value == "") {
			alert("��й�ȣ�� �Է����ֽʽÿ�");
			f.M_PASSWD.focus();
			return false;
		}

		if (f.M_PASSWD.value != f.M_PASSWD2.value) {
			alert("�����ȣ�� �ٸ��� �Է��߽��ϴ�.");
			f.M_PASSWD2.select();
			return false;
		}

		if (f.M_NAME.value == "") {
			alert("�̸��� �Է����ֽʽÿ�");
			f.M_NAME.focus();
			return false;
		}

		if (f.M_JUMIN1.value == "") {
			alert("�ֹε�Ϲ�ȣ�� �Է����ֽʽÿ�");
			f.M_JUMIN1.focus();
			return false;
		}

		if (f.M_JUMIN2.value == "") {
			alert("�ֹε�Ϲ�ȣ�� �Է����ֽʽÿ�");
			f.M_JUMIN2.focus();
			return false;
		}

		if (f.M_ZIPCODE.value == "") {
			alert("�����ȣ�� �˻��Ͽ� �Է����ֽʽÿ�");
			f.M_ZIPCODE.focus();
			return false;
		}

		if (f.M_ADDR1.value == "") {
			alert("�⺻�ּҸ� �Է����ֽʽÿ�");
			f.M_ADDR1.focus();
			return false;
		}

		if (f.M_ADDR2.value == "") {
			alert("���ּҸ� �Է����ֽʽÿ�");
			f.M_ADDR2.focus();
			return false;
		}

		if (f.M_PHONE.value == "") {
			alert("��ȭ��ȣ�� �Է����ֽʽÿ�");
			f.phone.focus();
			return false;
		}

		if (f.M_EMAIL.value == "") {
			alert("�̸����� �Է����ֽʽÿ�");
			f.M_EMAIL.focus();
			return false;
		}

	}

	function openConfirmId() {
		var url = "memberIdCheck.action?id=" + document.Reg_form.id.value;
		var f = document.Reg_form; //����.Form name="";
		var idPs = /^[0-9a-zA-Z]{4,12}$/; //���̵� ��й�ȣ üũǥ����
		if (f.id.value == "") {
			alert("���̵� �Է����ּ���.");
			f.id.focus();
			return false;
		}

		open(
				url,
				"confirm",
				"toolbar=no, location=no, status=co, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script language="Javascript">
	function checkemailaddy() {
		if (mypageUpdate.email3.value == '1') {
			mypageUpdate.M_EMAIL2.readonly = false;
			mypageUpdate.M_EMAIL2.value = '';
			mypageUpdate.M_EMAIL2.focus();
		} else {
			mypageUpdate.M_EMAIL2.readonly = true;
			mypageUpdate.M_EMAIL2.value = mypageUpdate.email3.value;
		}
	}
</script>



<script>
	function DaumPostcode() {

		new daum.Postcode(
				{

					oncomplete : function(data) {

						// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

						// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.

						// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.

						var fullAddr = ''; // ���� �ּ� ����

						var extraAddr = ''; // ������ �ּ� ����

						// ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.

						if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���

							fullAddr = data.roadAddress;

						} else { // ����ڰ� ���� �ּҸ� �������� ���(J)

							fullAddr = data.jibunAddress;

						}

						// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.

						if (data.userSelectedType === 'R') {

							//���������� ���� ��� �߰��Ѵ�.

							if (data.bname !== '') {

								extraAddr += data.bname;

							}

							// �ǹ����� ���� ��� �߰��Ѵ�.

							if (data.buildingName !== '') {

								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);

							}

							// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.

							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');

						}

						// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.

						document.getElementById('M_ZIPCODE').value = data.zonecode; //5�ڸ� �������ȣ ���

						document.getElementById('M_ADDR1').value = fullAddr;

						// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.

						document.getElementById('M_ADDR2').focus();

					}

				}).open();

	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form name="mypageUpdate" action="modifyAction.action" method="post"
		onsubmit="return check()">


		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" style="padding: 50px;">
					<table width="700" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="40" align="center" class="text01 formbar" colspan="2">ȸ����������</td>
						</tr>
						<tr>
							<td height="60"></td>
						</tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0"
						id="form">
						<tr>
							<td align="left" class="tdstyle2" colspan="2">�⺻����</td>
						</tr>
						<tr>
							<td class="tdstyle1">���̵�<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><s:property value="%{resultClass.M_ID}" />
						</tr>
						<tr>
							<td class="tdstyle1">��й�ȣ<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td><input type="password" name="M_PASSWD" size="30"	onfocus="on(this)" onblur="off(this)">
						 <font class="BFONT">����/���ڸ� �̿��Ͽ� 4~12�ڷ� �Է��ϼ���</font></td>
						</tr>
						<tr>
							<td class="tdstyle1">��й�ȣȮ��<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><input type="password" name="M_PASSWD2" size="30" onfocus="on(this)" onblur="off(this)">
						<font class="BFONT">��й�ȣ�� ���Է� ���ּ���</font></td>
						</tr>
						<tr>
							<td class="tdstyle1">�� ��<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><s:property value="%{resultClass.M_NAME}" />
							</td>
						</tr>
						<tr>
							<td class="tdstyle1">�ֹε�Ϲ�ȣ<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><s:property
									value="%{resultClass.M_JUMIN1}" /> - <s:property
									value="%{resultClass.M_JUMIN2}" /></td>
						</tr>
						<tr>
							<td class="tdstyle1">�����ȣ<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>

							<td valign="middle"><s:textfield name="M_ZIPCODE"
									id="M_ZIPCODE" theme="simple" value="%{resultClass.M_ZIPCODE}" />
								<input type="button" value="�˻�" onclick="DaumPostcode()">
								�˻� ��ư�� ���� �ּҸ� �Է��� �ּ���</td>
						</tr>
						<tr>
							<td class="tdstyle1">�� ��<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>

							<td valign="middle"><s:textfield name="M_ADDR1" id="M_ADDR1"
									theme="simple" value="%{resultClass.M_ADDR1}" /> <br> <s:textfield
									name="M_ADDR2" id="M_ADDR2" theme="simple"
									value="%{resultClass.M_ADDR2}" /></td>
						</tr>

						<tr>
							<td class="tdstyle1">�޴�����ȣ<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><s:textfield name="M_PHONE"
									theme="simple" value="%{resultClass.M_PHONE}" /> "-" ���� ���ڸ�
								�Է��ϼ���</td>
						</tr>
						
						<tr>
							<td class="tdstyle1">�̸���<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif">
								</td>
							<td valign="middle">
							<s:textfield name="M_EMAIL1" id="M_EMAIL1" theme="simple" value="%{resultClass.M_EMAIL1}" /> @ 
							<s:textfield name="M_EMAIL2" id="M_EMAIL2" theme="simple" value="%{resultClass.M_EMAIL2}" />
								<select name="email3"  id="email3"
								onChange="checkemailaddy();">
									<option value="" selected>�����ϼ���</option>
									<option value="naver.com">naver.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="hanmail.com">hanmail.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="1">�����Է�</option>
									
							</select>
							</td>
						</tr>
						


					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0"
						id="form">

						<tr>
							<td align="left" class="tdstyle2" colspan="2">ȸ���߰�����</td>
						</tr>
						<tr>
							<td class="tdstyle1">ȯ�Ұ��� ����<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle">������<s:textfield name="M_DEPOSITOR" theme="simple"
							value="%{resultClass.M_DEPOSITOR}" /><br> <br> �����<s:textfield name="M_NAME_BANK" theme="simple"
							value="%{resultClass.M_NAME_BANK}" /> <br><br> ���¹�ȣ<s:textfield name="ACCOUNT_NO" theme="simple"
							value="%{resultClass.ACCOUNT_NO}" /><br>
							</td>

						</tr>

						</td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="border: 0px;"><input
								type="submit" value="����" class="submit"><input
								type="button" value="�� ��" onclick="history.go(-1)"
								class="hreflink">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<input type="button" value="ȸ��Ż��" onclick="document.location.href='deleteAction.action'"
								class="submit">
								</td>
								
						</tr>
					</table>


					</form>
</body>
</html>