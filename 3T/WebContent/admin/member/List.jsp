<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	<table width="80%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="30"></td>
		</tr>
		<tr>
			<td align="center" class="text01 formbar">
			<s:if test="index=3"><h2>Member List.</h2></s:if>
			<s:else><h2>VIP List.</h2></s:else>
			</td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>

	<table width="60%" border="0" cellspacing="0" cellpadding="2">
	
		<tr align="center">
			<td width="100" fontsize="1.2em"><strong>NO.</strong></td>
			<td width="100"><strong>NAME</strong></td>
			<td width="100"><strong>ID<br>[회원등급]</strong></td>
			<td width="100"><strong>TEL.</strong></td>
			<td width="100"><strong>TOTAL COUNT</strong></td>
			<td width="100"><strong>가입날짜</strong></td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="8"></td>
		</tr>

		<s:iterator value="list" status="stat">
			<s:url id="viewURL" action="AM_View">
				<s:param name="m_no">
					<s:property value="m_no" />
				</s:param>
				<s:param name="m_id">
					<s:property value="m_id" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr>
				<td align="center"><s:property value="m_no" /></td>
				<td align="center"><s:a href="%{viewURL}">
						<s:property value="m_name" />
					</s:a></td>
				<td align="center"><s:a href="%{viewURL}">
						<s:property value="m_id" /><br>[
						<s:if test="m_admin==0">ADMIN</s:if>
						<s:elseif test="m_admin==1">SILVER</s:elseif>
						<s:elseif test="m_admin==2">GOLD</s:elseif>
						<s:elseif test="m_admin==3">VIP</s:elseif>
						]
					</s:a></td>
				<td align="center"><s:property value="m_phone" /></td>
				<td align="center"><s:property value="m_total" /></td>
				<td align="center"><s:property value="m_regdate" /></td> 
			</tr>

			<tr bgcolor="#777777">
				<td height="1" colspan="8"></td>
			</tr>

		</s:iterator>

		<s:if test="list.size() <= 0">
			<tr>
				<td colspan="5" align="center">등록된 회원이 없습니다</td>
			</tr>
		</s:if>

		<tr align="center">
			<td colspan="6"><s:property value="PagingHtml" escape="false" /></td>
		</tr>

		<tr align="right">
			<td colspan="6"></td>
		</tr>

		<tr align="center">
			<td colspan="6">
				<form>
					<select name="searchNum" style="width: 100px; height: 30px;">
						<option value="0">이름</option>
						<option value="1">ID</option>

					</select>
					<s:textfield name="searchKeyword" theme="simple" value=""
						cssStyle="width:200px; height:30px;" maxlength="20" />
					<input name="submit" type="submit" value="검색" class="submit">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>











