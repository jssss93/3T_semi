<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
	<title>Order</title>
	<link rel="stylesheet" href="/3T/user/order/common/css/css.css" type="text/css">
</head>

  <body>
  	<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td height="30"></td>
  		</tr>
  		<tr>
  			<td align="left"><h2>Order</h2></td>
  		</tr>
  		<tr>
  			<td height="50"></td>
  		</tr>
  	</table>
  	
  
	<table width="900" border="0" cellspacing="0" cellpadding="2">
	      <tr align="center" >
      		<td width="130"><strong>주문일자<br>[주문번호]</br></strong></td>
			<td width="100"><strong>이미지</strong></td>
        	<td width="400"><strong>상품정보</strong></td>
        	<td width="80"><strong>수량</strong></td>
			<td width="80"><strong>상품구매<br>금액</br></strong></td>
			<td width="120"><strong>주문처리상태</strong></td>
      	  </tr>
      	  <tr bgcolor="#777777">
        	<td height="1" colspan="6"></td>
      	   </tr>

	      <s:iterator value="list" status="stat">
			<!-- http://localhost:8080/StrutsBoard/viewAction.action?no=2&currentPage=1 -->
			<s:url id="viewURL" action="viewAction" >
				<s:param name="ORDER_NO">
					<s:property value="ORDER_NO" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>
			
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td><s:property value="ORDER_REGDATE" /><br>[<s:property value="ORDER_NO" />]</br></td>
        		<td align="center"><img src="/2222/image/${ORDER_IMG}.small.jpg" width="50"></td>
        		<td align="center">&nbsp;<s:a href="%{viewURL}"><s:property value="ORDER_GOODS_INFO" /></s:a></td>
				<td align="center"><s:property value="ORDER_GOODS_COUNT" /></td>
        		<td><s:property value="ORDER_TOTAL" /></td>
        		<td><s:property value="ORDER_STATE" /></td>
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="6"></td>
      	      </tr>
      
	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
	    	  <tr bgcolor="#FFFFFF"  align="center">
		   	  	<td colspan="6
		   	  	">등록된 게시물이 없습니다.</td>
              </tr>						
	      	  <tr bgcolor="#777777">
      			<td height="1" colspan="6"></td>
    	      </tr>
	      </s:if>
			
	      <tr height="50" align="center">
    		<td colspan="6"><s:property value="pagingHtml"  escape="false" /></td>
    					<td colspan="8"><input name="Main" type="button" value="주문하기 ▶"
				onClick="javascript:location.href='Write.action'"></td>
    	   </tr>
	</table>
   </body>
</html>










