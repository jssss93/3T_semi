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
							<td align="center"><h2>아이디 찾기</h2></td>
						</tr>
						<tr>
							<td align="center" style="padding-bottom: 20px;">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="formtext">이름</td>
										<td height="35"><input type="text" name="M_NAME"
											size="17" style="width: 230px; height: 26px;"></td>
									</tr>
									<tr>
										<td class="tdstyle1">이메일</td>
										<td valign="middle"><input name="M_EMAIL1" id="M_EMAIL1" size="15"> @ <input
											name="M_EMAIL2" type="text" class="box" id="M_EMAIL2"
											size="20"> <select name="email3" class="box"
											id="email_select" onChange="checkemailaddy();">
												<option value="" selected>선택하세요</option>
												<option value="naver.com">naver.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="hanmail.com">hanmail.com</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
												<option value="1">직접입력</option>
										</select>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center" style="padding-bottom: 30px;"><input
								type="submit" value="아이디찾기" class="submit"></td>
						</tr>


					</table> <!-- 결과값 띄우기 -->
					</form>
					<table>
						<s:if test="resultClass.M_ID != null">
							<td>RESULT&nbsp;:&nbsp;</td>

							<td align="left"><br> <b><s:property
										value="resultClass.M_NAME" /></b> 님의 ID는 <b><s:property
										value="resultClass.M_ID" /></b>입니다.<br>&nbsp;</td>
							<td align="middle"><a align="middle" href="loginForm.action"
								class="login">&nbsp;&nbsp;로그인폼으로&nbsp;&nbsp;</a></td>
						</s:if>
						<s:else>

							<td></td>
							<td></td>
							<td align="middle"><a align="middle" href="login.action"
								class="login">&nbsp;&nbsp;로그인폼으로&nbsp;&nbsp;</a></td>


						</s:else>


					</table>

				</td>
			</tr>
		</table>
</body>
</html>
