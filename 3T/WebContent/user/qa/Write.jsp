<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A</title>
<link rel="stylesheet" href="/3T/user/qa/common/css/css.css" type="text/css">
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>Q&A</h2></td>
		</tr>
	</table>
	
	<s:if test="reply">
		<form action="qa_replyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="QA_REF" value="%{resultClass.QA_REF}" />
			<s:hidden name="QA_RE_LEVEL" value="%{resultClass.QA_RE_LEVEL}" />
			<s:hidden name="QA_RE_STEP" value="%{resultClass.QA_RE_STEP}" />
	</s:if>
	
	<s:elseif test="resultClass == NULL">
		<form action="qa_writeAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:elseif>
	
	<s:else>
		<form action="qa_modifyAction.action" method="post" enctype="multipart/form-data">
			<s:hidden name="QA_NO" value="%{resultClass.QA_NO}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.QA_FILE_SAVNAME}" />
	</s:else>
	<table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  제목</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="QA_SUBJECT" theme="simple" value="%{resultClass.QA_SUBJECT}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>카테고리</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="QA_CATEGORY_NO" theme="simple" value="%{resultClass.QA_CATEGORY_NO}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이름 </td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="QA_NAME" theme="simple" value="%{resultClass.QA_NAME}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
 
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  비밀번호 </td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="QA_PASSWD" theme="simple" value="%{resultClass.QA_PASSWD}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="QA_CONTENT" theme="simple" value="%{resultClass.QA_CONTENT}" cols="50" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
       <tr>
          <td bgcolor="#F4F4F4">  첨부파일 </td>
          <td bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.QA_FILE_ORGNAME != NULL">
		&nbsp; * <s:property value="resultClass.QA_FILE_ORGNAME" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
	</s:if>
						
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="작성완료" class="inputb">
            <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='qa_listAction.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
</form>
</body>
</html>