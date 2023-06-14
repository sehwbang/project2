<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="홈페이지" name="title"/>
</jsp:include>
<div id="billboard">
	<div>
		<img src="${pageContext.request.contextPath}/resources/img/slogan1.png" alt="solgun1" width="650px" height="650px">
		<img src="${pageContext.request.contextPath}/resources/img/league.png" alt="league" width="650px" height="650px">
		<img src="${pageContext.request.contextPath}/resources/img/slogan2.png" alt="slogun2" width="650px" height="650px">
		<img src="${pageContext.request.contextPath}/resources/img/event.png" alt="event" width="650px" height="650px">
		<img src="${pageContext.request.contextPath}/resources/img/slogan1.png" alt="solgun1" width="650px" height="650px">
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>