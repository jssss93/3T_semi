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
	<table border=0>
		<tr>
			<td align="center" width="80"><a href="main.action"><h1>3T</h1></a>

			</td>


			<td><a href="listouter.action">outer</a>&nbsp;&nbsp;│</td>
			<td><a href="listsuit.action">suit</a>&nbsp;&nbsp;│</td>
			<td><a href="listtop.action">top</a>&nbsp;&nbsp;│</td>
			<td><a href="listshirt.action">shirt</a>&nbsp;&nbsp;│</td>
			<td><a href="listknit.action">knit</a>&nbsp;&nbsp;│</td>
			<td><a href="listbottom.action">bottom</a>&nbsp;&nbsp;│</td>
			<td><a href="listshoes.action">shoes</a>&nbsp;&nbsp;│</td>
			<td><a href="listacc.action">acc</a>&nbsp;&nbsp;│</td>
			<td><a href="listperfectline.action">perfectline</a></td>

			<td align="center" width="280"><a href="UserNoticeList.action">notice</a>&nbsp;&nbsp;│

				<a href="UserFaqList.action">FAQ</a>&nbsp;&nbsp;│ <a href="qa_listAction.action">Q&A</a>

				&nbsp;&nbsp;│<a href="Review_list.action">review</a></td>


			<s:if test='%{session.M_ID == null}'>
				<td align="right"  width="130">
					<!--비회원 헤더 카테고리  --> <!--비회원 로그인 폼  경로 잡아줄 것--> <a
					href="loginAction.action"><b>LOGIN</b>
						
				</a> &nbsp;|&nbsp;<a href="join1Form.action"><b>JOIN</b></a>

				</td>
			</s:if>
			<s:elseif test='%{session.M_ID != null}'>
					<!--경로잡을것  -->
				<td align="center" width="350">${session.M_ID }님환영합니다<br>
				<a href="logout.action"><b>LOGOUT</b></a> 
               &nbsp;|&nbsp;
               <a href="modifyForm.action"><b>MODIFY</b></a> 
               &nbsp;|&nbsp;
               <a href="OrderMain.action"><b>ORDER</b></a> 
               &nbsp;|&nbsp;
               <a href="MypageForm.action"><b>MYPAGE</b></a> 
               &nbsp;|&nbsp;
               <a href="BasketMain.action"><b>CART</b></a> 
               &nbsp;&nbsp;
               </td>
               </tr>
               </s:elseif>
            </table>
			
	
</body>
</html>
