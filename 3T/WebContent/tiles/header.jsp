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
.h1 { font-family: times; font-size: 15px; color: #000000; }
.h2 { font-family: times; font-size: 40px; color: #000000;}
.zzzzz { font-size: 40px; color: #000000;}
.qqqqq { font-size: 15px; color: #000000;}
</style>
</head>
<body>
	<table border="0" height="100" width="85%">
		<tr>
			<td align="center" width="80"><a href="main.action"><strong class="zzzzz">3T</strong></a>

			</td>

			<td width="50"></td>
			<td width="60" align="center"><a href="listouter.action"><strong class="qqqqq">OUTER</strong></a></td>
			<td width="60" align="center"><a href="listsuit.action"><strong class="qqqqq">SUIT</strong></a></td>
			<td width="60" align="center"><a href="listtop.action"><strong class="qqqqq">TOP</strong></a></td>
			<td width="60" align="center"><a href="listshirt.action"><strong class="qqqqq">SHIRT</strong></a></td>
			<td width="60" align="center"><a href="listknit.action"><strong class="qqqqq">KNIT</strong></a></td>
			<td width="60" align="center"><a href="listbottom.action"><strong class="qqqqq">&nbsp;&nbsp;BOTTOM&nbsp;&nbsp;</strong></a></td>
			<td width="60" align="center"><a href="listshoes.action"><strong class="qqqqq">SHOES</strong></a></td>
			<td width="60" align="center"><a href="listacc.action"><strong class="qqqqq">ACC</strong></a></td>
			<td width="60" align="center"><a href="listperfectline.action"><strong class="qqqqq">PERFECTLINE</strong></a></td>
			<td width="50"></td>

			<td align="center" width="60"><a href="UserNoticeList.action"><strong class="qqqqq">NOTICE</strong></a></td> 
			<td width="60" align="center"><a href="UserFaqList.action"><strong class="qqqqq">FAQ</strong></a></td>
			<td width="60" align="center"><a href="qa_listAction.action"><strong class="qqqqq">Q&A</strong></a></td>
			<td width="60" align="center"><a href="Review_list.action"><strong class="qqqqq">REVIEW</strong></a></td>


			<s:if test='%{session.M_ID == null}'>
				<td align="center"  width="350">
					<!--비회원 헤더 카테고리  --> <!--비회원 로그인 폼  경로 잡아줄 것--> <a
					href="loginAction.action"><strong class="qqqqq">LOGIN</strong>
						
				</a> &nbsp;&nbsp;<a href="join1Form.action"><strong class="qqqqq">JOIN</strong></a>

				</td>
				<td width="30"></td>
			</s:if>
			<s:elseif test='%{session.M_ID != null}'>
					<!--경로잡을것  -->
				<td align="center" width="500"><strong class="qqqqq">${session.M_ID }님환영합니다</strong><br>
				<a href="logout.action"><strong class="qqqqq">LOGOUT</strong></a> 
               &nbsp;/&nbsp;
               <a href="modifyForm.action"><strong class="qqqqq">MODIFY</strong></a> 
               &nbsp;/&nbsp;
               <a href="OrderMain.action"><strong class="qqqqq">ORDER</strong></a> 
               &nbsp;/&nbsp;
               <a href="MypageForm.action"><strong class="qqqqq">MYPAGE</strong></a> 
               &nbsp;/&nbsp;
               <a href="BasketMain.action"><strong class="qqqqq">CART</strong></a> 
               &nbsp;&nbsp;
               </td>
               </tr>
               </s:elseif>
            </table>
			
	
</body>
</html>
