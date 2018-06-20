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
			<td align="center" class="text01 formbar">
				<s:if test="index==0"><h2>Order List.</h2></s:if>
				<s:elseif test="index==1">주문 입금확인 목록</s:elseif>
				<s:elseif test="index==2">주문 배송중 목록</s:elseif>
				<s:elseif test="index==3">구매 완료 목록</s:elseif>
			</td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>

	<table width="80%" border="0" cellspacing="0" cellpadding="2">
		<tr align="center">
			<td width="100"><strong>DATE<br>[NO]</br></strong></td>
			<td width="100"><strong>BUYER ID</strong></td>
			<td width="100"><strong></strong></td>
			<td width="700"><strong>GOODS NAME</strong></td>
			<td width="100"><strong>GOODS COUNT</strong></td>
			<td width="100"><strong>PRICE</strong></td>
			<td width="120"><strong>STATE</strong></td>
			<td width="120"><strong>STATE CHANGE</strong></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="8"></td>
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
				<td align="center"><img
					src="/3T/upload/<s:property value="order_img"/>"width="50" height="50" /></td>
				<td align="center">&nbsp;<s:a href="%{viewURL}">
						<s:property value="order_goods_name" />
					</s:a></td>
				<td align="center"><s:property value="order_goods_count" /></td>
				<td><s:property value="order_total" /></td>
				<td>
					<s:if test="order_state==1">입금확인중
						</td><td><input type="button" value=">> 배송중" class="submit"
						onClick="javascript:location.href='AO_List_1to2.action?order_no=<s:property value="order_no" />';" />
					</s:if>
					<s:elseif test="order_state==2">배송중
						</td><td><input type="button" value=">> 구매완료" class="submit"
						onClick="javascript:location.href='AO_List_2to3.action?order_no=<s:property value="order_no" />';" />
					</s:elseif>
					<s:elseif test="order_state==3">구매완료
					</td><td>-</s:elseif>
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="8"></td>
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
			<td colspan="8"><s:property value="pagingHtml" escape="false" /></td>

		</tr>
		<tr align="center">
			<td colspan="8">
				<form action="AO_List.action">
					<select name="searchNum" style="width: 100px; height: 30px;">
						<option value="0">구매자 이름</option>
						<option value="1">구매자 ID</option>
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