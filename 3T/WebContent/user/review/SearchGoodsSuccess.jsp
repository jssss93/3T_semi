<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>비밀번호 확인</title> <script type="text/javascript">
		function locationURL() {
			if (window.name == 'write')
				
				window.opener.parent.location.href = 'ReviewWriteForm.action?currentPage=<s:property value="currentPage"/>&Goods_no=<s:property value="resultClass.Goods_no"/>';
		
			window.close();
		}
	</script>
</head>
<body>
	<script>
		locationURL()
	</script>
</body>
</html>