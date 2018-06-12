<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Basket</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="30"></td>
		</tr>
		<tr>
			<td align="center" class="text01 formbar" >Basket</td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>
	<table width="1000" border="1" cellspacing="0" cellpadding="2">
		<tr>
			<td width="50" rowspan="2" align="center">해택 정보</td>
			<td width="400">&nbsp;&nbsp;${M_ID }회원이십니다.</td>
		</tr>
		<tr>
			<td width="400">&nbsp;&nbsp;쿠폰 : <font color="#FF0000">$
					개</font></td>
		</tr>
	</table>

	<table width="1000" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="20"></td>
		</tr>
		<tr align="center" bgcolor="#F9F9F9">
			<td width="50"><input name="checkbox" type="checkbox" /></td>
			<td width="130"><strong>IMAGE</strong></td>
			<td width="100"><strong>PRODUCT INFO</strong></td>
			<td width="400"><strong>PRICE</strong></td>
			<td width="80"><strong>QUANTITY</strong></td>
			<td width="80"><strong>TOTAL</strong></td>

		</tr>


		<s:iterator value="B_List" status="stat">
			<!-- http://localhost:8080/StrutsBoard/viewAction.action?no=2&currentPage=1 -->
			<s:url id="viewURL" action="BasketView">
				<s:param name="basket_no">
					<s:property value="basket_no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr align="center">
				<td width="50"><input name="checkbox" type="checkbox" /></td>
				<td><img src="/3T/upload/${basket_goods_img}.small.jpg"
					width="50"></td>
				<td align="center"><s:property value="basket_name" /></td>
				<td align="center"><s:property value="basket_goods_amount" /></td>
				<td align="center"><s:property value="basket_quantity" /></td>
				<td align="center"><s:property value="basket_total" /></td>

			</tr>


		</s:iterator>
	
		<s:if test="B_List.size() <= 0">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="7">등록된 게시물이 없습니다.</td>
			</tr>

		</s:if>
		<s:iterator value="B_List" status="stat">
			<tr bgcolor="#F9F9F9">
				<td colspan="2">&nbsp;&nbsp;&nbsp;[기본배송]</td>
				<td align="right" colspan="6">상품구매금액 <s:property
						value="basket_goods_amount" /> +배송비 0 =합계 :<font color="#FF0000">KRW
						<s:property value="basket_goods_amount" />
				</font></td>
			</tr>
		</s:iterator>
		<tr align="left">
			<td colspan="7" bgcolor="#FFCBCB"><font color="#CC3D3D">
					&nbsp;&nbsp;&nbsp;⊙&nbsp;&nbsp;할인적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</td>
			</font>
		</tr>

		<tr align="right">
			<td width="80">선택한상품을</td>
			<td align="left"><input name="delete" type="button"
				value="x 삭제하기" style="background-color: #B8B8B8;" /></td>

		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<table width="1000" border="1" cellspacing="0" cellpadding="3">
		<tr bgcolor="#F9F9F9">
			<td align="center" height="60" width="340"><font color="#5D5D5D">총
					주문 금액 </font></td>
			<td align="center" width="340"><font color="#5D5D5D">총
					배송비</font></td>
			<td align="center" width="340"><font color="#5D5D5D">총
					결제예정 금액</font></td>
		</tr>
		<s:iterator value="list" status="stat">
			<tr>
				<td width="340" align="center"><font style="font-weight: bold;"><h3>
							KRW
							<s:property value="basket_goods_amount" />
						</h3></font></td>
				<td width="340" align="center"><font style="font-weight: bold;"><h3>-
							KRW 0</h3></font></td>
				<td align="center"><font style="font-weight: bold;"
					color="#FF0000"><h3>
							= KRW
							<s:property value="basket_goods_amount" />
						</h3></font></td>
			</tr>
		</s:iterator>
	</table>
	<table width="1000" border="0" cellspacing="0" cellpadding="3">
		<tr>
			<td height="20"></td>
		</tr>
		<tr>
			<td colspan="7" align="center"><input name="order" type="button"
				value="전체상품 주문"
				style="font-family: 돋움; background-color: #121212; color: #FFFFFF; border-color: #121212;"
				onClick="javascript:location.href='OrderWrite.action?currentPage=<s:property value="currentPage" />'"></td>
			<td colspan="6" align="right"><input name="Main" type="button"
				value="쇼핑계속하기 ▶"
				onClick="javascript:location.href='BasketMain.action?currentPage=<s:property value="currentPage" />'"></td>
		</tr>
		<tr>
			<td width="30"></td>

			<td colspan="6">
				<h4>장바구니 이용안내</h4>
				<li class="item1">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로
					결제해 주시기 바랍니다.</li>
				<li class="item2">해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로
					이동하여 결제하실 수 있습니다.</li>
				<li class="item3">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
				<li class="item4">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
				<li class="item5">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수
					있습니다.</li>
				<li class="item6">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로
					교체됩니다.</li>
				<h4>무이자할부 이용안내</h4>
				<li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을
					눌러 주문/결제 하시면 됩니다.</li>
				<li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한
					주문/결제가 이루어집니다.</li>
				<li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수
					없습니다.</li>
			</td>
		</tr>
	</table>
</body>
</html>











