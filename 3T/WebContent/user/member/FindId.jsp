<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="Javascript">
	function checkemailaddy() {
		if (hi.email3.value == '1') {
			hi.M_EMAIL2.readonly = false;
			hi.M_EMAIL2.value = '';
			hi.M_EMAIL2.focus();
		} else {
			hi.M_EMAIL2.readonly = true;
			hi.M_EMAIL2.value = hi.email3.value;
		}
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form name="hi" action="findIdAction.action">

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" style="padding-top: 50px; padding-bottom: 50px;">

					<table width="600" height="250" border="0" class="findform">
						<tr>
							<td align="center"><h2>���̵� ã��</h2></td>
						</tr>
						<tr>
							<td align="center" style="padding-bottom: 20px;">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="formtext">�̸�</td>
										<td height="35"><input type="text" name="M_NAME"
											size="17" style="width: 230px; height: 26px;"></td>
									</tr>
									<tr>
										<td class="tdstyle1">�̸���</td>
										<td valign="middle"><input name="M_EMAIL1" id="M_EMAIL1" size="15"> @ <input
											name="M_EMAIL2" type="text" class="box" id="M_EMAIL2"
											size="20"> <select name="email3" class="box"
											id="email_select" onChange="checkemailaddy();">
												<option value="" selected>�����ϼ���</option>
												<option value="naver.com">naver.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="hanmail.com">hanmail.com</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
												<option value="1">�����Է�</option>
										</select>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center" style="padding-bottom: 30px;"><input
								type="submit" value="���̵�ã��" class="submit"></td>
						</tr>


					</table> <!-- ����� ���� -->
					</form>
					<table>
						<s:if test="resultClass.M_ID != null">
							<td>RESULT&nbsp;:&nbsp;</td>

							<td align="left"><br> <b><s:property
										value="resultClass.M_NAME" /></b> ���� ID�� <b><s:property
										value="resultClass.M_ID" /></b>�Դϴ�.<br>&nbsp;</td>
							<td align="middle"><a align="middle" href="loginForm.action"
								class="login">&nbsp;&nbsp;�α���������&nbsp;&nbsp;</a></td>
						</s:if>
						<s:else>

							<td></td>
							<td></td>
							<td align="middle"><a align="middle" href="login.action"
								class="login">&nbsp;&nbsp;�α���������&nbsp;&nbsp;</a></td>


						</s:else>


					</table>

				</td>
			</tr>
		</table>
</body>
</html>
