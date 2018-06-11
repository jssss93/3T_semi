<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	/* 종합개수 카운트 */
	/* function change(num) {
	 var x = document.form;
	 var y = Number(x.goods_qty.value) + num;
	 if (y < 1)
	 y = 1;
	 x.goods_qty.value = y;
	 } */

	function BuyCheck(index) {
		if (index == 1) {
			document.form.action = 'Buy.action?goods_no=${resultClass.goods_no}';
		}
		if (index == 2) {
			document.form.action = 'AddCart.action?goods_no=${resultClass.goods_no}';
		}
		if (index == 3) {
			document.form.action = 'loginForm.action';
		}
		if (index == 4) {
			document.form.action = 'AddWish.action?goods_no=${resultClass.goods_no}';
		}
		document.form.submit();
	}
</script>
</head>

<center>
	<table width="1000" border="1" cellpadding="0" cellspacing="0">
		<body>
		<tr>
			<!-- 상품 메인 이미지-->
			<td height="490" align="center" valign="middle"><img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[0]"/> "
				width"="490" height="490"></td>


			<!-- 상품 상세 내용 -->
			<td>
				<form name="form" id="form" method="post">
					<table class="font-price" border="1" cellpadding="0"
						cellspacing="0">
						<tr>
							<td style="text-align: left; font-size: 30pt;" colspan="2">
								<!-- 상품 이름 --> <s:property value="resultClass.goods_name" />
							</td>
						</tr>
						<!-- 상품가격 텍스트 -->
						<tr>
							<td width="280"><br> <br>
								<p></p> <!--상품 가격  --> Price : \&nbsp; <input name="goods_price"
								type="hidden" value="9000"> <s:property
									value="resultClass.goods_price" />
								<p></p></td>
							<td></td>
						</tr>
						<!-- TOTAL -->
						<%
							int totalcnt = 0;
						%>
						<tr>
							<td style="font-size: 17pt; align: left;" rowspan="2">TOTAL
								<s:property value="resultClass.goods_totalcount" /> <input
								name="sgoods_cnt"
								style="width: 25px; text-align: center; -ms-ime-mode: disabled;"
								onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"
								type="text" maxlength="3" value="1"> <!--  카운트 0이되면 품절이되는 카운트 추가해야됨
							 -----------------------------------
							 ----------------------------------
							 ---------------------------------- -->

							</td>
						</tr>
						<tr>
							<!-- +,-버튼 -->
							<td style="align: left;"><img width="30" align="left"
								id="plus" onclick="change(1);" src="/3T/upload/+.jsp" border="1">
							</td>
							<td><img width="30" id="minus" onclick="change(-1);"
								src="/3T/upload/-.jsp" border="1"></td>
						</tr>
						<!-- SIZE 텍스트, 텍스트박스 -->
						<tr>
							<td style="width: 170px; font-size: 17pt; align: left;">
								<p></p> Size : <select name="sgoods_size" id="goods_size"
								size="1">
									<option value="<s:property
											value="resultClass.goods_size.split(',')[0]" />"><s:property
											value="resultClass.goods_size.split(',')[0]" /></option>
									<option value="<s:property
											value="resultClass.goods_size.split(',')[1]" />"><s:property
											value="resultClass.goods_size.split(',')[1]" /></option>
											<option value="<s:property
											value="resultClass.goods_size.split(',')[2]" />"><s:property
											value="resultClass.goods_size.split(',')[2]" /></option>
									<!-- size 고르는거 추후에 option이용해서 넣을지 생각해야됨 -->
									<!-- -----------------------------------------------------
							-----------------------------------------------------
							-----------------------------------------------------
							----------------------------------------------------- -->
							</select>
							</td>
						</tr>
						<!-- BUY,ADD CART추가하기 -->
						<tr>
							<td>
								<!-- 구매상품→구매페이지 --> <!-- 상품번호 전송 --> <input name="goods_no"
								type="hidden" value="572" /> <s:property
									value="resultClass.goods_no" /> <tabel>
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
										<!-- 상품구매버튼 --> <!-- 로그인 o --> <s:if
											test='%{session.M_ID != null}'>


											<input name="Buy" style=""
												onmouseover="this.src='/goods/upload/buy2.JPG'"
												onmouseout="this.src='/goods/upload/buy.JPG'"
												onclick="BuyCheck(1);" type="image" src="/3T/upload/buy.JPG"
												value="상품구매" />
										</s:if> <s:else>
											<img src="/goods/upload/buy.JPG"
												onmouseover="this.src='/3T/upload/buy2.JPG'"
												onmouseout="this.src='/3T/upload/buy.JPG'" border="0"></img>

											<!-- 상품구매버튼 -->
											<!-- 로그인 x -->
											<input name="Buy"
												onmouseover="this.src='/goods/upload/buy2.JPG'"
												onmouseout="this.src='/goods/upload/buy.JPG'"
												onclick='BuyCheck(3)' type="image" src="/3T/upload/buy.JPG"
												value="상품구매(로그인하세요 창)" />
										</s:else>

									</td>
									
									
									
									
									
									
									
									
									<td>
										<!-- 장바구니버튼 --> <!-- 로그인 o --> <s:if
											test='%{session.M_ID != null}'>
											
												<input name="BuyCart"
													onmouseover="this.src='/3T/upload/add to cart2.JPG'"
													onmouseout="this.src='/3T/upload/add to cart.JPG'"
													onclick="BuyCheck(2);" type="image"

													src="/3T/upload/add to cart.JPG" value="장바구니 추가" />
											
											
												<img src="/3T/upload/add to cart.JPG"
													onmouseover="this.src='/3T/upload/add to cart2.JPG'"
													onmouseout="this.src='/3T/upload/add to cart.JPG'"
													border="0"></img>
											
									</td></s:if><s:else>
									<td>
										<!-- 장바구니버튼 --> <!-- 로그인 x --> <input name="BuyCart" style=""
										onmouseover="this.src='/3T/upload/add to cart2.JPG'"
										onmouseout="this.src='/3T/upload/add to cart.JPG'"
										onclick="BuyCheck(3);" type="image"
										src="/3T/upload/add to cart.JPG" value="장바구니 (로그인하세요창)" /></s:else>

								</tr>
								
								<tr>
								<td>
								<!-- wishlist버튼  로그인 o-->
								<s:if test='%{session.M_ID != null}'>
								<input name="WishList" onclick="BuyCheck(4);" type="image"
								value="WishList"/>
								</s:if>
								<!-- wishlist --> <!-- 로그인 x -->
								<s:else>
								 <input name="WishList" onclick="BuyCheck(3);" type="image" value="비로그인 WishList" />
											</s:else>
							
								</td>
								</tr>
								
								<tr>
									<td>
										<!-- 옷 정보 --> <pre>
					    <font color="#de1616">INFO</font>
                        <s:property value="resultClass.goods_content" />

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
	<table width="1000" border="1" height="631" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="0" align="center"><img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[1]"/> "
				width"="490" height="490"></td>

		</tr>
		<tr>
			<td width="100" height="100" align="center"><h2>Main logo</h2> <img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[2]"/> "
				width"="490" height="490"></td>

		</tr>
	</table>
	<br> <br> <br>
	<table width="960" border="1" height="631" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="0" align="center"><img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[3]"/> "
				width"="490" height="490"></td>

		</tr>
	</table>
	<br> <br> <br>
	<table width="960" border="1" height="631" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="0" align="center"><img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[4]"/> "
				width"="490" height="490"></td>

		</tr>
	</table>
	<!-- 옷 자세히 보기 -->
	<br> <br> <br>
	<table width="960" border="1" height="631" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="3" align="center"><h2>Main logo</h2> <img
				src="/3T/upload/${goods_file_savname}"></td>
		</tr>
		<tr>
			<td width="200" height="200" align="center"><h2>clothes
					ditail img</h2> <img src="/3T/upload/${goods_file_savname}"></td>
		</tr>
		<tr>
			<td width="200" height="200" align="center"><h2>clothes
					ditail img</h2> <img src="/3T/upload/${goods_file_savname}"></td>
		</tr>
		<tr>
			<td width="200" height="200" align="center"><h2>clothes
					ditail img</h2> <img src="/3T/upload/${goods_file_savname}"></td>
		</tr>
	</table>
</center>
<!-- 모델 정보 -->
<br>
<br>
<br>
<table width="500" border="1" height="500" align="CENTER"
	cellpadding="0" cellspacing="0">관련상품

	
</table>
<!-- 관련상품 -->
<br>
<br>
<br>
<table width="500" border="1" height="150" align="center" cellpadding="10"
	cellspacing="10">
	<tr>
		<s:iterator value="rplist" status="stat">

				<s:if test="#stat.index % 3 eq 0">
					<tr></tr>
				</s:if>



				<s:url id="viewURL" action="GoodsView">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url>




				<td width="100" height="200" align="center"><s:a
						href="%{viewURL}">

						<img src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>" width="350"
								height="200">
					</s:a><br> <s:property value="goods_name" /><br> <s:property
						value="goods_price" /></td>

			</s:iterator>
			
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
</table>
</body>
</html>