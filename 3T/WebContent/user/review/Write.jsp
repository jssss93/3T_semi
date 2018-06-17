<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
	<style type="text/css">
#form td.tdstyle2 {
	background-color: #000000;
	border: #ccc 1px solid;
	width: 400px;
	padding: 20px;
	font-size: 14px;
	font-weight: bold;
	color: #000;
}
</style>

	<title>REVIEW</title> <script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=600, height=500");
		
	}
	function validation() {

		var frm = document.forms[0];

		if (frm.REV_subject.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		} else if (frm.REV_name.value == "") {
			alert("이름을 입력해주세요.");
			return false;
		} else if (frm.REV_passwd.value == "") {
					alert("비밀번호를 입력해주세요.");
					return false;
				} else if (frm.REV_content.value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}

		return true;
	}
</script>
</head>
<body>




	<table width="600" border="0" cellspacing="0" cellpadding="2"
		align="center">
		<tr>
			<td align="center" class="text01 formbar">REVIEW</td>

		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<s:if test="reply">
		<form action="Review_ReplyAction.action" method="post"
			enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="REV_ref" value="%{resultClass.REV_ref}" />
			<s:hidden name="REV_re_level" value="%{resultClass.REV_re_level}" />
			<s:hidden name="REV_re_step" value="%{resultClass.REV_re_step}" />
	</s:if>



	<s:elseif test="resultClass == NULL">
		<form action="Review_Write.action?goods_no=${goods_no }" method="post"
			enctype="multipart/form-data" onsubmit="return validation();">
			<s:param name="REV_goods_no">
				<s:property value="REV_goods_no" />
			</s:param>
	</s:elseif>


	<s:else>
		<form action="Review_ModifyAction.action" method="post"
			enctype="multipart/form-data">
			<s:hidden name="REV_no" value="%{resultClass.REV_no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.REV_file_savname}" />
	</s:else>
	<table width="600" border="0" cellspacing="0" height="120">
		<s:if test="goods_no <=0">
			<input type="hidden" name="REV_goods_no" value="goods_no" />
			<tr>
				<td align="center" width="120"><img src="/3T/upload/QA.PNG"
					width="80" height="100"></td>
				<td colspan="2"><hr align="center" width="470" color="#8C8C8C">
						<br> <input type="button" name="button" value="상품정보선택 ▶"
							class="inputb"
							onClick="javascript:open_win_noresizable('Review_SearchGoodsForm.action?currentPage=<s:property value="currentPage" />', write)"></td>

			</tr>


		</s:if>
		<s:else>
			<s:url id="viewURL" action="GoodsView">
				<s:param name="goods_no">
					<s:property value="goods_no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>
			<tr>
				<td align="center" width="120"><img
					src="/3T/upload/<s:property value="goods_resultClass.goods_file_savname.split(',')[0]"/>"
					width="80" height="100"></td>

				<td colspan="2"><s:property
						value="goods_resultClass.goods_name" /><br>KRW <s:property
							value="goods_resultClass.goods_price" />
						<hr align="center" width="470" color="#8C8C8C">
							<br> <s:a href="%{viewURL}">
									<input type="button" name="button" value="상품 상세보기 ▶" />
								</s:a> <input type="button" name="button" value="상품정보 선택 ▶"
								onclick="javascript:open_win_noresizable('Review_SearchGoodsForm.action?currentPage=<s:property value="currentPage" />', write)" /></td>
			</tr>
		</s:else>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0">



		<c:choose>
			<c:when test="${session.M_ID != NULL}">
				<tr>
					<td align="right" colspan="2"><font color="#FF0000">*</font>는
						필수 입력사항입니다.</td>
				</tr>

				<tr bgcolor="#777777">
					<td height="1" colspan="2"></td>
				</tr>


				<tr>
					<td width="100" class="tdstyle2"><font color="#FF0000">*</font><b>SUBJECT</b></td>
					<td width="500" class="tdstyle2"><s:textfield
							name="REV_subject" theme="simple"
							value="%{resultClass.REV_subject}" cssStyle="width:370px"
							maxlength="50" /></td>
				</tr>


				<tr>

					<td class="tdstyle2"><font color="#FF0000">*</font><b>NAME</b></td>
					<td class="tdstyle2"><s:textfield name="REV_name"
							theme="simple" value="%{resultClass.REV_name}"
							cssStyle="width:100px" maxlength="20" /></td>
				</tr>




				<tr>

					<td colspan="2" bgcolor="#FFFFFF"><s:textarea
							name="REV_content" theme="simple"
							value="%{resultClass.REV_content}" cols="100" rows="20" /></td>
				</tr>


				<tr>
					<td class="tdstyle2"><b>FILE</b></td>
					<td class="tdstyle2"><s:file name="upload" theme="simple" />
						<s:if test="resultClass.REV_file_orgname != NULL">
        	&nbsp; * <s:property value="resultClass.REV_file_orgname" />파일이 등록 되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
        	</s:if></td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF"><font color="#FF0000">*</font>PASSWORD</td>
					<td bgcolor="#FFFFFF"><s:textfield name="REV_passwd"
							theme="simple" value="%{resultClass.REV_passwd}"
							cssStyle="width:100px" maxlength="20" /></td>
				</tr>
				<%-- <tr>
			<td bgcolor="#FFFFF">개인정보 수집 및 이용 동의</td>
			<td bgcolor="#FFFFF"><s:textarea name="content" theme="simple"
					value="■ 개인정보의 수집·이용 목적
서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 회원관리 등을 위한 목적
■ 수집하려는 개인정보의 항목
이름, 주소, 연락처 등
■ 개인정보의 보유 및 이용 기간
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당정보를 파기합니다.
#개인정보의 위탁 처리애즈클로는 서비스 향상을 위해 관계법령에 따라 회원의 동의를 얻거나 관련 사항을 공개 또는 고지 후 회원의 개인정보를 외부에 위탁하여 처리하고 있습니다. 애즈클로의 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다. - 수탁자 : (주)루나소프트- 위탁 업무 내용 : 카카오 알림톡 발송 업무 직송 등 일부 배송형태에 따라, 전자상거래소비자보호법 제 21조에 의거 협력사에 배송정보가 제공 됩니다."
					cols="80" rows="10"></s:textarea></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#FFFFFF">개인정보 수집 및 이용에 동의하십니까? <input
				type="radio" name="objChkBox" value="동의">동의</input> <input
				type="radio" name="objChkBox" value="동의안함">동의안함</input>
			</td>
		</tr> --%>


				<input type="hidden" name="REV_member_id" value="${session.M_ID }" />

				<tr>
					<td align="right" colspan="2"><input name="submit"
						type="submit" value="OK" class="submit"> <input
							name="list" type="button" value="CANCLE" class="hreflink"
							onClick="javascript:location.href='Review_list.action?currentPage=<s:property value="currentPage"/>'"></td>
				</tr>
			</c:when>
			<c:when test="${session.M_ID == NULL }">
				<tr>
					<td><h4>회원에게만 리뷰 작성 권한이 있습니다.</h4></td>


				</tr>
				<tr bgcolor="#777777">
					<td height="1" colspan="2"></td>
				</tr>
			</c:when>
		</c:choose>
	</table>
	</form>
</body>
</html>