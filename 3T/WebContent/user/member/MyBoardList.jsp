<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>MY BOARD LIST</title>
	
</head>
  
  <body>
 
 <table width="700" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="left"><h2>MY BOARD LIST</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	
  
	<table width="700" border="0" cellspacing="0" cellpadding="2">
	            ${session.M_ID}님 환영합니다.<br/>
	
	      <tr align="center">
      		<td width="50"><strong>NO</strong></td>
        		<td width="400"><strong>SUBJECT</strong></td>
       			<td width="80"><strong>DATE</strong></td>
        		<td width="80"><strong>NAME</strong></td>
		
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>

	  <s:iterator value="list" status="stat"><!-- listAction에서의 Arraylist에 넣어논걸 for문을 돌려 한줄한줄 꺼낸다 -->

			<s:url id="viewURL" action="Review_View" >
			<s:param name="REV_no">
				<s:property value="REV_no" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		
			
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td><s:property value="REV_no" /></td> 
        		<td align="center"> &nbsp;<s:a href="%{viewURL}"><s:property value="REV_subject" />
        		</td>
        		
        		<td align="left">&nbsp;<s:property value="REV_regdate" /></s:a></td>
		<td align="center"><s:property value="REV_name" /></td>
        		
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>
      
	      </s:iterator>
	      
	      
	      
	      
	      
	      <s:iterator value="list1" status="stat">
      <s:url id="viewURL" action="qa_viewAction">
         <s:param name="QA_NO">
            <s:property value="QA_NO" />
         </s:param>
         <s:param name="currentPage">
            <s:property value="currentPage" />
         </s:param>
      </s:url>
   
      <tr>
         <td align="center"><s:property value="QA_NO" /></td>
         <td align="center">
            <s:if test="QA_RE_LEVEL != 0">
               <c:forEach var = "i" begin = "${QA_RE_LEVEL}" end = "0">&nbsp;</c:forEach>→
            </s:if>   
             <s:a href="%{viewURL}"><s:property value="QA_SUBJECT" /></s:a>
          </td>
          <td align="center"><s:property value="QA_REGDATE" /></td>
          
         <td align="center"><s:property value="QA_NAME" /></td>
         
      </tr>

      <tr bgcolor="#777777">
         <td height="1" colspan="6"></td>
      </tr>

   </s:iterator>

			
	      <s:if test="list.size() <= 0"><!-- list에 들어있는게 없다면 -->
				
	      <tr bgcolor="#FFFFFF"  align="center">
		<td colspan="5">등록된 게시물이 없습니다.</td>
                  </tr>						
	      <tr bgcolor="#777777">
      		<td height="1" colspan="5"></td>
    	      </tr>
    		
	      </s:if>
	        <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	      </tr>
			
	   

    	
	</table>
   </body>
</html>