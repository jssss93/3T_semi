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
<style>
.h1 {font-style: italic; font-family: times; font-size: 15px; color: #000000; }
.h2 {font-style: italic; font-family: times; font-size: 40px; color: #000000;}
</style>
</head>
<body>
	<table border="0" height="100" width="80%">
		<tr>
			<td align="center" width="80"><a href="main.action"><h1 class="h2">3T</h1></a>

			</td>

			<td width="50"></td>
			<td width="60" align="center"><a href="listouter.action"><h1 class="h1">OUTER</h1></a></td>
			<td width="60" align="center"><a href="listsuit.action"><h1 class="h1">SUIT</h1></a></td>
			<td width="60" align="center"><a href="listtop.action"><h1 class="h1">TOP</h1></a></td>
			<td width="60" align="center"><a href="listshirt.action"><h1 class="h1">SHIRT</h1></a></td>
			<td width="60" align="center"><a href="listknit.action"><h1 class="h1">KNIT</h1></a></td>
			<td width="60" align="center"><a href="listbottom.action"><h1 class="h1">&nbsp;&nbsp;BOTTOM&nbsp;&nbsp;</h1></a></td>
			<td width="60" align="center"><a href="listshoes.action"><h1 class="h1">SHOES</h1></a></td>
			<td width="60" align="center"><a href="listacc.action"><h1 class="h1">ACC</h1></a></td>
			<td width="60" align="center"><a href="listperfectline.action"><h1 class="h1">PERFECTLINE</h1></a></td>
			<td width="80"></td>

			<td align="center" width="60"><a href="UserNoticeList.action"><h1 class="h1">NOTICE</h1></a></td> 
			<td width="60" align="center"><a href="UserFaqList.action"><h1 class="h1">FAQ</h1></a></td>
			<td width="60" align="center"><a href="qa_listAction.action"><h1 class="h1">Q&A</h1></a></td>
			<td width="60" align="center"><a href="Review_list.action"><h1 class="h1">REVIEW</h1></a></td>


			<s:if test='%{session.M_ID == null}'>
				<td align="center"  width="350">
					<!--비회원 헤더 카테고리  --> <!--비회원 로그인 폼  경로 잡아줄 것--> <a
					href="loginAction.action"><i class="h1">LOGIN</i>
						
				</a> &nbsp;&nbsp;<a href="join1Form.action"><i class="h1">JOIN</i></a>

				</td>
				<td width="30"></td>
			</s:if>
			<s:elseif test='%{session.M_ID != null}'>
					<!--경로잡을것  -->
				<td align="center" width="500"><b class="h1">${session.M_ID }님환영합니다</b><br>
				<a href="logout.action"><i class="h1">LOGOUT</i></a> 
               &nbsp;/&nbsp;
               <a href="modifyForm.action"><i class="h1">MODIFY</i></a> 
               &nbsp;/&nbsp;
               <a href="OrderMain.action"><i class="h1">ORDER</i></a> 
               &nbsp;/&nbsp;
               <a href="MypageForm.action"><i class="h1">MYPAGE</i></a> 
               &nbsp;/&nbsp;
               <a href="BasketMain.action"><i class="h1">CART</i></a> 
               &nbsp;&nbsp;
               </td>
               </tr>
               </s:elseif>
            </table>
			
	
</body>
</html>
