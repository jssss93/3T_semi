<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="EUC-KR" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>FAQ</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
	<style type="text/css">
#form td.tdstyle2 {background-color :#000000; border:#ccc 1px solid; width:400px; padding:20px; font-size:14px; font-weight:bold; color:#000;}

</style>
</head>

<body>
	<table width="60%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="50"></td>
		</tr>
		<tr>
			<td align="center" class="text01 formbar"><h2>FAQ</h2></td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>

	<table width="60%" border="0" cellspacing="0" cellpadding="2" id="form">
		<tr align="center">
			<td width="50" align="center"><strong>NO</strong></td>
			<td width="850" align="center"><strong></strong></td>
			<td width="50" align="center"><strong>작성자</strong></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="3"></td>
		</tr>

		<s:iterator value="list" status="stat">
			<!-- http://localhost:8080/StrutsBoard/viewAction.action?no=2&currentPage=1 -->
			<s:url id="viewURL" action="UserFaqView">
				<s:param name="FAQ_NO">
					<s:property value="FAQ_NO" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr align="center">
				<td><s:property value="FAQ_NO" /></td>
				<td align="center">&nbsp;<s:a href="%{viewURL}">
						<s:property value="FAQ_SUBJECT" />
					</s:a></td>
				<td align="center"><s:property value="FAQ_WRITER" /></td>
			</tr>


		</s:iterator>

		<s:if test="list.size() <= 0">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="3
		   	  	">등록된 게시물이 없습니다.</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="3"></td>
			</tr>
		</s:if>
	</table>
	
	<table  width="1000" border="0" cellspacing="0" cellpadding="2">
		<tr height="50" align="center">
			<td colspan="3"><s:property value="pagingHtml" escape="false" /></td>
		</tr>
		
		<tr align="center">
			<td colspan="3">
				<form>
					<select name="searchNum" Style="width:100px; height:30px;">
						<option value="0">작성자</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
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











