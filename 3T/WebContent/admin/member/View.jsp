<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 상세보기</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window
				.open(url, name,
						"scrollbars=no, status=no, resizable=no, width=600, height=500");

	}
	
	function action(i){
		if(i==2){
			document.form.action='AM_List.action?currentPage=<s:property value="currentPage" />'
		}
		
	}
</script>
</head>

<body>
	<table width="80%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"class="text01 formbar" ><h2>회원정보 상세보기</h2></td>
		</tr>
	</table>

	<table width="60%" border="0" cellspacing="0" cellpadding="0"  id="form">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>

		<tr>
			<td width="80" class="tdstyle1">회원번호</td>
			<td width="500"><s:property value="resultClass.m_no" /></td>
		</tr>

		<tr>
			<td width="80" class="tdstyle1">이름</td>
			<td width="500"><s:property value="resultClass.m_name" /></td>
		</tr>
		<tr>
			<td width="80" class="tdstyle1">id [회원등급]</td>
			<td width="500"><s:property value="resultClass.m_id" /> [
				<s:if test="resultClass.m_admin==0">ADMIN</s:if>
				<s:elseif test="resultClass.m_admin==1">SILVER</s:elseif>
				<s:elseif test="resultClass.m_admin==2">GOLD</s:elseif>
				<s:elseif test="resultClass.m_admin==3">VIP</s:elseif>

			]</td>
		</tr>

		<tr>
			<td width="80" class="tdstyle1">passwd</td>
			<td width="500">
				<!-- 이렇게도 쓸수 있다는거다 이자식들아 --> ${resultClass.m_passwd }
			</td>
		</tr>

		<tr>
			<td width="80" class="tdstyle1">주민등록번호</td>
			<td width="500"><s:property value="resultClass.m_jumin1" />-<s:property
					value="resultClass.m_jumin2" /></td>
		</tr>
		<tr>
			<td width="80" class="tdstyle1">TEL</td>
			<td width="500"><s:property value="resultClass.m_phone" /></td>
		</tr>
		<tr>
			<td width="80" class="tdstyle1">email</td>
			<td width="500"><s:property value="resultClass.m_email1" />@<s:property
					value="resultClass.m_email2" /></td>
		</tr>
		<tr>
			<td width="80" class="tdstyle1">주소</td>
			<td width="500">( <s:property value="resultClass.m_zipcode" />)
				<s:property value="resultClass.m_addr1" /> <s:property
					value="resultClass.m_addr1" />
			</td>
		</tr>
		<tr>
			<td width="80" class="tdstyle1">가입날짜</td>
			<td width="500"><s:property value="resultClass.m_regdate" /></td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">예금주</td>
			<td width="500"><s:property value="resultClass.m_depositor" />
			</td>
		</tr>
		<tr>
			<td width="100" class="tdstyle1">계좌번호</td>
			<td width="500">( <s:property value="resultClass.m_name_bank" />
				) <s:property value="resultClass.account_no" />
			</td>
		</tr>





		<tr>
			<td colspan="2" height="10"></td>
		</tr>

		<tr>
			<td colspan="2" align="right">

				<form action="AM_Coupon.action">

					<input type="hidden" name="m_id_f" value="${resultClass.m_id}">
					<input type="hidden" name="m_no" value="${resultClass.m_no}">
					<input type="hidden" name="currentPage" value="${currentPage}">
					<input type="text" name="m_coupon_content_f"  style="width: 100px; height: 30px;"> <input
						type="submit" value="쿠폰주기" class="submit">
				</form>
				<br>
				<form action="AM_Msg.action">

					<input type="hidden" name="m_id_f" value="${resultClass.m_id}">
					<input type="hidden" name="m_no" value="${resultClass.m_no}">
					<input type="hidden" name="currentPage" value="${currentPage}">
					<input type="text" name="m_msg_content_f"  style="width: 100px; height: 30px;"> <input
						type="submit" value="쪽지보내기" class="submit">
				</form>
								<br>
				
				<form name="form">
				<input name="delete_b" type="button" value="삭제" class="hreflink"
				onClick="javascript:location.href=('AM_Delete.action?m_no=<s:property value="resultClass.m_no" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list_b" type="button" value="목록" class="submit"
				onClick="javascript:location.href='AM_List.action?currentPage=<s:property value="currentPage" />'">
			
				</form>
			</td>
		</tr>

	</table>
	
	
</body>
</html>















