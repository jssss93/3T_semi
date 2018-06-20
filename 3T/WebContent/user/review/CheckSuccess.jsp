<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>비밀번호 확인</title> <script type="text/javascript">
		function locationURL() {
			if (window.name == 'modify')
				window.opener.parent.location.href = 'Review_ModifyForm.action?REV_no=<s:property value="REV_no"/>&currentPage=<s:property value="currentPage"/>';
			else if (window.name == 'delete') {
				alert('삭제되었습니다.');
				window.opener.parent.location.href = 'Review_DeleteAction.action?REV_no=<s:property value="REV_no" />&currentPage=<s:property value="currentPage" />';
			} else if (window.name == 'cdelete') {
				alert('코멘트가 삭제 되었습니다.');
				window.opener.parent.location.href = "Review_DeleteAction2.action?REV_C_no=<s:property value="REV_C_no" />&REV_C_originno=<s:property value="REV_C_originno" />&currentPage=<s:property value="currentPage" />";
			}
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