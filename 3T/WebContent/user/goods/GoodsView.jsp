<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>good_detatil</title>

<!-- 메인이미지 -->
<!-- <script>
	window.onload = function() {

		//노드 생성

		var img = document.createElement('img');

		img.src = '/StrutsBoard/goods_jsp/image/test.JPG';
		img.width = 460;
        
		img.height = 460;

		//노드 연결

		document.body.appendChild(img);

	};
</script> -->
</head>
<center>
	<table width="1000" border="1" cellpadding="0" cellspacing="0">
		<body>
			<!-- 상품 메인 이미지-->
		<tr>
			<td height="490" align="center" valign="middle"><img width="490"
				height="490" src="/goods/upload/test.JPG"></td>
			<!-- 상품 상세 내용 -->

			<td>
				<form action="MainAaction.action" id="order" method="post" enctype="multipart/-data">
				   <s:hidden name="goods_name" value="%{resultClass.goods_name}" />
		           <s:hidden name="goods_price" value="%{resultClass.goods_price}" />
		           <s:hidden name="goods_totalcount" value="%{resultClass.goods_totalcount}" />
					<table class="font-price" border="1" cellpadding="0"
						cellspacing="0">
						<tr>
							<td style="text-align: left; font-size: 30pt;" colspan="2">
								<!-- 상품 이름 --><s:property value="resultClass.goods_name"/>
							</td>
						</tr>
						<!-- 상품가격 텍스트 -->
						<tr>
							<td width="280"><br> <br>
								<p></p> <!--상품 가격  --> Price : \ &nbsp; <input
								name="GOODS_PRICE" type="hidden" value="9000"><s:property value="resultClass.goods_price"/>
								<p></p></td>
							<td></td>
						</tr>
						<!-- TOTAL,+,-버튼 -->
						<tr>
							<td style="font-size: 17pt; align: left;" rowspan="2">TOTAL<s:property value="resultClass.goods_totalcount"/>
								<input name="goods_totalcount"
								style="width: 25px; text-align: center; -ms-ime-mode: disabled;"
								onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
								type="text" maxlength="3" value="1">
							</td>
						</tr>
						<tr>
							<td style="align: left;"><img width="30" align="left"
								id="plus" onclick="change(1);" src="/goods/upload/+.JPG"
								border="1"></td>
							<td><img width="30" id="minus" onclick="change(-1);"
								src="/goods/upload/-.JPG" border="1"></td>
						</tr>
						<!-- SIZE 텍스트, 텍스트박스 -->
						<tr>
							<td style="width: 170px; font-size: 17pt; align: left;">
								<p></p> Size : <select name="GOODS_SIZE" id="GOODS_SIZE"
								size="1">
									<option value="-"><s:property value="resultClass.goods_size"/></option>
							</select>
							</td>
						</tr>
						<!-- BUY,ADD CART추가하기 -->
						<tr>
							<td>
								<!-- 상품번호 전송 --> <input name="GOODS_NO" type="hidden"
								value="572" /> <tabel>
								<body>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td colspan="2">
										<hr />
									</td>
								</tr>
								<tr>
									<td>
										<!-- 상품구매버튼 --> <!-- 로그인 o --> <!-- 로그인 x --> <input
										name="Buy" style=""
										onmouseover="this.src='/goods/upload/buy2.JPG'"
										onmouseout="this.src='/goods/upload/buy.JPG'"
										onclick="check(3);" type="image" src="/goods/upload/buy.JPG"
										value="Submit" />
									</td>
									<td>
										<!-- 장바구니버튼 --> <!-- 로그인 o --> <!-- 로그인 x --> <input
										name="Buy" style=""
										onmouseover="this.src='/goods/upload/add to cart2.JPG'"
										onmouseout="this.src='/goods/upload/add to cart.JPG'"
										onclick="check(3);" type="image"
										src="/goods/upload/add to cart.JPG" value="Submit" />
									</td>
								</tr>
								<tr>
									<td>
										<!-- 옷 정보 --> <pre>
					    <font color="#de1616">INFO</font>
                        <s:property value="resultClass.goods_content"/>

                        <font color="#de1616">SIZE</font>
                                                     상의
                        S : 어깨 40.5 / 가슴 46 / 소매길이 62 / 총길이 71.5
                        M : 어깨 42.5 / 가슴 48 / 소매길이 63 / 총길이 73
                        L : 어깨 44.5 / 가슴 51.5 / 소매길이 64 / 총길이 74.5 (모델착용)

                                                    하의
                        S : 허리 38 / 밑위 23 / 허벅지 27.5 / 밑단 16.5 / 총기장 96 (모델착용)
                        M : 허리 40 / 밑위 24 / 허벅지 29 / 밑단 17.5 / 총기장 97
                        L : 허리 42 / 밑위 25 / 허벅지 30.5 / 밑단 18.5 / 총기장 98
                       (측정 방법에따라 1~3cm의 오차는 있을 수 있습니다)

                       <font color="#de1616">FABRIC</font>
                       TR (레이온55% + 폴리 40% + 스판 5%)

                       <font color="#de1616">MODEL</font>
                       181cm / 68kg / 상의 100 / 허리 28
                       * 상의는 크게입는걸 좋아해 무조건 제일 큰 사이즈착용
                             </pre>
								</tr>
							</td>
							</body>
					</table>
				</form>
			</td>
		</tr>
		</body>
	</table>

	<!-- 상품 상세 이미지 -->
	<br> <br> <br>
	<table width="960" border="1" height="631" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="0" align="center"><h2>img</h2></td>
		</tr>
		<tr>
			<td width="100" height="100" align="center"><h2>Main logo</h2></td>
		</tr>
	</table>
	<br> <br> <br>
	<table width="960" border="1" height="631" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="0" align="center"><h2>img</h2></td>
		</tr>
	</table>
	<br> <br> <br>
	<table width="960" border="1" height="631" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="0" align="center"><h2>img</h2></td>
		</tr>
	</table>
	<!-- 옷 자세히 보기 -->
	<br> <br> <br>
	<table width="960" border="1" height="631" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="3" align="center"><h2>Main logo</h2></td>
		</tr>
		<tr>
			<td width="200" height="200" align="center"><h2>clothes
					ditail img</h2></td>
		</tr>
		<tr>
			<td width="200" height="200" align="center"><h2>clothes
					ditail img</h2></td>
		</tr>
		<tr>
			<td width="200" height="200" align="center"><h2>clothes
					ditail img</h2></td>
		</tr>
	</table>
