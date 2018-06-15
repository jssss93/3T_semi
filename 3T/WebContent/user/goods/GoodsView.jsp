<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script><!-- 컨트롤러 사용을 위한 jquery -->
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
	
	function scroll_follow( id )
	{
	  $(window).scroll(function( ) //스크롤이 움직일때마다 이벤트 발생
	  { 
	      var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
	    
	      $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
	   });
	}
	 scroll_follow( "#scroll" );
		 //스크롤이 생기도록 

	
</script>
</head>

<center>
	<table width="1000" height="300" border="0" cellpadding="5" cellspacing="0">
		<body>
		<tr>
			<!-- 상품 메인 이미지-->
			<td height="490" align="center" valign="TOP"><img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[0]"/> "
				width"="490" height="490"></td>


			<!-- 상품 상세 내용 -->
			<td>
				<form name="form" id="form" method="post">
					<table class="font-price" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td style="text-align: left; font-size: 18pt;" colspan="2">
								<!-- 상품 이름 --> <s:property value="resultClass.goods_name" />
							</td>
							</tr>

						<!-- 상품가격 텍스트 -->
						<tr>
							<td style="width: 280; font-size: 13pt;" colspan="2"><br>
								<p></p> <!--상품 가격  --> KRW&nbsp;  <s:property
									value="resultClass.goods_price" />
								</td>				
						</tr>
						<!-- TOTAL -->
						
					<tr>
						<td width="100" style="font-size: 15pt; align: left;" >TOTAL
							 <input name="sgoods_cnt" value="1"
								style="width: 20px; height: 20px; text-align: center;" />
						</td>
								  
						<td>
								<!-- +,-버튼 -->
								<table>
									<tr>
										<td>
										<img width="20px"id="plus" onclick="change(1);" 
										    src="/3T/upload/up.JPG" border="0">
										</td>
									<tr>
										<td>
											<img width="20px" id="minus" onclick="change(-1);"
											src="/3T/upload/down.JPG" border="0">
											</td>
									</tr>
								</table>
						</td>
								  
								  
								   <!--  카운트 0이되면 품절이되는 카운트 추가해야됨
							 -----------------------------------
							 ----------------------------------
							 ---------------------------------- -->

							
					</tr>
						
						<!-- SIZE 텍스트, 텍스트박스 -->
						<tr>
							<td style="width: 160px; font-size: 18pt; align: left;" colspan="2">
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
							<td style="width: 170px; font-size: 17pt; align: left;" colspan="2">
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

								</tr>
								<tr>
									<td colspan="2"> 
									<br/>
										<!-- 상품구매버튼 --> <!-- 로그인 o --> <s:if
											test='%{session.M_ID != null}'>


											<input name="Buy" style="" src="/3T/upload/buy.PNG"
												onmouseover="this.src='/3T/upload/buy1.png'"
												onmouseout="this.src='/3T/upload/buy.PNG'"
												onclick="BuyCheck(1);" type="image" src="/3T/upload/buy.PNG"
												 />
										</s:if>

                                 <s:else>
											<!-- 상품구매버튼 -->
											<!-- 로그인 x -->
											<input name="Buy" src="/3T/upload/buy.PNG"
												onmouseover="this.src='/3T/upload/buy1.png'"
												onmouseout="this.src='/3T/upload/buy.PNG'"
												onclick='BuyCheck(3)' type="image" src="/3T/upload/buy.PNG"
												 />
										</s:else>
										

									</td>

									<tr>
									<td colspan="2">
									<br>
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
								<td colspan="2">
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
								<tr>
								<td colspan="2">
								<!-- 리뷰,q&a 하이퍼링크 추가 -->
								<a href='Review_list.action?Goods_no=${resultClass.goods_no}'>REVIEW&nbsp;( 0 )</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a href='qa_listAction.action?Goods_no=${resultClass.goods_no}'>QA&nbsp;( 0 )</a>
								</td>
								</tr>
								
								<tr>
									<td align="left" colspan="2">
									<br>
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
	<table width="200" border="0" height="0"
		cellpadding="0" cellspacing="-300">

		<tr>
			<td colspan="0" align="center"><img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[1]"/> "
				width"="1000" height="1000"></td>

		</tr>
		<tr>
		<td>
		<br><br><br>
		<br><br><br>
			 <img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[2]"/> "
				width"="850" height="850"></td>

		</tr>
	</table>
	<br><br><br>
	<br><br><br>
	<table width="200" border="0" height="0" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="0" align="center"><img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[3]"/> "
				width"="1000" height="1000"></td>

		</tr>
	</table>

	<table width="200" border="0" height="0" align="CENTER"
		cellpadding="0" cellspacing="0">

		<tr>
			<td colspan="0" align="center"><img
				src="/3T/upload/<s:property value="resultClass.goods_file_savname.split(',')[4]"/> "
				width"="1000" height="1000"></td>

		</tr>
	
</center>
<br><br><br>
		<br><br><br>
<table width="500" border="1" height="500" align="CENTER"
	cellpadding="0" cellspacing="0"><br><br><br>관련상품


</table>
<!-- 관련상품 -->
<br>
<table width="200" border="0" height="0" align="center" cellpadding="10"
	cellspacing="10">
	<tr>
		<td colspan=1 align="center"><h2 id="REVIEW" >review</h2></td>
	</tr>

		<s:iterator value="rplist" status="stat">

				<s:if test="#stat.index % 5 eq 0">
					<tr></tr>
				</s:if>
      
				<s:url id="viewURL" action="GoodsView">
					<s:param name="goods_no">
						<s:property value="goods_no" />
					</s:param>
				</s:url>





				<td width="200" height="0" align="center"><s:a
						href="%{viewURL}">

						<img src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>" width="200"
								height="150">
					</s:a><br> <s:property value="goods_name" /><br> <s:property
						value="goods_price" /></td>

			</s:iterator>
			
	</tr>
</table>
<!-- 리뷰 게시판 -->
<br><br><br>
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

		<td colspan=1 align="center"><h2 id="QNA">Q & A</h2></td>

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
<!-- 컨트롤러  -->
<div id="scroll" style="position:absolute; top: 400px; left: 10px;"> 
<ul>
<a href="#REVIEW"><h1>REVIEW</h1></a>
<a href="#QNA"><h1>QnA</h1></a>
</ul>
</div>


</body>
</html>