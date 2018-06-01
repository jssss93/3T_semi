<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
</head>

<center>
	<body>

		<form method="post" action="logon.action">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center" height="425">

						<table width="520" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center" style="padding-bottom: 50px;">,
									<h2>로그인</h2>
								</td>
							</tr>
							<tr>
								<td align="center" class="formbar"><table>
										<tr>
											<td><table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td class="text01" style="padding-right: 15px;">아이디</td>
														<td height="35"><input type="text" name="M_ID"
															size="17" style="width: 230px; height: 26px;"></td>
													</tr>
													<tr>
														<td class="text01" style="padding-right: 15px;">비밀번호</td>
														<td height="35"><input type="password"
															name="M_PASSWD" size="17"
															style="width: 230px; height: 26px;"></td>
													</tr>
													<tr>
														<td style="padding-top: 30px;">
															*<a href="findIdForm.action">Forgot id? </a>&nbsp&nbsp*
															<a href="findPwForm.action"> Forgot password?</a>
														</td>
													</tr>
												</table>
									</table>
							</tr>
							<tr>
								<td align="center" style="padding-top: 30px;"><table>
										<trcolor="gray"> <font color="gray"> <input
											type="submit" value="LOGIN"
											onclick="document.location.href='logon.action'">&nbsp&nbsp&nbsp
											<input type="button" value="JOIN US"
											onclick="document.location.href='join1.action'">
										</font>
										</tr>
									</table></td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</form>

	</body>
</center>
</html>