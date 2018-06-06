<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 상세보기</title>
<link rel="stylesheet" href="/3T/common/css/css.css" type="text/css">

<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window
				.open(url, name,
						"scrollbars=no, status=no, resizable=no, width=600, height=500");

	}
</script>
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>회원정보 상세보기</h2></td>
		</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>

		<tr>
			<td width="100">회원번호</td>
			<td width="500"><s:property value="resultClass.m_no" /></td>
		</tr>

		<tr>
			<td width="100">이름</td>
			<td width="500"><s:property value="resultClass.m_name" /></td>
		</tr>
		<tr>
			<td width="100">id</td>
			<td width="500"><s:property value="resultClass.m_id" /></td>
		</tr>

		<tr>
			<td width="100">passwd</td>
			<td width="500">
				<!-- 이렇게도 쓸수 있다는거다 이자식들아 --> ${resultClass.m_passwd }
			</td>
		</tr>

		<tr>
			<td width="100">주민등록번호</td>
			<td width="500"><s:property value="resultClass.m_jumin1" />-<s:property
					value="resultClass.m_jumin2" /></td>
		</tr>
		<tr>
			<td width="100">TEL</td>
			<td width="500"><s:property value="resultClass.m_phone" /></td>
		</tr>
		<tr>
			<td width="100">email</td>
			<td width="500"><s:property value="resultClass.m_email1" />@<s:property
					value="resultClass.m_email2" /></td>
		</tr>
		<tr>
			<td width="100">주소</td>
			<td width="500">( <s:property value="resultClass.m_zipcode" />)
				<s:property value="resultClass.m_addr1" /> <s:property
					value="resultClass.m_addr1" />
			</td>
		</tr>
		<tr>
			<td width="100">가입날짜</td>
			<td width="500"><s:property value="resultClass.m_regdate" /></td>
		</tr>
		<tr>
			<td width="100">예금주</td>
			<td width="500"><s:property value="resultClass.m_depositor" />
			</td>
		</tr>
		<tr>
			<td width="100">계좌번호</td>
			<td width="500">( <s:property value="resultClass.m_name_bank" />
				) <s:property value="resultClass.account_no" />
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
			<td colspan="2" align="right">

				<form action="AM_Coupon.action">

					<input type="hidden" name="m_id_f" value="${resultClass.m_id}">
					<input type="hidden" name="m_no" value="${resultClass.m_no}">
					<input type="hidden" name="currentPage" value="${currentPage}">
					<input type="text" name="m_coupon_content_f"> <input
						type="submit" value="쿠폰주기">
				</form>
				<form action="AM_Msg.action">

					<input type="hidden" name="m_id_f" value="${resultClass.m_id}">
					<input type="hidden" name="m_no" value="${resultClass.m_no}">
					<input type="hidden" name="currentPage" value="${currentPage}">
					<input type="text" name="m_msg_content_f"> <input
						type="submit" value="쪽지보내기">
				</form>
				<input name="delete_b" type="button" value="삭제" class="inputb"
				onClick="javascript:open_win_noresizable('AMdeleteAction.action?m_no=<s:property value="resultClass.m_no" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list_b" type="button" value="목록" class="inputb"
				onClick="javascript:location.href='AMlistAction.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

	</table>
</body>
</html>















