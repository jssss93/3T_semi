<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

</head>
<body>
<table width="700" border="0" cellspacing="0" cellpadding="0" id="form">
			<tr>
				<td colspan="2" align="right"><font style="font-weight: bold;" color="#FF0000"><h3> ♥ </h3></font></td>
			</tr>
			<p>
			<s:iterator value="list1" status="stat">
			<tr>
				<td width="120" class="tdstyle1">
					ㆍ주문자 ID
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>= ${session.M_ID}</h5></font>
				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					ㆍ주문자 이름
				</td>
				<td align="right" >
					<font style="font-weight: bold;"><h5>= <s:property value="ORDER_NAME" /></h5></font>
				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					ㆍ주문자 주소
				</td>
				<td align="right" >
					<font style="font-weight: bold;"><h5>= <s:property value="ORDER_ADDRESS1"/><s:property value="ORDER_ADDRESS2" /></h5></font>
				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					ㆍ주문자 연락처
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>= <s:property value="ORDER_PHONE1" />-<s:property value="ORDER_PHONE2" />-<s:property value="ORDER_PHONE3" /></h5></font>
				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					ㆍ받는자 이름
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>= <s:property value="RECIPIENT_NAME" /></h5></font>
				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					ㆍ받는자 주소
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>= <s:property value="RECIPIENT_ADDRESS1"/><s:property value="RECIPIENT_ADDRESS2" /></h5></font>
				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					ㆍ받는자 연락처 
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>= <s:property value="RECIPIENT_PHONE1" />-<s:property value="RECIPIENT_PHONE2" />-<s:property value="RECIPIENT_PHONE3" /></h5></font>
				</td>
			</tr>
			<tr>
				<td class="tdstyle1">
					ㆍ총금액 
				</td>
				<td align="right">
					<font style="font-weight: bold;"><h5>= <s:property value="ORDER_TOTAL" /></h5></font>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input  class="hreflink" type="button" name="close" onclick="window.close()" value="닫기"/></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>