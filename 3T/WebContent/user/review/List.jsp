<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>REVIEW</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
	<style type="text/css">
#form td.tdstyle2 {background-color :#000000; border:#ccc 1px solid; width:400px; padding:20px; font-size:14px; font-weight:bold; color:#000;}

</style>
</head>

<body>

	<table width="600" border="0" cellspacing="0" cellpadding="1"
		align="center">
		<tr>
			<td height="50"></td>
		</tr>
		<tr>
			<td align="center" class="text01 formbar">REVIEW</td>

		</tr>
		<tr>
			<td height="50"></td>
		</tr>
		<tr>
			<td height="1" colspan="4"></td>
		</tr>


		<table width="600" border="0" cellspacing="0" cellpadding="1"
			align="center">
			<tr align="center">
				<td width="50" align="center" ><strong>NO</strong></td>
				<td width="150" align="center" class="tdstyle1"><strong>ITEM
				</strong></td>
				<td width="350" align="center" class="tdstyle1"><strong>SUBJECT</strong></td>
				<td width="50" align="center" class="tdstyle1"><strong>NAME</strong></td>

			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="4"></td>
			</tr>

			<s:iterator value="list" status="stat">
				<!-- listAction에서의 Arraylist에 넣어논걸 for문을 돌려 한줄한줄 꺼낸다 -->

				<s:url id="viewURL" action="Review_View">
					<s:param name="REV_no">
						<s:property value="REV_no" />
					</s:param>
					<s:param name="currentPage">
						<s:property value="currentPage" />
					</s:param>
				</s:url>


				<tr align="center">
					<td class="tdstyle2"><s:property value="REV_no" /></td>
					<td align="center">&nbsp; <img
						src="/3T/upload/${REV_file_savname}" width="50" height="50"></td>



					<td align="center">&nbsp; <s:if test="REV_re_level != 0">
							<c:forEach var="i" begin="${REV_re_level}" end="0">&nbsp;</c:forEach>→
            </s:if> <s:a href="%{viewURL}">
							<s:property value="REV_subject" />

						</s:a></td>
					<td align="center"><s:property value="REV_name" /></td>

				</tr>
				<tr bgcolor="#777777">
					<td height="1" colspan="5"></td>
				</tr>

			</s:iterator>



			<s:if test="list.size() <= 0">
				<!-- list에 들어있는게 없다면 -->

				<tr bgcolor="#FFFFFF" align="center">
					<td colspan="5">등록된 게시물이 없습니다.</td>
				</tr>
				<tr bgcolor="#777777">
					<td height="1" colspan="5"></td>
				</tr>

			</s:if>


			<tr align="center">
				<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
			</tr>


			<tr align="center">
				<td colspan="5">
					<form>
						<select name="searchNum" style="width: 100px; height: 30px;">
							<option value="0">작성자</option>
							<option value="1">제목</option>

						</select>
						<s:textfield name="searchKeyword" theme="simple" value=""
							cssStyle="width:200px; height:30px;" maxlength="20" />
						<input name="submit" type="submit" value="SEARCH" class="submit">
							
					</form>
				</td>
			</tr>
			<tr>

				<td colspan="5" align="center"><input type="button" value="WRITE"
					class="hreflink"
					onClick="javascript:location.href='ReviewWriteForm.action?currentPage=<s:property value="currentPage" />';"></td>
			</tr>




		</table>
</body>
</html>