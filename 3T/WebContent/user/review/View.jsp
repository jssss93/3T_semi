<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
<head>
<title>REVIEW</title>
<script type="text/javascript">
	//새창이 열리는 함수를 만들어줌
	function open_win_noresizable(url, name) {
		var oWin = window.open(url, name,
				"scrollbars=no,status=no,resizable=no,width=420,height=190");
	}
</script>
<script type="text/javascript">
	function validation() {

		var frm = document.forms[0];

		if (frm.REV_name.value == "") {
			alert("이름을 입력해주세요.");
			return false;
		} else if (frm.REV_C_passwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if (frm.REV_C_content.value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}

		return true;
	}
</script>
</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2"align="cneter">
		<tr>
			<td align="center" class="text01 formbar">REVIEW</td>

		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
<table width="600" border="0" cellspacing="0" cellpadding="0" height="120" background="/3T/upload/QA_BG.png">
			<tr >
				<td colspan="2" height="1"></td>
			</tr>
			
			<s:url id="viewURL" action="GoodsView">
				<s:param name="goods_no">
					<s:property value="goods_resultClass.goods_no" />
			 	</s:param>
				<s:param name="currentPage">
			 		<s:property value="currentPage" />
				</s:param>
			</s:url>
			<tr>                                             
					<td align="center" width="120"><img src="/3T/upload/<s:property value="goods_resultClass.goods_file_savname.split(',')[0]"/>" width="80" height="100"></td>
				
					<td colspan="2"> <s:property value="goods_resultClass.goods_name" /><br>KRW <s:property value="goods_resultClass.goods_price" />
					<hr align="center" width="470" color="#8C8C8C"  ><br>
						<s:a href="%{viewURL}"><input type="button" name="button" value="상품 상세보기 ▶"/></s:a>
					</td>
			</tr>
		</table>
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"></td>
		</tr>

		<tr>
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" class="tdstyle2"><b>SUBJECT</b></td>
			<td width="500" ><s:property
					value="resultClass.REV_subject" /></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td class="tdstyle1"><b>NAME</b></td>
			<td><s:property value="resultClass.REV_name" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>


		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>

			<td colspan="2" bgcolor="#FFFFFF">
				<!-- 올린파일 사진 --> <img
				src="/3T/upload/<s:property value="resultClass.REV_file_savname"/>"
				width"="300" height="300"> <br><br> <s:property
								value="resultClass.REV_content" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#FFFFFF">FILE</td>
			<td bgcolor="#FFFFFF"><s:url id="download"
					action="Review_fileDownloadAction">
					<s:param name="REV_no">
						<s:property value="REV_no" />
					</s:param>
				</s:url> <s:a href="%{download}">
					<s:property value="resultClass.REV_no" />
				</s:a></td>
		</tr>

		<!-- 댓글 -->
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" height="10">
				<form action="Review_WriteCommentAction.action" method="post"
					onsubmit="return validation();">
					<table>
						<c:choose>
							<c:when test="${session.M_ID != NULL}">
								<tr>
									<tr>
										<h3>COMMENTS</h3>
										<td width="170">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;
											${session.M_ID } <br> 비밀번호 <s:textfield
										name="REV_C_passwd" theme="simple" value=""
										cssStyle="width:100px" maxlength="20" />
										</td>
										<input type="hidden" name="REV_C_name"
											value="${session.M_ID }" />
										

										<s:hidden name="REV_C_originno" value="%{resultClass.REV_no}" />
										<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
										<s:hidden name="REV_no" value="%{resultClass.REV_no}" />
										<s:hidden name="currentPage" value="%{currentPage}" />
										<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
									</tr>
									<tr>
										<td align="left"><s:textarea name="REV_C_content"
												theme="simple" value="" cols="100" rows="6" /></td>
									</tr>
									<tr>
										<td colspan="2" align="right"><input name="submit"
											type="submit" value="OK" class="inputb"></td>
									</tr>

								</tr>
							</c:when>
							<c:when test="${session.M_ID == NULL }">
								<tr>
									<td><h4>회원에게만 댓글 작성 권한이 있습니다.</h4></td>

								</tr>

								<%-- <tr>
							<td width="170">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 <s:textfield
									name="REV_C_name" theme="simple" value=""
									cssStyle="width:100px" maxlength="20" /><br> 비밀번호 <s:textfield
										name="REV_C_passwd" theme="simple" value=""
										cssStyle="width:100px" maxlength="20" /></td>
									
							<s:hidden name="REV_C_originno" value="%{resultClass.REV_no}" />
							<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<s:hidden name="REV_no" value="%{resultClass.REV_no}" />
							<s:hidden name="currentPage" value="%{currentPage}" />
							<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<td align="left"><s:textarea name="REV_C_content"
									theme="simple" value="" cols="60" rows="3" /></td>
						</tr>
						
						<tr>
							<td colspan="2" align="right"><input name="submit"
								type="submit" value="작성완료" class="inputb"></td>
							</tr> --%>
							</c:when>
						</c:choose>
					</table>
				</form>
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>


		<s:iterator value="commentlist" status="stat">
			<tr>
				<td height="10" width="130" align="center"><s:property
						value="REV_C_name" /><br> <s:property value="REV_C_date" /><br><br></td>
				<td>
					<!-- @@@@@@@@@@@@코멘트 삭제@@@@@@@@@@@@ --> <s:property
						value="REV_C_content" /> <a
					href="javascript:open_win_noresizable('Review_CheckForm2.action?REV_C_no=<s:property value="REV_C_no" />
					&REV_C_originno=<s:property value="REV_C_originno" />&currentPage=<s:property value="currentPage" />','cdelete')">[delete]</a>
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td colspan="2" height="1"></td>
			</tr>
		</s:iterator>
		<tr>
			<td colspan="2" height="10"><s:if test="commentlist.size() <= 0">
				댓글없음
			</td>
		</tr>
		</s:if>

		<!-- 댓글 -->



		<tr>
			<td align="right" colspan="2"><s:url id="modifyURL"
					action="modifyForm">
					<s:param name="REV_no">
						<s:property value="REV_no" />
					</s:param>
				</s:url> <s:url id="deleteURL" action="deleteAction">
					<s:param name="REV_no">
						<s:property value="REV_no" />
					</s:param>

				</s:url> <%-- <input name="list" type="button" value="답변달기" class="submit"
				onClick="javascript:location.href='Review_ReplyForm.action?REV_no=<s:property value="REV_no" />&currentPage=<s:property value="currentPage" />'"> --%>
					<input name="list" type="button" value="modify" class="hreflink"

					onClick="javascript:open_win_noresizable('Review_CheckForm.action?REV_no=<s:property value="resultClass.REV_no" />&currentPage=<s:property value="currentPage" />','modify')">

						<input name="list" type="button" value="delete" class="submit"
						onClick="javascript:open_win_noresizable('Review_CheckForm.action?REV_no=<s:property value="resultClass.REV_no" />&currentPage=<s:property value="currentPage" />','delete')">

							<input name="list" type="button" value="list" class="hreflink"
							onClick="javascript:location.href='Review_list.action?currentPage=<s:property value="currentPage" />'"></td>
		</tr>
	</table>

</body>
</html>