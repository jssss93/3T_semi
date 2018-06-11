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
			<td align="left" width="300" >
				<h1><a href="AD_main.action">3T</a></h1>
				<a href="main.action">(회원용페이지로이동)</a>
			</td>
			
			
			
			<td>
				<a href="AM_List.action">회원목록</a>&nbsp;|
			</td>
			<td>
				<a href="AG_List.action">상품목록</a>&nbsp;|
			</td>
			<td>
				<a href="AN_List.action">공지사항</a>&nbsp;|	
			</td>
			<td>
				<a href="AF_List.action">FAQ</a>&nbsp;|
			</td>
			<td>
				<a href="AQ_List.action">QA(아직)</a>&nbsp;|
			</td>
			<td>
				<a href="AO_List.action">주문목록</a>&nbsp;
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
					${session.M_ID } 님 환영합니다.</td>
				<td align="right">
				
				
					<!--경로잡을것  --> 
					<a href="AD_logout.action">LOGOUT</a> 
					&nbsp;|&nbsp;
					(관리자모드) 
					
				</td>
			</s:elseif>
		
			
			
			
		
	</table>
</body>
</html>