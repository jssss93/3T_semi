<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>checkError</title>
<script type="text/javascript">
	function ErrorMessage() {
		alert("비밀번호가 틀립니다.");
		history.back(-1);
	}
</script>
</head>

<body>
	<script>
		ErrorMessage()
	</script>
</body>
</html>