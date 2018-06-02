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
			<td align="center" width="100" >
				<h2><a href="main.action">3T</a></h2>
			</td>
			
			
			<td>
				<a href="listouter.action">outer</a>&nbsp;/
			</td>
			<td>
				<a href="listsuit.action">suit</a>&nbsp;/
			</td>
			<td>
				<a href="listtop.action">top</a>&nbsp;/
			</td>
			<td>
				<a href="listshirt.action">shirt</a>&nbsp;/
			</td>
			<td>
				<a href="listknit.action">knit</a>&nbsp;/
			</td>
			<td>
				<a href="listbottom.action">bottom</a>&nbsp;/
			</td>
			<td>
				<a href="listshoes.action">shoes</a>&nbsp;/
			</td>
			<td>
				<a href="listacc.action">acc</a>&nbsp;/
			</td>
			<td>
				<a href="listperfectline.action">perfectline</a>
			</td>
			
			<td align="center" width="200">
				<a href="UserNoticeList.action">notice</a>
				
				<a href="UserFaqList.action">FAQ</a>
				
				<a href="qna.action">Q&A</a>
				
				<a href="review.action">review</a>
			</td>
			
			
			<s:if test='%{session.M_ID == null}'>
				<td align="right">
					<!--비회원 헤더 카테고리  --> <!--비회원 로그인 폼  경로 잡아줄 것--> <a
					href="login.action" >LOGIN</a> &nbsp;|&nbsp;<a
					href="joinForm.action" >JOIN</a>

				</td>
			</s:if>
			<s:elseif test='%{session.M_ID != null}'>
				<td align="right">
					<!--경로잡을것  --> 
					<a href="main.action">LOGOUT</a> 
					&nbsp;|&nbsp;
					<a href="logout.action">MODIFY</a> 
					&nbsp;|&nbsp;
					<a href="orderList.action">ORDER</a> 
					&nbsp;|&nbsp;
					<a href="basketList.action">MYPAGE</a> 
					&nbsp;&nbsp;
					
				</td>
			</s:elseif>
		
			
			
			
		
	</table>
</body>
</html>