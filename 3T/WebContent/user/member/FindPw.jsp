<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form name="hi" action="findPwAction.action">

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" style="padding-top: 50px; padding-bottom: 50px;">

					<table width="600" height="250" border="0" class="findform">
						<tr>
							<td align="center"><h2>비밀번호 찾기</h2></td>
						</tr>
						<tr>
							<td align="center" style="padding-bottom: 20px;">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="formtext">아이디</td>
										<td height="35"><input type="text" name="M_ID" size="17"
											style="width: 230px; height: 26px;"></td>
									</tr>
									<tr>
										<td class="formtext">주민등록번호</td>
										<td valign="middle"><input type="text" name="M_JUMIN1"
											size="6" maxlength="6"> - <input type="text"
											name="M_JUMIN2" size="7" maxlength="7"></td>

									</tr>
								</table>
						</tr>
						<tr>
							<td align="center" style="padding-bottom: 30px;"><input
								type="submit" value="비밀번호 찾기" class="submit"></td>
						</tr>


					</table> <!-- 결과값 띄우기 -->
					<table>
						<s:if test="resultClass.M_PASSWD != null">
							<td>RESULT&nbsp;:&nbsp;</td>
							<td align="left"><br> <b><s:property value="resultClass.M_NAME" /></b>
								님의 PW는 <b><s:property value="resultClass.M_PASSWD" /></b>입니다.<br>&nbsp;</td>
							<td align="middle"><a align="middle" href="login.action"
								class="login">&nbsp;&nbsp;로그인폼으로&nbsp;&nbsp;</a></td>
						</s:if>
						<s:else>
							<td></td>
							<td></td>
							<td align="middle"><a align="middle" href="login.action"
								class="login">&nbsp;&nbsp;로그인폼으로&nbsp;&nbsp;</a></td>
						</s:else>
						</tr>

					</table>

				</td>
			</tr>
		</table>
	</form>

</body>
</html>
