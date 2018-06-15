<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>등록 상품 상세보기</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
	<style type="text/css">
#form td.tdstyle2 {
	background-color: #000000;
	border: #ccc 1px solid;
	width: 400px;
	padding: 20px;
	font-size: 14px;
	font-weight: bold;
	color: #000;
}
</style>

<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window
				.open(url, name,
						"scrollbars=no, status=no, resizable=no, width=600, height=500");

	}
</script>
</head>

<body>
	<table width="80%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center" class="text01 farmbar"><h2>상세보기</h2></td>
		</tr>
	</table>

	<table width="80%" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>

		<tr>
			<td width="100"><b>번호</b></td>
			<td width="500"><s:property value="resultClass.faq_no" /></td>
		</tr>

		<tr>
			<td width="100"><b>작성자</b></td>
			<td width="500"><s:property value="resultClass.faq_writer" />
			</td>
		</tr>
		<tr>
			<td width="100"><b>제목</b></td>
			<td width="500"><s:property value="resultClass.faq_subject" />
			</td>
		</tr>

		<tr>
			<td width="100"><b>내용</b></td>
			<td width="500">
				<!-- 이렇게도 쓸수 있다는거다 이자식들아 --> ${resultClass.faq_content }
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>

		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>


		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>


		<tr>
			<td colspan="2" align="right"><s:url id="modifyURL"
					action="AFmodifyForm">
					<s:param name="faq_no">
						<s:property value="faq_no" />
					</s:param>
				</s:url> <s:url id="deleteURL" action="AFdeleteAction">
					<s:param name="faq_no">
						<s:property value="faq_no" />
					</s:param>
				</s:url> <input name="modify_b" type="button" value="수정" class="submit"
				onClick="javascript:location.href='AF_Modifyform.action?faq_no=<s:property value="resultClass.faq_no" />&currentPage=<s:property value="currentPage" />','modify'">
				<input name="delete_b" type="button" value="삭제" class="hreflink"
				onClick="javascript:location.href='AF_Delete.action?faq_no=<s:property value="resultClass.faq_no" />&currentPage=<s:property value="currentPage" />','delete'">
				<input name="list_b" type="button" value="목록" class="submit"
				onClick="javascript:location.href='AF_List.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

	</table>
</body>
</html>















