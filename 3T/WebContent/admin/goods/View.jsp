<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>등록 상품 상세보기</title>
<link rel="stylesheet" href="/3T/common/css/css.css" type="text/css">

<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=600, height=500");
		
	}
</script>
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>스트럿츠 게시판</h2></td>
	</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		
		<tr>
			<td width="100">번호</td>
			<td width="500">
				<s:property value="resultClass.goods_no" />
			</td>
		</tr>
		
		<tr>
			<td width="100">상품명</td>
			<td width="500">
				<s:property value="resultClass.goods_name" />
			</td>
		</tr>
		
		<tr>
			<td width="100">내용</td>
			<td width="500">
			<!-- 이렇게도 쓸수 있다는거다 이자식들아 -->
				${resultClass.goods_content }
			</td>
		</tr>
		<tr>
			<td width="100">색상</td>
			<td width="500">
				<s:property value="resultClass.goods_color" />
			</td>
		</tr>
		<tr>
			<td width="100">조회수</td>
			<td width="500">
				<s:property value="resultClass.goods_readcnt" />
			</td>
		</tr>
		<tr>
			<td width="100">등록날짜</td>
			<td width="500">
				<s:property value="resultClass.goods_reg_date" />
			</td>
		</tr>
		<tr>
			<td width="100">사진</td>
			<td width="500">
				이미지 삽입해야지
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" height="10">
				
			</td>
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
				<s:url id="modifyURL" action="modifyForm">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url>
				<s:url id="deleteURL" action="deleteAction">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url>
				<input name="modify_b" type="button" value="수정" class="inputb" onClick="javascript:open_win_noresizable('modifyForm.action?goods_no=<s:property value="resultClass.goods_no" />&currentPage=<s:property value="currentPage" />','modify')">
				<input name="delete_b" type="button" value="삭제" class="inputb" onClick="javascript:open_win_noresizable('deleteAction.action?goods_no=<s:property value="resultClass.goods_no" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list_b" type="button" value="목록" class="inputb" onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
		
	</table>
</body>
</html>















