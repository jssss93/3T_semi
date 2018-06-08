<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="euc-kr" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
function windowclose(){
	opener.document.Reg_form.M_ID.value="${M_ID}";

	self.close(); 
}

function check() {
	var f=document.checkId;  //문서.Form name="";
	if(f.M_ID.value==""){
		alert("닉네임을 입력해주세요.");
		f.M_ID.focus();
		return false;
	}
	if (f.M_ID.value.length < 2) {
		alert("최소 2자리 이상 입력해주세요!");
		f.M_ID.focus();
		return false;
	}
}
</script>
</head>
<body bgcolor=#f5f5f5>
<s:if test="chkNo==1">
	<form name = "checkId" action="CheckIdAction.action" method="post" onsubmit="return check()">
	<table width=400 border=0 cellspacing=0 cellpadding=5 class="BTABLE">
		<tr align=center>
			<td height=30>
				<font><b>${M_ID}</b> 은(는) <br>
				이미 사용 중인 닉네임입니다!</font>
			</td>
		</tr>
	</table><br/>
	<table width=400 border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td align=center>
				<font>다른 ID를 선택하세요!</font><br/>
				<input type="text" size="10" maxlength="20" name="M_ID" />
				<input type="submit"  value="중복확인"">
			</td>
		</tr>
	</table>
	</form>
</s:if>

<s:else>
	<table width=400 border=0 cellspacing=0 cellpadding=5>
		<tr>
			<td align=center>
				<br><br>
				입력하신 <b>${M_ID}</b> 은(는) <br>
				사용할 수 있는 닉네임입니다.</font>
				<br/><br/>
				<input type="button" value="닫기" onclick="windowclose()"/>
			</td>
		</tr>
	</table>
</s:else>
</body>
</html>