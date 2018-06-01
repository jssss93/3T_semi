<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
	function check() {

		var f = document.Reg_form;

		if (f.M_ID.value == "") {
			alert("아이디를 입력해주십시오");
			f.M_ID.focus();
			return false;
		}
	

		if (f.M_PASSWD.value == "") {
			alert("비밀번호를 입력해주십시오");
			f.M_PASSWD.focus();
			return false;
		}

		if (f.M_PASSWD.value != f.M_PASSWD2.value) {
			alert("비빌번호를 다르게 입력했습니다.");
			f.M_PASSWD2.select();
			return false;
		}

		if (f.M_NAME.value == "") {
			alert("이름을 입력해주십시오");
			f.M_NAME.focus();
			return false;
		}

		if (f.M_JUMIN1.value == "") {
			alert("주민등록번호를 입력해주십시오");
			f.M_JUMIN1.focus();
			return false;
		}

		if (f.M_JUMIN2.value == "") {
			alert("주민등록번호를 입력해주십시오");
			f.M_JUMIN2.focus();
			return false;
		}

		if (f.M_ZIPCODE.value == "") {
			alert("우편번호를 검색하여 입력해주십시오");
			f.M_ZIPCODE.focus();
			return false;
		}

		if (f.M_ADDR1.value == "") {
			alert("기본주소를 입력해주십시오");
			f.M_ADDR1.focus();
			return false;
		}

		if (f.M_ADDR2.value == "") {
			alert("상세주소를 입력해주십시오");
			f.M_ADDR2.focus();
			return false;
		}

		if (f.M_PHONE.value == "") {
			alert("전화번호를 입력해주십시오");
			f.phone.focus();
			return false;
		}

		if (f.M_EMAIL.value == "") {
			alert("이메일을 입력해주십시오");
			f.M_EMAIL.focus();
			return false;
		}

	}

	function openConfirmId() {
		var url = "memberIdCheck.action?id=" + document.Reg_form.id.value;
		var f = document.Reg_form; //문서.Form name="";
		var idPs = /^[0-9a-zA-Z]{4,12}$/; //아이디 비밀번호 체크표현식
		if (f.id.value == "") {
			alert("아이디를 입력해주세요.");
			f.id.focus();
			return false;
		}

		open(
				url,
				"confirm",
				"toolbar=no, location=no, status=co, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script language="Javascript">
	function checkemailaddy() {
		if (mypageUpdate.email3.value == '1') {
			mypageUpdate.M_EMAIL2.readonly = false;
			mypageUpdate.M_EMAIL2.value = '';
			mypageUpdate.M_EMAIL2.focus();
		} else {
			mypageUpdate.M_EMAIL2.readonly = true;
			mypageUpdate.M_EMAIL2.value = mypageUpdate.email3.value;
		}
	}
</script>



<script>
	function DaumPostcode() {

		new daum.Postcode(
				{

					oncomplete : function(data) {

						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.

						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

						var fullAddr = ''; // 최종 주소 변수

						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.

						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우

							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)

							fullAddr = data.jibunAddress;

						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.

						if (data.userSelectedType === 'R') {

							//법정동명이 있을 경우 추가한다.

							if (data.bname !== '') {

								extraAddr += data.bname;

							}

							// 건물명이 있을 경우 추가한다.

							if (data.buildingName !== '') {

								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);

							}

							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.

							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');

						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.

						document.getElementById('M_ZIPCODE').value = data.zonecode; //5자리 새우편번호 사용

						document.getElementById('M_ADDR1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.

						document.getElementById('M_ADDR2').focus();

					}

				}).open();

	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보수정</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form name="mypageUpdate" action="modifyAction.action" method="post"
		onsubmit="return check()">


		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" style="padding: 50px;">
					<table width="700" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="40" align="center" class="text01 formbar" colspan="2">회원정보수정</td>
						</tr>
						<tr>
							<td height="60"></td>
						</tr>
					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0"
						id="form">
						<tr>
							<td align="left" class="tdstyle2" colspan="2">기본정보</td>
						</tr>
						<tr>
							<td class="tdstyle1">아이디<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><s:property value="%{resultClass.M_ID}" />
						</tr>
						<tr>
							<td class="tdstyle1">비밀번호<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td><input type="password" name="M_PASSWD" size="30"	onfocus="on(this)" onblur="off(this)">
						 <font class="BFONT">영문/숫자를 이용하여 4~12자로 입력하세요</font></td>
						</tr>
						<tr>
							<td class="tdstyle1">비밀번호확인<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><input type="password" name="M_PASSWD2" size="30" onfocus="on(this)" onblur="off(this)">
						<font class="BFONT">비밀번호를 재입력 해주세요</font></td>
						</tr>
						<tr>
							<td class="tdstyle1">이 름<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><s:property value="%{resultClass.M_NAME}" />
							</td>
						</tr>
						<tr>
							<td class="tdstyle1">주민등록번호<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><s:property
									value="%{resultClass.M_JUMIN1}" /> - <s:property
									value="%{resultClass.M_JUMIN2}" /></td>
						</tr>
						<tr>
							<td class="tdstyle1">우편번호<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>

							<td valign="middle"><s:textfield name="M_ZIPCODE"
									id="M_ZIPCODE" theme="simple" value="%{resultClass.M_ZIPCODE}" />
								<input type="button" value="검색" onclick="DaumPostcode()">
								검색 버튼을 눌러 주소를 입력해 주세요</td>
						</tr>
						<tr>
							<td class="tdstyle1">주 소<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>

							<td valign="middle"><s:textfield name="M_ADDR1" id="M_ADDR1"
									theme="simple" value="%{resultClass.M_ADDR1}" /> <br> <s:textfield
									name="M_ADDR2" id="M_ADDR2" theme="simple"
									value="%{resultClass.M_ADDR2}" /></td>
						</tr>

						<tr>
							<td class="tdstyle1">휴대폰번호<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle"><s:textfield name="M_PHONE"
									theme="simple" value="%{resultClass.M_PHONE}" /> "-" 없이 숫자만
								입력하세요</td>
						</tr>
						
						<tr>
							<td class="tdstyle1">이메일<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif">
								</td>
							<td valign="middle">
							<s:textfield name="M_EMAIL1" id="M_EMAIL1" theme="simple" value="%{resultClass.M_EMAIL1}" /> @ 
							<s:textfield name="M_EMAIL2" id="M_EMAIL2" theme="simple" value="%{resultClass.M_EMAIL2}" />
								<select name="email3"  id="email3"
								onChange="checkemailaddy();">
									<option value="" selected>선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="hanmail.com">hanmail.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="1">직접입력</option>
									
							</select>
							</td>
						</tr>
						


					</table>
					<table width="700" border="0" cellspacing="0" cellpadding="0"
						id="form">

						<tr>
							<td align="left" class="tdstyle2" colspan="2">회원추가정보</td>
						</tr>
						<tr>
							<td class="tdstyle1">환불계좌 정보<img
								src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"></td>
							<td valign="middle">예금주<s:textfield name="M_DEPOSITOR" theme="simple"
							value="%{resultClass.M_DEPOSITOR}" /><br> <br> 은행명<s:textfield name="M_NAME_BANK" theme="simple"
							value="%{resultClass.M_NAME_BANK}" /> <br><br> 계좌번호<s:textfield name="ACCOUNT_NO" theme="simple"
							value="%{resultClass.ACCOUNT_NO}" /><br>
							</td>

						</tr>

						</td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="border: 0px;"><input
								type="submit" value="수정" class="submit"><input
								type="button" value="취 소" onclick="history.go(-1)"
								class="hreflink">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<input type="button" value="회원탈퇴" onclick="document.location.href='deleteAction.action'"
								class="submit">
								</td>
								
						</tr>
					</table>


					</form>
</body>
</html>