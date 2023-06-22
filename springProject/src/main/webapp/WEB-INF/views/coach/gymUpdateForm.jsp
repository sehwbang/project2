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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div id="nav2">
	<div id="gym"><a href="${pageContext.request.contextPath}/coach/gymUpdateForm.gym">체육관 정보 수정</a></div>
	<div id="matching"></div>
	<div id="gym"><a href="${pageContext.request.contextPath}/coach/gymCalendar.gym">일정 관리</a></div>
	<div id="gym"><a href="${pageContext.request.contextPath}/coach/gymView.gym">사용자 통계</a></div>
</div>
체육관 정보 관리 페이지입니다.

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>