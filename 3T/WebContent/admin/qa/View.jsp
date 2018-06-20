<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>등록 상품 상세보기</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=600, height=500");
		
	}
</script>
</head>

<body>
	<table width="80%" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td height="30"></td>
	</tr>
	<tr>
		<td align="center" class="text01 formbar"><h2>QA 상세보기</h2></td>
	</tr>
	<tr>
			<td height="50"></td>
	</tr>
	</table>

	<table width="60%" border="0" cellspacing="0" cellpadding="0" >
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td width="100" align="center">번호</td>
			<td width="500">
			${resultClass.qa_no } 
			</td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
		<tr>
			<td width="100" align="center">ID[이름]</td>
			<td width="500">
			${resultClass.qa_member_id } [ ${resultClass.qa_name } ]
			</td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
		
		<tr>
			<td width="100" align="center">제목</td>
			<td width="500">
			<!-- 이렇게도 쓸수 있다는거다 이자식들아 -->
				${resultClass.qa_subject }
			</td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
		
		<tr>
			<td width="100" align="center">내용</td>
			<td width="500">
			<!-- 이렇게도 쓸수 있다는거다 이자식들아 -->
				${resultClass.qa_content }
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="20"></td>
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
			<td colspan="2" align="right">
				<s:url id="modifyURL" action="AQ_Modify">
					<s:param name="qa_no">
						<s:property value="qa_no" />
					</s:param>
				</s:url>
				<s:url id="deleteURL" action="AQ_Delete">
					<s:param name="qa_no">
						<s:property value="qa_no" />
					</s:param>
				</s:url>
				<input name="modify_b" type="button" value="수정" class="submit" onClick="javascript:location.href='AQ_ModifyForm.action?qa_no=<s:property value="resultClass.qa_no" />&currentPage=<s:property value="currentPage" />','modify'">
				<input name="delete_b" type="button" value="삭제" class="hreflink" onClick="javascript:location.href='AQ_Delete.action?qa_no=<s:property value="resultClass.qa_no" />&currentPage=<s:property value="currentPage" />','delete'">
				<input name="list_b" type="button" value="목록" class="submit" onClick="javascript:location.href='AQ_List.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
		
	</table>
</body>
</html>















