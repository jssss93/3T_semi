<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="euc-kr" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<title>비밀번호 확인</title> 
	<script language="javascript"> 
	function MovePage() { 
        window.opener.top.location.href='qa_writeForm1.action?goods_no=<s:property value="goods_no" />&currentPage=<s:property value="currentPage" />'; 
        window.close(); 
} 
</script> 
</head>
<body>
	<script>
	MovePage()
	</script>
</body>
</html>