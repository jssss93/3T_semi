<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="/3T/user/qa/common/css/css.css" type="text/css">
<script type="text/javascript">
	function locationURL()
	{
		if(window.name == 'modify'){
			window.opener.parent.location.href="qa_modifyForm.action?QA_NO=<s:property value="QA_NO" />&currentPage=<s:property value="currentPage" />";			
		}else if(window.name == 'delete'){
			alert('삭제 되었습니다.');
			window.opener.parent.location.href="qa_deleteAction.action?QA_NO=<s:property value="QA_NO" />&currentPage=<s:property value="currentPage" />";
		}else if(window.name == 'cdelete'){
			alert('코멘트가 삭제 되었습니다.');
			window.opener.parent.location.href="qa_deleteAction2.action?QA_NO=<s:property value="QA_NO" />&QA_ORIGINNO=<s:property value="QA_ORIGINNO" />&currentPage=<s:property value="currentPage" />";
		}
		window.close();	
	}
</script>
</head>
<body>
<script>locationURL()</script>
</body>
</html>