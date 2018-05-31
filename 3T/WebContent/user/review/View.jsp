<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>스트럿츠2 게시판</title>
<script type="text/javascript"> //새창이 열리는 함수를 만들어줌
		function open_win_noresizable(url, name) {
			var oWin = window.open(url, name,
							"scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
</head>
<body>

 <table width="700" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="left"><h2>REVIEW</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000"></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="100" bgcolor="#FFFFFF"><font color="#FF0000"></font>SUBJECT</td>
			<td width="500" bgcolor="#FFFFFF">
			<s:property value="resultClass.REV_subject" />
			</td>
		</tr>
		<tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		
		<tr>
			<td bgcolor="#FFFFFF"><font color="#FF0000"></font>NAME</td>
			<td bgcolor="#FFFFFF">
				<s:property value="resultClass.REV_name" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
         
          <td colspan="2" bgcolor="#FFFFFF">
          		<!-- 올린파일 사진 -->
            	<s:property value="resultClass.REV_content" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
        	<td bgcolor="#FFFFFF">FILE</td>
        	<td bgcolor="#FFFFFF">
        	<s:url id="download"
					action="Review_fileDownloadAction">
					<s:param name="REV_no">
						<s:property value="REV_no" />
					</s:param>
				</s:url> <s:a href="%{download}">
					<s:property value="resultClass.REV_no" />
				</s:a>
        	</td>
        </tr>
        
        
        
        <tr>
			<td align="right" colspan="2">
			<s:url id="modifyURL" action="modifyForm">
				<s:param name="REV_no">
						<s:property value="REV_no" />
					</s:param>
				</s:url> 
				<s:url id="deleteURL" action="deleteAction">
					<s:param name="REV_no">
						<s:property value="REV_no" />
					</s:param>
				</s:url> 

					<input name="list" type="button" value="modify" class="inputb"
					onClick="javascript:open_win_noresizable('Review_CheckForm.action?no=<s:property value="resultClass.REV_no" />&currentPage=<s:property value="currentPage" />','modify')">

						<input name="list" type="button" value="delete" class="inputb"
						onClick="javascript:open_win_noresizable('Review_CheckForm.action?no=<s:property value="resultClass.REV_no" />&currentPage=<s:property value="currentPage" />','delete')">

							<input name="list" type="button" value="list" class="inputb"
							onClick="javascript:location.href='Review_list.action?currentPage=<s:property value="currentPage" />'"></td>
		</tr>
        </table>

</body>
</html>