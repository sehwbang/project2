<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <script>
      $( document ).ready( function() {
        $( '.slider' ).slick( {
          slidesToShow: 5,
          slidesToScroll: 1,
          responsive: [
            {
              breakpoint: 768,
              settings: {
                slidesToShow: 3,
                arrows: false,
              }
            },
            {
              breakpoint: 600,
              settings: {
                slidesToShow: 1,
                arrows: false,
              }
            }
          ]
        } );
      } );
    </script>
    <style>
      img {
        max-width: 100%;
        height: auto;
      }
      .slider {
        width: 80%;
        margin: 0px auto;
      }
      .slider .slick-slide {
        margin: 10px;
      }
      .slick-prev:before, .slick-next:before {
        color: #444444;
      }
      h3 {
      	text-align: center;	
      }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div id="nav2">
	<div id="matching"></div>
	<div id="matching"></div>
	<div id="gym"><a href="${pageContext.request.contextPath}/match/matchReg.ma">매치 등록</a></div>
	<div id="gym"><a href="${pageContext.request.contextPath}/match/matchList.ma">상대방 찾기</a></div>
</div>
<div class="slider">
  <div id="mon" onclicked="getDate();"><h3>월</h3></div>
  <div id="tue" onclicked="getDate();"><h3>화</h3></div>
  <div id="wed" onclicked="getDate();"><h3>수</h3></div>
  <div id="thu" onclicked="getDate();"><h3>목</h3></div>
  <div id="fri" onclicked="getDate();"><h3>금</h3></div>
  <div id="sat" onclicked="getDate();"><h3>토</h3></div>
  <div id="sun" onclicked="getDate();"><h3>일</h3></div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>