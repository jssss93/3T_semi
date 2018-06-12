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
	function change(num) {
	 var x = document.form;
	 var y = Number(x.sgoods_cnt.value) + num;
	 if (y < 1)
	 y = 1;
	 x.sgoods_cnt.value = y;
	 } 

	function BuyCheck(index) {
		if (index == 1) {
			document.form.action = 'Buy.action?goods_no=${resultClass.goods_no}';
		}
		if (index == 2) {
			document.form.action = 'AddCart.action?goods_no=${resultClass.goods_no}';
		}
		if (index == 3) {
			document.form.action = 'loginAction.action';
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
					<table class="font-price" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td style="text-align: left; font-size: 30pt;" colspan="2">
								<!-- 상품 이름 --> <s:property value="resultClass.goods_name" />
							</td>
						</tr>
						<tr>
								<td colspan="3"><hr/><br/>
								</tr>
						<!-- 상품가격 텍스트 -->
						<tr>
							<td width="280" colspan="2"><br> <br>
								<p></p> <!--상품 가격  --> Price : \&nbsp;  <s:property
									value="resultClass.goods_price" />
								<p></p></td>
							
						</tr>
						<!-- TOTAL -->
						
						<tr>
							<td style="font-size: 17pt; align: left;" colspan="2">TOTAL
							 <input
								name="sgoods_cnt"
								style="width: 20px; height: 20px; text-align: center;"
								  />
							<!-- +,-버튼 -->
							<img width="30px"id="plus" onclick="change(1);" 
							    src="/3T/upload/up.JPG" border="0">
							<img width="30px" id="minus" onclick="change(-1);"
								src="/3T/upload/down.JPG" border="0"></td>
								  
								  
								   <!--  카운트 0이되면 품절이되는 카운트 추가해야됨
							 -----------------------------------
							 ----------------------------------
							 ---------------------------------- -->

							
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
						
						
						<!-- color -->
						<tr>
							<td style="width: 170px; font-size: 17pt; align: left;">
								<p></p> color : <select name="sgoods_color" id="goods_color"
								size="1">
									<option value="<s:property
											value="resultClass.goods_color.split(',')[0]" />"><s:property
											value="resultClass.goods_color.split(',')[0]" /></option>
									<option value="<s:property
											value="resultClass.goods_color.split(',')[1]" />"><s:property
											value="resultClass.goods_color.split(',')[1]" /></option>
											<option value="<s:property
											value="resultClass.goods_color.split(',')[2]" />"><s:property
											value="resultClass.goods_color.split(',')[2]" /></option>
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
							
								<tr>
								<td colspan="3"><hr/><br/>
								</tr>
								
								
								<tr>
									<td>
										<!-- 상품구매버튼 --> <!-- 로그인 o --> <s:if
											test='%{session.M_ID != null}'>


											<input name="Buy" style="" src="/3T/upload/buy.PNG"
												onmouseover="this.src='/3T/upload/buy.PNG'"
												onmouseout="this.src='/3T/upload/buy.PNG'"
												onclick="BuyCheck(1);" type="image" src="/3T/upload/buy.JPG"
												 />
										</s:if> <s:else>
						

											<!-- 상품구매버튼 -->
											<!-- 로그인 x -->
											<input name="Buy" src="/3T/upload/buy.PNG"
												onmouseover="this.src='/3T/upload/buy.PNG'"
												onmouseout="this.src='/3T/upload/buy.PNG'"
												onclick='BuyCheck(3)' type="image" src="/3T/upload/buy.JPG"
												 />
										</s:else>

									</td>
									
									
									
									
									
									
									
									
									<tr>
									<td>
										<!-- 장바구니버튼 --> <!-- 로그인 o --> <s:if
											test='%{session.M_ID != null}'>
											
												<input name="BuyCart"
													onmouseover="this.src='/3T/upload/cart.PNG'"
													onmouseout="this.src='/3T/upload/cart.PNG'"
													onclick="BuyCheck(2);" type="image"

													src="/3T/upload/cart.PNG" value="장바구니 추가" />
											
											
											
									</s:if><s:else>
									
										<!-- 장바구니버튼 --> <!-- 로그인 x --> <input name="BuyCart" style=""
										onmouseover="this.src='/3T/upload/cart.PNG'"
										onmouseout="this.src='/3T/upload/cart.PNG'"
										onclick="BuyCheck(3);" type="image"
										src="/3T/upload/cart.PNG" value="장바구니 (로그인하세요창)" /></td></s:else>

								</tr>
								
								<tr>
								<td>
								<!-- wishlist버튼  로그인 o-->
								<s:if test='%{session.M_ID != null}'>
								<input name="WishList" onclick="BuyCheck(4);" type="image" src="/3T/upload/wishlist.PNG"
								value="WishList"/>
								</s:if>
								<!-- wishlist --> <!-- 로그인 x -->
								<s:else>
								 <input name="WishList" onclick="BuyCheck(3);" type="image" src="/3T/upload/wishlist.PNG"
								value="비로그인 WishList" />
											</s:else>
							
								</td>
								</tr>
								
								<tr>
									<td>
										<!-- 옷 정보 --> <pre>
					    <font color="#de1616">INFO</font>
                        <s:property value="resultClass.goods_content" />

                             
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
<table>
         <strong>리뷰 목록</strong>
         <br />
         <s:if test="">
            등록된 리뷰가 없습니다.
      </s:if>
         <s:else>
            <tr align="center" bgcolor="#D5D5D5">
               <td width="100" height="30" valign="middle" class="body_grey"><strong>리뷰글번호</strong></td>
               <td width="300" height="30" valign="middle" class="body_grey"><strong>리뷰제목</strong></td>
               <td width="100" height="30" valign="middle" class="body_grey"><strong>글쓴이</strong></td>
               <td width="200" height="30" valign="middle" class="body_grey"><strong>등록일시</strong></td>
               <td width="50" height="30" valign="middle" class="body_grey"><strong>관리</strong></td>
            </tr>


            <tr>
               <td height="1" colspan="100%" bgcolor="#000000"></td>
            </tr>

            <s:iterator value="list" status="stat">
            
               <tr align="center" bgcolor="#F3F3F3">
                  <td width="100" height="30" align="center"><s:property
                        value="REV_no" /></td>
                  <td width="300" height="30" align="left"><s:property
                        value="REV_subject" /> <details> <summary>내용보기</summary>
                     <s:property value="REV_content" /></details></td>
                  <td width="100" height="30" align="center"><s:property
                        value="REV_member_id" /></td>
                  <td width="100" height="30" align="center"><s:property
                        value="REV_regdate" /></td>


                  <td width="50" valign="middle">
                  <s:if
                        test='%{session.id == M_ID}'>
                        <p align="center">
                             <!-- 작성버튼 -->
                        <a href="ReviewWriteForm.action?REV_goods_no=<s:property value="REV_goods_no" />&currentPage=<s:property value="currentPage" />">
                           <img src="/3T/upload/write.JPG" border="0" />
                        </a>
                        
                              <!-- 수정 버튼 -->
                        <a href="Review_ModifyAction.action?REV_goods_no=<s:property value="REV_goods_no" />&currentPage=<s:property value="currentPage" />">
                           <img src="/3T/upload/modify.JPG" border="0" />
                        </a>
                         
                           <!-- 삭제 버튼 -->
                           <a
                              href="Review_DeleteAction.action?REV_goods_no=<s:property value="REV_goods_no" />&no=<s:property value="no" />">
                              <img src="/3T/upload/delete.JPG" border="0" />
                           </a>
                        </p>
                     </s:if> 
                     <s:if test='%{session.id == "M_ID"}'>
                        <a
                           href="Review_DeleteAction.action?REV_goods_no=<s:property value="REV_goods_no" />&no=<s:property value="no" />">
                           <img src="/3T/upload/delete.JPG" border="0" />
                        </a>
                     </s:if></td>

               </tr>

            </s:iterator>

            <tr>
               <td height="1" colspan="100%" bgcolor="#000000"></td>
            </tr>
         </s:else>
      </table>
   
   <br></br>
   <hr></hr>
<!-- Q & A 게시판 -->
<br>
<br>
<br>
 <table>
         <strong>q&a 목록</strong>
         <br />
         <s:if test="">
            등록된 q&a가 없습니다.
      </s:if>
         <s:else>
            <tr align="center" bgcolor="#D5D5D5">
               <td width="100" height="30" valign="middle" class="body_grey"><strong>q&a글번호</strong></td>
               <td width="300" height="30" valign="middle" class="body_grey"><strong>q&a제목</strong></td>
               <td width="100" height="30" valign="middle" class="body_grey"><strong>ID</strong></td>
               <td width="200" height="30" valign="middle" class="body_grey"><strong>등록일시</strong></td>
               <td width="50" height="30" valign="middle" class="body_grey"><strong>관리</strong></td>
            </tr>


            <tr>
               <td height="1" colspan="100%" bgcolor="#000000"></td>
            </tr>

            <s:iterator value="qaList" status="stat">
               <s:param name="no">
                  <s:property value="QA_no" />
               </s:param>
               <s:param name="id">
                  <s:property value="QA_member_id" />
               </s:param>
               <tr align="center" bgcolor="#F3F3F3">
                  <td width="100" height="30" align="center"><s:property
                        value="QA_no" /></td>
                  <td width="300" height="30" align="left"><s:property
                        value="QA_subject" /> <details> <summary>내용보기</summary>
                     <s:property value="QA_content" /></details></td>
                  <td width="100" height="30" align="center"><s:property
                        value="QA_member_id" /></td>
                  <td width="100" height="30" align="center"><s:property
                        value="QA_regdate" /></td>


                  <td width="50" valign="middle"><s:if
                        test='%{session.id == M_ID}'>
                        `````````````````````````````````````<p align="center">
                              <!-- 수정 버튼 -->
                        <a href="qa_modifyAction.action?QA_goods_no=<s:property value="QA_goods_no" />&currentPage=<s:property value="currentPage" />">
                           <img src="/3T/upload/modify.JPG" border="0" />
                        </a>
                        
                           <!-- 삭제 버튼 -->
                           <a
                              href="qa_deleteAction1.action?QA_goods_no=<s:property value="QA_goods_no" />&no=<s:property value="no" />">
                              <img src="/3T/upload/delete.JPG" border="0" />
                           </a>
                        </p>
                     </s:if> <s:if test='%{session.id == "M_ID"}'>
                        <a
                           href="qa_deleteAction1.action?QA_goods_no=<s:property value="QA_goods_no" />&no=<s:property value="no" />">
                           <img src="/3T/upload/delete.JPG" border="0" />
                        </a>
                     </s:if></td>

               </tr>

            </s:iterator>

            <tr>
               <td height="1" colspan="100%" bgcolor="#000000"></td>
            </tr>
         </s:else>
	</center>
</table>
</body>
</html>