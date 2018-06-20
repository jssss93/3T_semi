<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>새 상품 등록</title>


<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function validation() {
		var frm = document.forms[0];

		if (frm.goods_name.value == "") {
			alert("입력해주세요");
			return false;
		} else if (frm.name.value == "") {
			alert("입력해주세요");
			return false;
		} else if (frm.password.value == "") {
			alert("입력해주세요");
			return false;
		} else if (frm.content.value == "") {
			alert("입력해주세요");
			return false;
		}

		return true;
	}

	$(document).ready(function() {
		$("#content").cleditor();
	});
</script>
</head>
<body>


	<s:if test="resultClass == NULL">
		<table width="80%" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center" class="text01 formbar"><h2>상품 등록</h2></td>
			</tr>
		</table>
		<form action="AG_Write.action" method="post"
			enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>

	<s:else>
		<table width="60%" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center" class="text01 formbar"><h2>상품 수정</h2></td>
			</tr>
		</table>
		<form action="AG_Modify.action" method="post"
			enctype="multipart/form-data">
			<s:hidden name="goods_no" value="%{resultClass.goods_no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.goods_sav_filename}" />
	</s:else>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">*</font>는 필수
				입력사항입니다.</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				상품명</td>
			<td width="500" class="tdstyle2"><s:textfield name="goods_name"
					theme="simple" value="%{resultClass.goods_name}"
					cssStyle="width:370px" maxlength="50" /></td>
		</tr>

		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				상품 색상</td>
			<td width="500" class="tdstyle2"><s:textfield
					name="goods_color" theme="simple"
					value="%{resultClass.goods_color}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				상품 가격</td>
			<td width="500"class="tdstyle2""><s:textfield
					name="goods_price" theme="simple"
					value="%{resultClass.goods_price}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				상품 사이즈</td>
			<td   width="500"class="tdstyle2"><s:textfield name="goods_size"
					theme="simple" value="%{resultClass.goods_size}"
					cssStyle="width:370px" maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				상품 카테고리</td>
			<td   width="500" class="tdstyle2"><s:textfield
					name="goods_category" theme="simple"
					value="%{resultClass.goods_category}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				상품 총 개수</td>
			<td  class="tdstyle2" width="500"><s:textfield
					name="goods_totalcount" theme="simple"
					value="%{resultClass.goods_totalcount}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>
				관련상품</td>
			<td  class="tdstyle2"  width="500"><s:textfield
					name="goods_related_product" theme="simple"
					value="%{resultClass.goods_related_product}" cssStyle="width:370px"
					maxlength="50" /></td>
		</tr>


		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 상품 내용</td>
			<td  class="tdstyle2"><s:textarea name="goods_content"
					theme="simple" value="%{resultClass.goods_content}" cols="50"
					rows="10" /></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 메인사진</td>
			<td class="tdstyle2"><s:file label="File1" name="uploads"
					theme="simple" /> <s:if test="resultClass.goods_org_file != NULL">
				&nbsp; * 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
			</s:if></td>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 상세사진1</td>
			<td class="tdstyle2"><s:file label="File2" name="uploads"
					theme="simple" /></td>

		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 상세사진2</td>
			<td class="tdstyle2"><s:file label="File3" name="uploads"
					theme="simple" /> 
		</tr>
			<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 상세사진3</td>
			<td class="tdstyle2"><s:file label="File4" name="uploads"
					theme="simple" /> 
		</tr>
			<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 상세사진4</td>
			<td class="tdstyle2"><s:file label="File5" name="uploads"
					theme="simple" /> 
		</tr>
		

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>


		<tr>
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="작성완료" class="submit"> <input name="list"
				type="button" value="목록" class="hreflink"
				onClick="javascript:location.href='AG_List.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>

	</table>
	</form>
</body>
</html>