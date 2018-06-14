<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>등록 상품 상세보기</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

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
			<td align="center" class="text01 formbar"><h2>주문 상세보기</h2></td>
		</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0"  id="form">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>

		<tr>
			<td width="100" class="tdstyle1">주문 번호</td>
			<td width="500"><s:property value="resultClass.order_no" /></td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">주문자 ID</td>
			<td width="500"><s:property value="resultClass.order_member_id" />
			</td>
		</tr>

		<tr>
			<td width="100" class="tdstyle1">주문 상품 번호 ,이름</td>
			<td width="500"><s:property value="resultClass.order_goods_no" />
				<s:property value="resultClass.order_goods_name" /></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">주문자이름</td>
			<td width="500"><s:property value="resultClass.recipient_name" />
			</td>
		</tr>

		<tr>
			<td width="100" class="tdstyle1">주문자 주소</td>
			<td width="500">
				<!-- 이렇게도 쓸수 있다는거다 이자식들아 --> ${resultClass.recipient_zipcode }
				${resultClass.recipient_address1 } ${resultClass.recipient_address2 }
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">주문지 PHONE</td>
			<td width="500">${resultClass.recipient_phone1 }
				${resultClass.recipient_phone2 } ${resultClass.recipient_phone3 }</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">주문자 이메일주소</td>
			<td width="500"><s:property value="resultClass.order_email1" />
				<s:property value="resultClass.order_email2" /></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">수령인이름</td>
			<td width="500"><s:property value="resultClass.recipient_name" />
			</td>
		</tr>

		<tr>
			<td width="100" class="tdstyle1">수령인 주소</td>
			<td width="500">
				<!-- 이렇게도 쓸수 있다는거다 이자식들아 --> ${resultClass.recipient_zipcode }
				${resultClass.recipient_address1 } ${resultClass.recipient_address2 }
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">수령인 PHONE</td>
			<td width="500">${resultClass.recipient_phone1 }
				${resultClass.recipient_phone2 } ${resultClass.recipient_phone3 }</td>
		</tr>


		<tr>
			<td width="100" class="tdstyle1">결제방식</td>
			<td width="500"><s:property value="resultClass.payment" /></td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">결제정보</td>
			<td width="500"><s:property value="resultClass.deposit_bank" />
				<s:property value="resultClass.deposit_name" /></td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">주문상태</td>
			<td width="500"><s:property value="resultClass.order_state" />
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">주문 총 개수</td>
			<td width="500"><s:property value="resultClass.order_total" />
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">주문 총 가격</td>
			<td width="500"><s:property value="resultClass.order_price" />
			</td>
		</tr>

		<tr>
			<td colspan="2" height="10"></td>
		</tr>


		<tr>
			<td colspan="2" align="right"><s:url id="modifyURL"
					action="AGmodifyForm">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url> <s:url id="deleteURL" action="AGdeleteAction">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url> <input name="modify_b" type="button" value="수정" class="submit"
				onClick="javascript:open_win_noresizable('AGmodifyForm.action?goods_no=<s:property value="resultClass.goods_no" />&currentPage=<s:property value="currentPage" />','modify')">
				<input name="delete_b" type="button" value="삭제" class="hreflink"
				onClick="javascript:open_win_noresizable('AGdeleteAction.action?goods_no=<s:property value="resultClass.goods_no" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list_b" type="button" value="목록" class="submit"
				onClick="javascript:location.href='AGlistAction.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

	</table>
</body>
</html>















