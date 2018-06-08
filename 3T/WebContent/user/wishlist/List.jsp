<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Wishlist</title>
<link rel="stylesheet" href="/3T/user/wishlist/common/css/css.css"
	type="text/css">
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="30"></td>
		</tr>
		<tr>
			<td align="left"><h2>MY Wishlist</h2></td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>


	<table width="1000" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="20"></td>
		</tr>
		<tr align="center" bgcolor="#F9F9F9">
			<td width="50"><input name="checkbox" type="checkbox" /></td>
			<td width="130"><strong>IMAGE</strong></td>
			<td width="300"><strong>PRODUCT INFO</strong></td>
			<td width="80"><strong>TOTAL</strong></td>
			<td width="120"><strong>SELECT</strong></td>
		</tr>


		<s:iterator value="list" status="stat">
			<!-- http://localhost:8080/StrutsBoard/viewAction.action?no=2&currentPage=1 -->
			<s:url id="viewURL" action="GoodsView">
				<s:param name="goods_no">
					<s:property value="W_NO" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr  align="center">
				<td><img src="/3T/image/${W_GOODS_IMG}.small.jpg"
					width="50"></td>
				<td align="center"><s:property value="W_GOODS_NAME" /></td>
				<td align="center"><s:property value="BASKET_GOODS_AMOUNT" /></td>
				<td align="center"><s:property value="W_TOTAL" /></td>
				<td><s:property value="W_SELECT" /></td>
			</tr>


		</s:iterator>

		<s:if test="list.size() <= 0">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="5">등록된 게시물이 없습니다.</td>
			</tr>

		</s:if>

		<tr align="right">
			<td width="80">선택한상품을</td>
			<td align="left"><input name="delete" type="button"
				value="x 삭제하기" style="background-color: #B8B8B8;" /></td>
			<td align="center"><input name="delete" type="button"
				value="장바구니 담기" style="background-color: #B8B8B8;" />
			<input name="order" type="button"
				value="전체상품 주문" style=" font-family:돋움; background-color:#121212; color:#FFFFFF; border-color:#121212; "
				onClick="javascript:location.href='OrderWrite.action?currentPage=<s:property value="currentPage" />'">
			</td>
			<td colspan="5" align="right"><input name="Main" type="button"
				value="관심상품 비우기 "
				onClick="javascript:location.href=''">
			</td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
   		<tr height="50" align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	   </tr>
			
		
		</table>
		
</body>
</html>











