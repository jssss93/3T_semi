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
	background: #2bae9f;
	border: #ccc 1px solid;
	width: 400px;
	padding: 20px;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
}

#form td.tdstyle1 {
	background: #eee;
	width: 120px;
	text-align: left;
	vertical-align: middle;
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
			<td align="center" class="text01 formbar"><h2>등록상품 상세보기</h2></td>
		</tr>
	</table>
	<br>

	<table width="80%" border="0" cellspacing="0" cellpadding="0" id="form">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>

		<tr>
			<td width="100" class="tdstyle1"><b>번호</b></td>
			<td width="500"><s:property value="resultClass.goods_no" /></td>
		</tr>

		<tr>
			<td width="100" class="tdstyle1"><b>상품명</b></td>
			<td width="500"><s:property value="resultClass.goods_name" /></td>
		</tr>

		<tr>
			<td width="100" class="tdstyle1"><b>내용</b></td>
			<td width="500">
				<!-- 이렇게도 쓸수 있다는거다 이자식들아 --> ${resultClass.goods_content }
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1"><b>색상</b></td>
			<td width="500"><s:property value="resultClass.goods_color" />
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1"><b>조회수</b></td>
			<td width="500"><s:property value="resultClass.goods_readcnt" />
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1"><b>등록날짜</b></td>
			<td width="500"><s:property value="resultClass.goods_regdate" />
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1"><b>사진</b></td>
			<td width="500"">이미지 삽입해야지</td>
		</tr>


		<table width="200" border="0" height="0" cellpadding="0"
			cellspacing="-300">
			<tr>
				<td colspan="0" align="center"><img
					src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[0]"/> "
					width"="1000" height="1000"></td>

			</tr>
			<tr>
				<td colspan="0" align="center"><img
					src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[1]"/> "
					width"="1000" height="1000"></td>

			</tr>
			<tr>
				<td><img
					src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[2]"/> "
					width"="850" height="850"></td>

			</tr>



			<tr>
				<td colspan="0" align="center"><img
					src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[3]"/> "
					width"="1000" height="1000"></td>

			</tr>




			<tr>
				<td colspan="0" align="center"><img
					src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[4]"/> "
					width"="1000" height="1000"></td>

			</tr>
		</table>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>


		<%-- <tr>
			<td colspan="2" align="right"><s:url id="modifyURL"
					action="AG_ModifyForm">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url> <s:url id="deleteURL" action="AG_Delete">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url> <input name="modify_b" type="button" value="수정" class="submit"
				onClick="javascript:location.href='AG_ModifyForm.action?goods_no=<s:property value="resultClass.goods_no" />&currentPage=<s:property value="currentPage" />','modify'">
				<input name="delete_b" type="button" value="삭제" class="hreflink"
				onClick="javascript:location.href='AG_Delete.action?goods_no=<s:property value="resultClass.goods_no" />&currentPage=<s:property value="currentPage" />','delete'">
				<input name="list_b" type="button" value="목록" class="submit"
				onClick="javascript:location.href='AG_List.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr> --%>

	</table>
</body>
</html>















