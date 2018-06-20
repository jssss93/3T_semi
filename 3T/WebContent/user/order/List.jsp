<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        	<td width="400"><strong>주문정보</strong></td>
        	<td width="80"><strong>주문수량</strong></td>
			<%-- <td width="80"><strong>상품구매<br>금액</br></strong></td> --%>
			<td width="120"><strong>주문처리상태</strong></td>
			<td width="120"><strong>주문내역</strong></td>
      	  </tr>
      	  <tr bgcolor="#777777">
        	<td height="1" colspan="7"></td>
      	   </tr>

	      <s:iterator value="list" status="stat1">
			<s:if test="ORDER_GOODS_NO==null">
			
			</s:if>
			<s:else>
			<!-- http://localhost:8080/StrutsBoard/viewAction.action?no=2&currentPage=1 -->
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td><s:property value="ORDER_REGDATE" /><br>[<s:property value="ORDER_NO" />]</td>
        		<td align="center">
   
        		<c:forTokens var="order_goods_img"
            			 items="${ORDER_IMG}"
            			 delims=",">
						<img src="/3T/upload/${order_goods_img}" width="50">

				</c:forTokens>
				</td>
        		<td align="center">
        		<% int i=-1;%>
        		<c:forTokens var="order_goods_name"
            			 items="${ORDER_GOODS_NAME}"
            			 delims=",">
						<%
								i=i+1;
						
						%>
				<c:set var="test" value="<%= i %>"/>
				&nbsp;<a href="GoodsView.action?goods_no=${fn:split(ORDER_GOODS_NO,',')[test]}">${order_goods_name} </a><br/><br/>
				</c:forTokens>
        		</td>
				<td align="center">${test+1}</td>
				
        		<%-- <td>
        		
        		<s:property value="ORDER_TOTAL.split(',')[0]" /><br/><br/>
        		
        		</td> --%>
        		
        		<s:if test="ORDER_STATE==1">
        		<td>
					<input type="text" value="         입금확인중" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
				</s:if>
				<s:if test="ORDER_STATE==2">
					<input type="text" value="         배송중" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
				</s:if>
				<s:if test="ORDER_STATE==3">
					<input type="text" value="         배송완료" readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"/>
				</s:if>
        		</td>
        		<td><input type="button"value="내역보기 " 
        		OnClick="window.open('Ordergoodslist.action?ORDER_NO=<s:property value="ORDER_NO" />','window_name','width=700,height=600,location=no,status=no,toolbar=no,scrollbars=no');" /></td></td>
        		   
        		
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="7"></td>
      	      </tr>
    		 
			</s:else>
	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
	    	  <tr bgcolor="#FFFFFF"  align="center">
		   	  	<td colspan="7
		   	  	">등록된 게시물이 없습니다.</td>
              </tr>						
	      	  <tr bgcolor="#777777">
      			<td height="1" colspan="7"></td>
    	      </tr>
	      </s:if>
			
	      <tr height="50" align="center">
    		<td colspan="7"><s:property value="pagingHtml"  escape="false" /></td>
    				<%-- 	<td colspan="7"><input name="Main" type="button" value="주문하기 ▶"
				onClick="javascript:location.href='OrderWrite.action?currentPage=<s:property value="currentPage" />'"></td> --%>
    	   </tr>
	</table>
   </body>
</html>