</center>
<!-- 모델 정보 -->
<br>
<br>
<br>
<table width="500" border="1" height="500" align="CENTER"
	cellpadding="0" cellspacing="0">

	<tr>
		<td colspan="0" align="center"><h2>Model info</h2></td>
	</tr>
</table>
<!-- 관련상품 -->
<br>
<br>
<br>
<table width="500" border="1" height="150" align="LEFT" cellpadding="15"
	cellspacing="10">
	<tr>
		<td rowspan="2" align="center" width="400" height="150"><h2>related
				product</h2></td>
		<td rowspan="2" align="center" width="400" height="150"><h2>related
				product</h2></td>
	</tr>
</table>
<!-- 리뷰 게시판 -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<table width="960" border="1" height="200" align="center"
	cellpadding="0" cellspacing="10">
	<tr>
		<td colspan=1 align="center"><h2>review</h2></td>
	</tr>

	<tr>
	<tr>
		<td width="150" height="400"></td>
	</tr>

</table>
<!-- Q & A 게시판 -->
<br>
<br>
<br>
<table width="960" border="1" height="200" align="center"
	cellpadding="0" cellspacing="10">
	<tr>
		<td colspan=1 align="center"><h2>Q & A</h2></td>
	</tr>

	<tr>
	<tr>
		<td width="150" height="400"></td>
	</tr>


	</center>
	</html>
	</body>