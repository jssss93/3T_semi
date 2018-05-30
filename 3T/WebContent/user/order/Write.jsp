<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Order</title>
<link rel="stylesheet" href="/3T/user/order/common/css/css.css"
	type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
    
    function sample7_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample7_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample7_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample7_address2').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">

function email_change(){

	if(document.Orderinformation.email.options[document.Orderinformation.email.selectedIndex].value == '0'){
		 document.Orderinformation.ORDER_EMAIL2.disabled = true;
	 	 document.Orderinformation.ORDER_EMAIL2.value = "";
	}
	if(document.Orderinformation.email.options[document.Orderinformation.email.selectedIndex].value == '9'){
	 	document.Orderinformation.ORDER_EMAIL2.disabled = false;
	 	document.Orderinformation.ORDER_EMAIL2.value = "";
	 	document.Orderinformation.ORDER_EMAIL2.focus();
	} else{
		
		 document.Orderinformation.ORDER_EMAIL2.disabled = false;
		 document.Orderinformation.ORDER_EMAIL2.value = document.Orderinformation.email.options[document.Orderinformation.email.selectedIndex].value;
	}

}

function validation() {
	
	var frm = document.Orderinformation;
	
	if(frm.Order_Name.value == "") {
		alert("제목을 입력해주세요.");
		return false;
	} 
	
	else if(frm.name.value == "") {
		alert("이름을 입력해주세요.");
		return false;
	}
	
	else if(frm.password.value == "") {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	else if(frm.content.value == "") {
		alert("내용을 입력해주세요.");
		return false;			
	} 
	
	return true;
}


</script>
</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="30"></td>
		</tr>
		<tr>
			<td align="left"><h2>Order</h2></td>
		</tr>
		<tr>
			<td height="50"></td>
		</tr>
	</table>

	<table width="1030" border="1" cellspacing="0" cellpadding="2">
		<tr>
			<td width="50" rowspan="2" align="center">해택 정보</td>
			<td width="400">&nbsp;&nbsp;$ [FAMILY]회원이십니다.</td>
		</tr>
		<tr>
			<td width="400">&nbsp;&nbsp;쿠폰 : <font color="#FF0000">$
					개</font></td>
		</tr>
	</table>

	<table width="1030" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td height="20"></td>
		</tr>
		<tr>
			<td colspan="6" align="left" width="70"><h4>&nbsp;&nbsp;국내배송상품
					주문내역</h4></td>
		</tr>

		<tr align="center" bgcolor="#F9F9F9">
			<td width="50"><input name="checkbox" type="checkbox" /></td>
			<td width="100"><strong>이미지</strong></td>
			<td width="400"><strong>상품정보</strong></td>
			<td width="80"><strong>판매가</strong></td>
			<td width="80"><strong>수량</strong></td>
			<td width="120"><strong>합계</strong></td>
		</tr>


		<s:iterator value="list" status="stat">
			<!-- http://localhost:8080/StrutsBoard/viewAction.action?no=2&currentPage=1 -->
			<s:url id="viewURL" action="viewAction">
				<s:param name="no">
					<s:property value="no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr bgcolor="#F9F9F9" align="center">
				<td><img src="/2222/image/${ORDER_IMG}.small.jpg" width="50"></td>
				<td align="center"><s:property value="ORDER_GOODS_INFO" /></td>
				<td align="center"><s:property value="ORDER_PRICE" /></td>
				<td align="center"><s:property value="ORDER_GOODS_COUNT" /></td>
				<td><s:property value="ORDER_TOTAL" /></td>
			</tr>


		</s:iterator>

		<s:if test="list.size() <= 0">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="6">등록된 게시물이 없습니다.</td>
			</tr>

		</s:if>
		<tr bgcolor="#F9F9F9">
			<td colspan="2">&nbsp;&nbsp;&nbsp;[기본배송]</td>
			<td align="right" colspan="6">상품구매금액 $ +배송비 $ =합계 :<font
				color="#FF0000">KRW $ </font></td>
		</tr>
		<tr align="left">
			<td colspan="6" bgcolor="#FFCBCB"><font color="#CC3D3D">
					&nbsp;&nbsp;&nbsp;⊙&nbsp;&nbsp;상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서
					가능합니다.</td>
			</font>
		</tr>

		<tr align="right">
			<td width="80">선택한상품을</td>
			<td align="left"><input name="delete" type="button"
				value="x 삭제하기" style="background-color: #B8B8B8;" /></td>
			<td colspan="6"><input name="Main" type="button" value="이전페이지 ▶"
				onClick="javascript:location.href='Main.action'"></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	<hr align="left" width="1030" color="#8C8C8C">
	<table width="1030" border="0" cellspacing="0" cellpadding="3">
			<tr>
				<td height="10"></td>
			</tr>	
			<tr>
				<td height="39" align="left"><font style="font-weight: bold;">주문 정보</font></td>
				<td align="right"><font color="red" size="1">★</font><font color="#A6A6A6">필수입력사항</font></td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>	
	</table>
	<form method="post" action="WriteAction.action" name="Orderinformation" onSubmit="">
		<table width="1030" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td width="50" align="center"  bgcolor="#F9F9F9">주문하시는분 <font color="red" size="1">★</font></td>
				<td width="400"><input type="text" name="ORDER_NAME" size="10"
					maxlength="12"></td>
			</tr>
			<tr>
				<td align="center" valign="top"  bgcolor="#F9F9F9">주소 <font color="red" size="1">★</font></td>
				<td><input type="text" name="ORDER_ZIPCODE" id="sample7_postcode" placeholder="우편번호">
					<input type="button" onclick="sample7_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="ORDER_ADDRESS1" id="sample7_address" placeholder="주소" si>
					<input type="text" name="ORDER_ADDRESS2" id="sample7_address2" placeholder="상세주소">
				</td>
				
			</tr>
			<tr>
				<td width="50" align="center"  bgcolor="#F9F9F9">휴대전화 <font color="red" size="1">★</font></td>
				<td width="400"><select name="ORDER_PHONE1" onchange="Phone_change()">
					    <option value="010" >010</option>
					    <option value="011">011</option>
					    <option value="011">016</option>
					    <option value="011">017</option>
					    <option value="011">018</option>
					    <option value="011">019</option>
					    </select>
					    -<input type="text" name="ORDER_PHONE2" size="6"
					maxlength="4">-<input type="text" name="ORDER_PHONE3" size="6"
					maxlength="4"></td>
			</tr>
			<tr>
				<td width="50" align="center" rowspan="2"  bgcolor="#F9F9F9">이메일 <font color="red" size="1">★</font></td>
				<td width="400">     
					<input type="text" name="ORDER_EMAIL1" value="이메일" onfocus="this.value='';">   @
					<input type="text" name="ORDER_EMAIL2"  value="naver.com" disabled>
					<select name="email" onchange="email_change()">
					    <option value="0" > 선택하세요 </option>
					    <option value="9">직접입력</option>
					    <option value="naver.com">naver.com</option>
					    <option value="daum.net">daum.net</option>
					    <option value="nate.com">nate.com</option> 
					    <option value="hotmail.com">hotmail.com</option> 
					    <option value="yahoo.com">yahoo.com</option> 
					    <option value="empas.com">empas.com</option> 
					    <option value="korea.com">korea.com</option> 
					    <option value="dreamwiz.com">dreamwiz.com</option> 
					    <option value="gmail.com">gmail.com</option> 
					 </select>
			   <p>
					<font color="#A6A6A6">-이메일을 통해 주문처리과정을 보내드립니다.</font><br>
					<font color="#A6A6A6">-이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요</font>
					
					</td>
			</tr>
		</table>
	

	<table width="1030" border="0" cellspacing="0" cellpadding="3">
			<tr>
				<td height="10"></td>
			</tr>	
			<tr>
				<td height="39" align="left" ><font style="font-weight: bold;">배송 정보</font></td>
				<td align="right"><font color="red" size="1">★</font><font color="#A6A6A6">필수입력사항</font></td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>	
	</table>
	
		<table width="1030" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td width="50" align="center"  bgcolor="#F9F9F9">배송지 선택</td>
				<td width="400">
				<input type="radio" name="RECIPIENT_CHOICE" value="주문자 정보와 동일" checked="checked"/>주문자 정보와 동일
				<input type="radio" name="RECIPIENT_CHOICE" value="새로운배송지" />새로운배송지
				<input type="button" value=" 주소록보기  "/>
				</td>
			</tr>
			
			<tr>
				<td width="50" align="center"  bgcolor="#F9F9F9">받으시는분 <font color="red" size="1">★</font></td>
				<td width="400"><input type="text" name="RECIPIENT_NAME" size="10"
					maxlength="12"></td>
			</tr>
			<tr>
				<td align="center" valign="top"  bgcolor="#F9F9F9">주소 <font color="red" size="1">★</font></td>
				<td><input type="text" name="RECIPIENT_ZIPCODE" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="RECIPIENT_ADDRESS1" id="sample6_address" placeholder="주소">
					<input type="text" name="RECIPIENT_ADDRESS2" id="sample6_address2" placeholder="상세주소">
				</td>
				
			</tr>
			<tr>
				<td width="50" align="center"  bgcolor="#F9F9F9">휴대전화 <font color="red" size="1">★</font></td>
				<td width="400"><select name="RECIPIENT_PHONE1" onchange="Phone_change()">
					    <option value="010" >010</option>
					    <option value="011">011</option>
					    <option value="011">016</option>
					    <option value="011">017</option>
					    <option value="011">018</option>
					    <option value="011">019</option>
					    </select>-<input type="text" name="RECIPIENT_PHONE2" size="6"
					maxlength="4">-<input type="text" name="RECIPIENT_PHONE3" size="6"
					maxlength="4"></td>
			</tr>
		</table>
	
	<table width="1030" border="0" cellspacing="0" cellpadding="3">
			<tr>
				<td height="10"></td>
			</tr>	
			<tr>
				<td height="39" align="left"><font style="font-weight: bold;">결제 예정 금액</font></td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>	
	</table>
	<table width="1030" border="1" cellspacing="0" cellpadding="3">
			<tr  bgcolor="#F9F9F9">
				<td align="center" height="60" width="340"><font  color="#5D5D5D">총 주문 금액 </font>
				<input type="button" value=" 내역보기 >" OnClick="window.open('paylist.action','window_name','width=430,height=320,location=no,status=no,toolbar=no,scrollbars=no');"/></td>
				<td align="center" width="340"><font color="#5D5D5D">총 할인 + 부가결제 금액</font></td>
				<td align="center" width="340"><font color="#5D5D5D">총 결제예정 금액</font></td>
			</tr>	
			<tr >
				<td width="340" align="center"><font style="font-weight: bold;"><h3>KRW $</h3></font></td>
				<td width="340" align="center"><font style="font-weight: bold;"><h3>- KRW $</h3></font></td>
				<td  align="center"><font style="font-weight: bold;" color="#FF0000"><h3>= KRW $</h3></font></td>
			</tr>
	</table>
	<table width="1030" border="0" cellspacing="0" cellpadding="3">
				<tr>
					<td height="10"></td>
				</tr>	
				<tr>
					<td height="39" align="left"><font style="font-weight: bold;">결제 수단</font></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>	
	</table>
	<table width="1030" border="1" cellspacing="0" cellpadding="3">
				<tr>
					<td width="830" height="50">&nbsp;&nbsp;&nbsp;<input type="radio" name="PAYMENT" value="무통장 입금" checked="checked"/>무통장 입금&nbsp;&nbsp;&nbsp;
						<input type="radio"name="PAYMENT" value="카드 결제"/>카드 결제
					</td>
					<td rowspan="2" valign="top" > 
						<table width="200" border="0"  cellspacing="0" cellpadding="3">
							<tr>
								<td align="right" valign="top" width="500" colspan="2"><font style="font-weight: bold;"><h4>무통장 입금 최종결제 금액</h4></font></td>
							</tr>
							<tr>
								<td align="center" width="40" ><font style="font-weight: bold;" color="#FF0000"><h4>KRW</h4></font></td>
								<td align="right"><font style="font-weight: bold;" color="#FF0000"><h2>$</h2></font></td>
							</tr>
							<tr>
								<td align="center"><input type="checkbox" name="checkbox"/></td>
								<td align="left"><font style="font-weight: bold;" ><h4>결제정보를 확인하였으며, 구매진행에 동의합니다.</h4></font></td>
							</tr>
							<tr>
								<td colspan="2"  align="center" >
								<input name="submit" type="submit"  style="width:22em; font-family:돋움; background-color:#121212; color:#FFFFFF; line-height: 5em; border-color:#121212; " value="결제하기 "/>
								</td>
							</tr>
							<tr>
								<td height="20"></td>
							</tr>
						</table>
					</td>

				</tr>	
				<tr>
					<td style="padding: 3em;" valign="top">
						<table width="530" border="1" cellspacing="0" cellpadding="3">
							<tr>
								<td width="104" align="center"  bgcolor="#F9F9F9">입금자명</td>
								<td><input type="text" name="DEPOSIT_NAME" size="30"/></td>
							</tr>
							<tr>
								<td width="104" align="center"  bgcolor="#F9F9F9">입금은행</td>
								<td><input type="text" name="DEPOSIT_BANK" size="30"/></td>
							</tr>
						</table>
					</td>
				</tr>
				
	</table>
	</form>
	<table width="1030" border="0" cellspacing="0" cellpadding="3">
				<tr>
					<td height="10"></td>
				</tr>	
				
	</table>
	<table width="1030" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td><font style="font-weight: bold;">무이자 할부 이용안내</font></td>
			</tr>
			<tr>
				<td height="70">
					&nbsp;&nbsp;&nbsp;- 무이자할부가 적용되지 않은 상품과 무이자 할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.<br>
					&nbsp;&nbsp;&nbsp;- 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.
				</td>
			</tr>
	</table>
	<table width="1030" border="0" cellspacing="0" cellpadding="3">
				<tr>
					<td height="10"></td>
				</tr>	
				
	</table>
	<table width="1030" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td><font style="font-weight: bold;">이용 안내</font></td>
			</tr>
			<tr>
				<td height="70">
					<h4>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</h4>
					&nbsp;&nbsp;&nbsp; 1.<a href="javascript:;" onclick="window.open('http://service-api.echosting.cafe24.com/shop/notice_XP_ActiveX.html','','width=795,height=500,scrollbars=yes',resizable=1);">안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</a>
					<br>&nbsp;&nbsp;&nbsp; 2.<a href="http://www.microsoft.com/korea/windowsxp/sp2/default.asp" target="_blank">Service Pack 2에 대한 Microsoft사의 상세안내 </a>
					<h4>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h4>
					&nbsp;&nbsp;&nbsp; 1.<strong>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</strong>
					<br>&nbsp;&nbsp;&nbsp; 2.결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)
					<br>&nbsp;&nbsp;&nbsp; 3. 최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(무통장, 휴대폰결제 포함)
				</td>
			</tr>
	</table>
</body>
</html>