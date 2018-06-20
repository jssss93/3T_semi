<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/3T/user/notice/common/css/css.css"
	type="text/css">
<style type="text/css">
/* 대메뉴 */ 
.diz_menu { font-size:1.1em; color:#555555; font-family:Tahoma; line-height:110%; padding-top:6px; cursor:hand; font-weight:normal;}
a.diz_menu:link { font-size:1.7em; color:#555555; font-family:Tahoma; line-height:110%; padding-top:6px; text-decoration:none; font-weight:normal; }
a.diz_menu:visited { font-size:1.7em; color:#555555; font-family:Tahoma; line-height:110%; padding-top:6px; text-decoration:none; font-weight:normal; }
a.diz_menu:hover { font-size:1.7em; color:#EDEDED; font-family:Tahoma; line-height:110%; padding-top:6px; text-decoration:none; font-weight:bold; }
a.diz_menu:active { font-size:1.7em; color:#555555; font-family:Tahoma; line-height:110%; padding-top:6px; text-decoration:none; font-weight:normal; }
.diz_menu_over { font-size:1.3em; color:black; font-family:Tahoma; line-height:110%; padding-top:6px; cursor:hand;}

/* 부메뉴 */
.diz_popmenu { font-family:돋움; font-size:9pt; color:#333333; background-color:FFFFFF; cursor:hand; }
.diz_popmenu_over { font-family:돋움; font-size:9pt; color:#FFFFFF; background-color:08246B; cursor:hand; }


</style>

<script LANGUAGE="JavaScript">

function set_submenu(obj) {
    var nLeft,nTop
    ph = 70 // 서브메뉴 상단위치 조절
    nLeft = event.x - event.offsetX + document.body.scrollLeft;
    nTop = event.y - event.offsetY + document.body.scrollTop;

    document.getElementById(obj).style.left = nLeft +"px"; 
    document.getElementById(obj).style.top = nTop + ph +"px"; 
    document.getElementById(obj).style.display='block'; 
}

function show_submenu(obj) {
    eval(obj+".style").display='block';
}

function hide_submenu(obj) {
    eval(obj+".style").display='none';
}

</script>
</head>
<body>

<div align="center" >

<!-- 대메뉴 -->
<table border="0" cellpadding="0" cellspacing="0" height="100">
<tr align="center">
	<td align="center" width="200" >
		<a href="AD_main.action"><h1>3T</h1></a>
		<a href="main.action">(사용자페이지로이동)</a>
	</td>
			
			
<td width="10">|</td>
<td width="170" id="menu1" onClick="location.href='AM_List.action'" class="diz_menu" onMouseOver="this.className='diz_menu_over';set_submenu('submenu1');" onMouseOut="this.className='diz_menu';hide_submenu('submenu1')">회원관리</td>
<td width="10">|</td>
<td width="170" id="menu2" onClick="location.href='AG_List.action'" class="diz_menu" onMouseOver="this.className='diz_menu_over';set_submenu('submenu2');" onMouseOut="this.className='diz_menu';hide_submenu('submenu2')">상품관리</td>
<td width="10">|</td>
<td width="170" id="menu3" onClick="location.href='AO_List.action'" class="diz_menu" onMouseOver="this.className='diz_menu_over';set_submenu('submenu3');" onMouseOut="this.className='diz_menu';hide_submenu('submenu3')">주문관리</td>
<td width="10">|</td>
<td width="170" id="menu4" onClick="location.href='AS_List.action'" class="diz_menu" onMouseOver="this.className='diz_menu_over';set_submenu('submenu4');" onMouseOut="this.className='diz_menu';hide_submenu('submenu4')">매출관리</td>
<td width="10">|</td>
<td width="170" id="menu5" onClick="location.href='AN_List.action'" class="diz_menu" onMouseOver="this.className='diz_menu_over';set_submenu('submenu5');" onMouseOut="this.className='diz_menu';hide_submenu('submenu5')">공지사항관리</td>
<td width="10">|</td>
<td width="170" id="menu6" onClick="location.href='AF_List.action'" class="diz_menu" onMouseOver="this.className='diz_menu_over';set_submenu('submenu6');" onMouseOut="this.className='diz_menu';hide_submenu('submenu6')">FAQ관리</td>
<td width="10">|</td>
<td width="170" id="menu7" onClick="location.href='AQ_List.action'" class="diz_menu" onMouseOver="this.className='diz_menu_over';set_submenu('submenu7');" onMouseOut="this.className='diz_menu';hide_submenu('submenu7')">QA관리</td>
<td width="10">|</td>
<td width="50"></td>




<s:if test='%{session.M_ID == null}'>
				<td align="right">
					<!--비회원 헤더 카테고리  --> <!--비회원 로그인 폼  경로 잡아줄 것--> <a
					href="loginAction.action" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGIN</a> &nbsp;|&nbsp;<a
					href="join1Form.action" >JOIN</a>

				</td>
			</s:if>
			<s:elseif test='%{session.M_ID != null}'>
				<td align="right">
					${session.M_ID } 님 환영합니다.
				<Br>
				
				
					<!--경로잡을것  --> 
					<a href="AD_logout.action">LOGOUT</a> 
					&nbsp;|&nbsp;
					(관리자모드) 
					
				</td>
			</s:elseif>
</tr>



</table>






<!-- 부메뉴 1번 -->
<table width="140" cellpadding="5" cellspacing="1" border="0" id="submenu1" style="position:absolute;  z-index:1; display:none; left:100px; top:50px" onMouseOver="show_submenu('submenu1');" onMouseOut="hide_submenu('submenu1');">
<tr><td bgcolor="#FFFFFF">
<table border="0" cellpadding="1" cellspacing="0" bgcolor="white" width="100%">
<tr align="center">
<td align="center" height='20' onClick="self.location='AM_List.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">   회원 목록</td>
</tr>
<tr>
<td height='20' onClick="self.location='AM_List_VIP.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">VIP회원 목록</td>
</tr>

</table>
</td>


</tr>
</table>

<!-- 부메뉴 2번 -->
<table width="140" cellpadding="5" cellspacing="1" border="0" id="submenu2" style="position:absolute; z-index:1; display:none; left:100px; top:50px" onMouseOver="show_submenu('submenu2');" onMouseOut="hide_submenu('submenu2');">
<tr><td bgcolor="#FFFFFF">
<table border="0" cellpadding="1" cellspacing="0" bgcolor="white" width="100%">
<tr>
<td  height='20' onClick="self.location='AG_List.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">상품 목록</td>
</tr>
<tr>
<td height='20' onClick="self.location='AG_Writeform.action?currentPage=<s:property value="currentPage" />'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">상품 등록</td>
</tr>
<tr>
<td height='20' onClick="self.location='링크주소'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">재고 관리</a></td>
</tr>

</table>
</td>


</tr>
</table>

<!-- 부메뉴 3번 -->
<table width="140" cellpadding="5" cellspacing="1" border="0" id="submenu3" style="position:absolute;  z-index:1; display:none; left:100px; top:50px" onMouseOver="show_submenu('submenu3');" onMouseOut="hide_submenu('submenu3');">
<tr><td bgcolor="#FFFFFF">
<table border="0" cellpadding="1" cellspacing="0" bgcolor="white" width="100%">
<tr>
<td height='20' onClick="self.location='AO_List.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">주문목록-(전체)</td>
</tr>
<tr>
<td height='20' onClick="self.location='AO_List_1.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">주문목록-(입금확인중)</td>
</tr>
<tr>
<td height='20' onClick="self.location='AO_List_2.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">주문목록-(배송중)</a></td>
</tr>
<tr>
<td height='20' onClick="self.location='AO_List_3.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">주문목록-(구매완료)</a></td>
</tr>
</table>
</td>


</tr>
</table>
<!-- 부메뉴 4번 -->
<table width="140" cellpadding="5" cellspacing="1" border="0" id="submenu4" style="position:absolute;  z-index:1; display:none; left:100px; top:50px" onMouseOver="show_submenu('submenu4');" onMouseOut="hide_submenu('submenu4');">
<tr><td bgcolor="#FFFFFF">
<table border="0" cellpadding="1" cellspacing="0" bgcolor="white" width="100%">
<tr>
<td height='20' onClick="self.location='AS_List.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">매출 목록-(Day)</td>
</tr>
<tr>
<td height='20' onClick="self.location='링크주소'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">매출 목록-(Week)</td>
</tr>
<tr>
<td height='20' onClick="self.location='링크주소'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">매출 목록-(Month)</a></td>
</tr>

</table>
</td>


</tr>
</table>
<!-- 부메뉴 5번 -->
<table width="140" cellpadding="5" cellspacing="1" border="0" id="submenu5" style="position:absolute;  z-index:1; display:none; left:100px; top:50px" onMouseOver="show_submenu('submenu5');" onMouseOut="hide_submenu('submenu5');">
<tr><td bgcolor="#FFFFFF">
<table border="0" cellpadding="1" cellspacing="0" bgcolor="white" width="100%">
<tr>
<td height='20' onClick="self.location='AN_List.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">공지사항 목록</td>
</tr>
<tr>
<td height='20' onClick="self.location='AN_Writeform.action?currentPage=<s:property value="currentPage" />;'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">공지사항 등록</td>
</tr>

</table>
</td>


</tr>
</table>
<!-- 부메뉴 6번 -->
<table width="140" cellpadding="5" cellspacing="1" border="0" id="submenu6" style="position:absolute;  z-index:1; display:none; left:100px; top:50px" onMouseOver="show_submenu('submenu6');" onMouseOut="hide_submenu('submenu6');">
<tr><td bgcolor="#FFFFFF">
<table border="0" cellpadding="1" cellspacing="0" bgcolor="white" width="100%">
<tr>
<td height='20' onClick="self.location='AF_List.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">FAQ 목록</td>
</tr>
<tr>
<td height='20' onClick="self.location='AF_Writeform.action?currentPage=<s:property value="currentPage" />'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">FAQ 등록</td>
</tr>

</table>
</td>


</tr>
</table>

<!-- 부메뉴 7번 -->
<table width="140" cellpadding="5" cellspacing="1" border="0" id="submenu7" style="position:absolute;  z-index:1; display:none; left:100px; top:50px" onMouseOver="show_submenu('submenu7');" onMouseOut="hide_submenu('submenu7');">
<tr><td bgcolor="#FFFFFF">
<table border="0" cellpadding="1" cellspacing="0" bgcolor="white" width="100%">
<tr>
<td height='20' onClick="self.location='AQ_List.action'" class="diz_popmenu" onMouseOver="this.className='diz_popmenu_over'" onMouseOut="this.className='diz_popmenu'">QA 목록</td>
</tr>


</table>
</td>


</tr>
</table>

	
</body>
</html>