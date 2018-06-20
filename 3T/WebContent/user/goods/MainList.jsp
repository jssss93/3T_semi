<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
   display: none;
}

.w3-left, .w3-right, .w3-badge {
   cursor: pointer
}

.w3-badge {
   height: 13px;
   width: 13px;
   padding: 0
}

.w3-animate-righ {
   position: relative;
   animation: animateright 0.3s
}

@
keyframes animateright {
   from {right: -3px;
   opacity: 0.9
}

to {
   right: 0;
   opacity: 1
}

}
#myImg {
   border-radius: 5px;
   cursor: pointer;
   transition: 0.3s;
}

#myImg:hover {
   opacity: 0.7;
}

#myimg2:hover {
   opacity: 0.9;
}
</style>

</head>

<body>

<div class="w3-container"></div>

   <div class="w3-content w3-section w3-display-container" style="max-width: 1500px">
      <s:a href="GoodsView.action?goods_no=802">
         <img id="myimg2" class="mySlides w3-animate-righ"
            src="/3T/upload/mainslide1.PNG" width="100%" height="600">
      </s:a>
      <s:a href="GoodsView.action?goods_no=945">
         <img id="myimg2" class="mySlides w3-animate-righ"
            src="/3T/upload/mainline3.JPG" width=100% height=600>
      </s:a>
      <s:a href="GoodsView.action?goods_no=823">
         <img id="myimg2" class="mySlides w3-animate-righ"
            src="/3T/upload/mainslide2.PNG" width=100% height=600>
      </s:a>
       <div
         class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle"
         style="width: 100%">
         <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
         <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
         <span class="w3-badge demo w3-border w3-transparent w3-hover-white"
            onclick="currentDiv(1)"></span> <span
            class="w3-badge demo w3-border w3-transparent w3-hover-white"
            onclick="currentDiv(2)"></span> <span
            class="w3-badge demo w3-border w3-transparent w3-hover-white"
            onclick="currentDiv(3)"></span>
      </div> 
   </div>
<script>
var slideIndex = 0;
var myIndex = 0;
showDivs(slideIndex);
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("demo");
    
    for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white");
    }
    
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    
    
    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1}    
    x[slideIndex-1].style.display = "block"; 
    dots[slideIndex-1].className += " w3-white";
    setTimeout(carousel, 4000); // Change image every 2 seconds
}

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}

/* var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 3000); // Change image every 2 seconds
} */
</script>

   <br>
   <table width="1100" border="0" height="300" align="center"
      cellpadding="0" cellspacing="6">
      <tr>
         <td colspan=3 align="center"><h2>New Item</h2>
            <img src="/3T/upload/mainline.PNG" /></td>
      </tr>
      <tr>
         <s:iterator value="list1" status="stat1">

            <s:if test="#stat1.index 3 eq 0">

            </s:if>



            <s:url id="viewURL" action="GoodsView">
               <s:param name="goods_no">
                  <s:property value="goods_no" />
               </s:param>
            </s:url>




            <td width="100" height="200" align="center"><s:a
                  href="%{viewURL}">

                  <img id="myImg"
                     src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>"
                     width="430" height="290">
               </s:a></td>

         </s:iterator>
      </tr>
   </table>
   <br>
   <br>
   <table width="80%" border="0" align="center" cellpadding="0"
      cellspacing="25">

      <tr>
         <td colspan="3" align="center"><img
            src="/3T/upload/mainline2.JPG" /></td>
      </tr>
      <tr>

         <s:iterator value="list" status="stat">

            <s:if test="#stat.index % 3 eq 0">
               <tr></tr>
            </s:if>



            <s:url id="viewURL" action="GoodsView">
               <s:param name="goods_no">
                  <s:property value="goods_no" />
               </s:param>
            </s:url>




            <td width="150" height="400" align="center"><s:a
                  href="%{viewURL}">

                  <img id="myImg"
                     src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>"
                     width="450" height="570">
               </s:a><br>
            <br> <s:property value="goods_name" /><br> \&nbsp;<s:property
                  value="goods_price" /></td>

         </s:iterator>



      </tr>
   </table>
   <br>
   <br>
   <br>
   <table width="1300" border="0" height="300" align="center"
      cellpadding="0" cellspacing="0">
      <tr height="200">
         <td colspan="3" align="center"><a href="main.action"><img
               width="1350" src="/3T/upload/mainline4.png" /></td>
         </a>
      </tr>
   </table>

   <br>
   <br>
   <br>
   <table width="80%" border="0" height="300" align="center"
      cellpadding="0" cellspacing="25">
      <tr>
         <td colspan=3 align="center"><img src="/3T/upload/mainline5.png" /></td>
      </tr>

      <tr>
         <s:iterator value="list2" status="stat2">

            <s:if test="#stat2.index % 3 eq 0">
               <tr></tr>
            </s:if>



            <s:url id="viewURL" action="GoodsView">
               <s:param name="goods_no">
                  <s:property value="goods_no" />
               </s:param>
            </s:url>




            <td width="150" height="400" align="center"><s:a
                  href="%{viewURL}">

                  <img id="myImg"
                     src="/3T/upload/<s:property value="goods_file_savname.split(',')[0]"/>"
                     width="450" height="570">
               </s:a><br>
            <br> <s:property value="goods_name" /><br> \&nbsp;<s:property
                  value="goods_price" /></td>

         </s:iterator>
   </table>

</body>
</html>