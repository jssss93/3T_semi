<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품 검색</title>

</head>

<body>


	<table width="500" border="0" cellspacing="0" cellpadding="1">
		<tr>
			<td align="left"><h3>상품 검색</h3></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
			
		  <tr align="left">
		<td colspan="5" align="left">
			<form action="qa_SearchGoods.action" method="post" >
				<select name="searchNum" >
					<option value="0"> 상품명 </option>
					
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb">
				<s:hidden name="currentPage" value="%{currentPage}" />
				
			</form>
		</td>
	</tr>
		<tr>
			<td height="20"></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

	</table>
	
	<table width="500" border="0" cellspacing="0" cellpadding="1">
				<tr align="center">
					<td width="90"><strong>상품이미지</strong></td>
					<td width="130"><strong>상품정보</strong></td>
					<td width="50"><strong>선택</strong></td>
				</tr>
				<tr bgcolor="#777777">
					<td height="1" colspan="3"></td>
				</tr>
				
				
				<tr>
					<s:iterator value="list2" status="stat">
						<s:url id="viewURL" action="qa_SearchGoodsSuccess">
							<s:param name="goods_no">
								<s:property value="goods_no" />
							</s:param>
							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>
						<tr>
							<td height="10"></td>
						</tr>
						<td align="center">
							<img src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>" 
							width="60" height="60">
						</td>
						<td>
							<s:property value="goods_name"/><br>
							KRW &nbsp;<s:property value="goods_price"/> &nbsp;<s:property value="goods_no"/>
						</td>
						<td align="center">
						<s:hidden name="currentPage" value="%{currentPage}" />
						<s:hidden name="goods_no" value="%{goods_no}" />
						
						
							<s:a href="%{viewURL}"><input name="button" type="button" value="선택" class="inputb" /></s:a>
						
						</td>
				</tr>
				
				</s:iterator>
				
				<s:if test="list2.size() <= 0">
					<!-- list에 들어있는게 없다면 -->
	
					<tr bgcolor="#FFFFFF" align="center">
						<td colspan="5">검색을 검색 하세요.</td>
					</tr>
					<tr bgcolor="#777777">
						<td height="1" colspan="5"></td>
					</tr>
	
				</s:if>
			
				<tr align="center">
					<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
				</tr>
		</table>
</body>
</html>