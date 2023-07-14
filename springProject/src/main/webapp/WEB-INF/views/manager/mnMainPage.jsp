<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/manager/manager.css">
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
      <jsp:param value="빈체로/관리자" name="title" />
  	</jsp:include>
	<nav id="menuNav">
		<button class="menuButton" type="button" onclick="notice()">공지사항</button>
		<button class="menuButton" type="button" onclick="gymList()">체육관 조회</button>
		<button class="menuButton" type="button" onclick="memberList()">회원 조회</button>
	</nav>
	
	관리자 페이지 입니다 

<script>
	function notice() {
		location.href="";
	}
	function gymList() {
		location.href="${pageContext.request.contextPath}/manager/mnGymList.mn";
	}
	function memberList() {
		location.href="${pageContext.request.contextPath}/manager/mnMemberList.mn";
	}
</script>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>