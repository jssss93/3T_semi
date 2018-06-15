<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>주문목록</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

</head>

<body>
	<table width="80%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="30"></td>
		</tr>
		<tr>
			<td align="center" class="text01 formbar"><h2>주문목록</h2></td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>

	<table width="80%" border="0" cellspacing="0" cellpadding="2">
		<tr align="center">
			<td width="130"><strong>주문일자<br>[주문번호]</br></strong></td>
			<td width="60"><strong>구매자 ID</strong></td>
			<td width="100"><strong>이미지</strong></td>
			<td width="400"><strong>상품이름</strong></td>
			<td width="80"><strong>수량</strong></td>
			<td width="80"><strong>상품구매<br>금액</br></strong></td>
			<td width="120"><strong>주문처리상태</strong></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="7"></td>
		</tr>

		<s:iterator value="list" status="stat">
			<s:url id="viewURL" action="AO_View.action">
				<s:param name="order_no">
					<s:property value="order_no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr bgcolor="#FFFFFF" align="center">
				<td><s:property value="order_regdate" /><br>[<s:property
							value="order_no" />]</br></td>
				<td><s:property value="order_member_id" /></td>
				<td align="center">이미지 삽입</td>
				<td align="center">&nbsp;<s:a href="%{viewURL}">
						<s:property value="order_goods_name" />
					</s:a></td>
				<td align="center"><s:property value="order_goods_count" /></td>
				<td><s:property value="order_total" /></td>
				<td><s:property value="order_state" /></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="7"></td>
			</tr>

		</s:iterator>

		<s:if test="list.size() <= 0">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="7
		   	  	">등록된 게시물이 없습니다.</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="7"></td>
			</tr>
		</s:if>

		<tr height="50" align="center">
			<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>

		</tr>
		<tr align="center">
			<td colspan="5">
				<form action="AO_List.action">
					<select name="searchNum" style="width: 100px; height: 30px;">
						<option value="0">주문자명</option>
						<option value="1">구매자ID</option>
					</select>
					
					<s:textfield name="searchKeyword" theme="simple" value=""
						cssStyle="width:200px; height:30px;" maxlength="20" />
					<input name="submit" type="submit" value="검색" class="submit">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>