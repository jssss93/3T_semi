<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Q&A</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
#form td.tdstyle2 {background-color :#000000; border:#ccc 1px solid; width:400px; padding:20px; font-size:14px; font-weight:bold; color:#000;}

</style>

<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");
		
	}
</script>
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center" class="text01 formbar"><h2>Q&A</h2></td>
		</tr>
		<tr>
          <td height="20" colspan="2"></td>
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
          <td height="5" colspan="2"></td>
        </tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">번호</td>
			<td width="500"><s:property value="resultClass.QA_NO" /></td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">제목</td>
			<td width="500"><s:property value="resultClass.QA_SUBJECT" /></td>
		</tr>
		<tr>
			<td width="100">이름</td>
			<td width="500"><s:property value="resultClass.QA_NAME" /></td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="100">내용</td>
			<td width="500">${resultClass.QA_CONTENT}<br><br>
			<s:if test="resultClass.QA_FILE_SAVNAME !=null">
					<img
				src="/3T/upload/<s:property value="resultClass.QA_FILE_SAVNAME"/>"
				width"="300" height="300"> 
			</s:if>
			<s:else>
				<td height="100" colspan="2"></td>
			</s:else>
			
			</td> 
			
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="100">조회수</td>
			<td width="500"><s:property value="resultClass.QA_READCNT" /></td>
		</tr>
		<tr>
			<td width="100">등록날짜</td>
			<td width="500"><s:property value="resultClass.QA_REGDATE" /></td>
		</tr>
		<tr>
			<td width="100">첨부파일</td>
			<td width="500">&nbsp;&nbsp; <s:url id="download"
					action="qa_fileDownloadAction">
					<s:param name="QA_NO">
						<s:property value="QA_NO" />
					</s:param>
				</s:url> <s:a href="%{download}">
					<s:property value="resultClass.QA_FILE_ORGNAME" />
				</s:a>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" height="10">
				<form action="qa_writeCommentAction.action" method="post">
					<table>
						<tr>
							<td width="170">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 <s:textfield
									name="QA_NAME" theme="simple" value="" cssStyle="width:100px"
									maxlength="20" /><br> 비밀번호 <s:textfield name="QA_PASSWD"
									theme="simple" value="" cssStyle="width:100px" maxlength="20" />
							</td>
							<s:hidden name="QA_ORIGINNO" value="%{resultClass.QA_NO}" />
							<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<s:hidden name="QA_NO" value="%{resultClass.QA_NO}" />
							<s:hidden name="currentPage" value="%{currentPage}" />
							<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<td align="left"><s:textarea name="QA_CONTENT"
									theme="simple" value="" cols="60" rows="3" /></td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input name="submit"
								type="submit" value="작성완료" class="inputb"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>


		<s:iterator value="commentlist" status="stat">
			<s:url id="viewURL" action="qa_viewAction">
				<s:param name="QA_NO">
					<s:property value="QA_NO" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr>
				<td height="10" width="130" align="center"><s:property
						value="QA_NAME" /><br> <s:property value="QA_REGDATE" /><br>
				<br></td>
				<td>
					<!-- @@@@@@@@@@@@코멘트 삭제@@@@@@@@@@@@ --> <s:property
						value="QA_CONTENT" /> <a
					href="javascript:open_win_noresizable('qa_checkForm2.action?QA_NO=<s:property value="QA_NO" />&QA_ORIGINNO=<s:property value="QA_ORIGINNO" />&currentPage=<s:property value="currentPage" />','cdelete')">삭제</a>
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

		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>


		<tr>
			<td colspan="2" align="right"><s:url id="modifyURL"
					action="qa_modifyForm">
					<s:param name="QA_NO">
						<s:property value="QA_NO" />
					</s:param>
				</s:url> <s:url id="deleteURL" action="qa_deleteAction">
					<s:param name="QA_NO">
						<s:property value="QA_NO" />
					</s:param>
				</s:url> <input name="list" type="button" value="답변달기" class="inputb"
				onClick="javascript:location.href='qa_replyForm.action?goods_no=<s:property value="goods_resultClass.goods_no" />&QA_NO=<s:property value="QA_NO" />&currentPage=<s:property value="currentPage" />'">
				<input name="list" type="button" value="수정" class="inputb"
				onClick="javascript:open_win_noresizable('qa_checkForm.action?goods_no=<s:property value="goods_resultClass.goods_no" />&QA_NO=<s:property value="QA_NO" />&currentPage=<s:property value="currentPage" />','modify')">
				<input name="list" type="button" value="삭제" class="inputb"
				onClick="javascript:open_win_noresizable('qa_checkForm.action?QA_NO=<s:property value="QA_NO" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list" type="button" value="목록" class="inputb"
				onClick="javascript:location.href='qa_listAction.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
	</table>
</body>
</html>















