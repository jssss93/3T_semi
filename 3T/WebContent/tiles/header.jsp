<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/3T/user/notice/common/css/css.css"
	type="text/css">
</head>
<body>
	<table border=0 width="1300">
		<tr>
			<td align="center" width="100"><a href="main.action"><h1>
						3T
						<h1></a></td>



			<td align="center"><a href="listouter.action"><b>outer</b></a>&nbsp;&nbsp;│
			</td>
			<td><a href="listsuit.action"><b>suit</b></a>&nbsp;&nbsp;│</td>
			<td><a href="listtop.action"><b>top</b></a>&nbsp;&nbsp;│</td>
			<td><a href="listshirt.action"><b>shirt</b></a>&nbsp;&nbsp;│</td>
			<td><a href="listknit.action"><b>knit</b></a>&nbsp;&nbsp;│</td>
			<td><a href="listbottom.action"><b>bottom</b></a>&nbsp;&nbsp;│</td>
			<td><a href="listshoes.action"><b>shoes</b></a>&nbsp;&nbsp;│</td>
			<td><a href="listacc.action"><b>acc</b></a>&nbsp;&nbsp;│</td>
			<td><a href="listperfectline.action"><b>perfectline</b></a></td>

			<td align="center" width="300"><a href="UserNoticeList.action"><b>notice</b></a>&nbsp;│

				<a href="UserFaqList.action"><b>FAQ</b></a>&nbsp;│ <a
				href="qa_listAction.action"><b>Q&A</b></a>&nbsp;│ <a
				href="Review_list.action"><b>review</b></a>&nbsp;</td>


			<s:if test='%{session.M_ID == null}'>
				<td align="right">
					<!--비회원 헤더 카테고리  --> <!--비회원 로그인 폼  경로 잡아줄 것--> <a
					href="loginAction.action">LOGIN
						<form action=""></form>
				</a> &nbsp;|&nbsp;<a href="join1Form.action">JOIN</a>

				</td>
			</s:if>
			<s:elseif test='%{session.M_ID != null}'>

				<!--경로잡을것  -->
				<td align="right">${session.M_ID }님환영합니다</td>


				</form>
	</table>
	<table border="0" width="1500">
		<td align="right"><a href="logout.action"><b>LOGOUT</b></a>
			&nbsp;|&nbsp; <a href="modifyForm.action"><b>MODIFY</b></a> &nbsp;|&nbsp; <a
			href="OrderMain.action"><b>ORDER</b></a> &nbsp;|&nbsp; <a
			href="MypageForm.action"><b>MYPAGE</b></a> &nbsp;&nbsp;</td>
	</table>

	</s:elseif>






</body>
</html>