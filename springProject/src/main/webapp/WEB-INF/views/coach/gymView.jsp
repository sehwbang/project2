<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div id="container">
	여기는 사용자 통계 화면입니다. 나중에 구현해주세요.
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>