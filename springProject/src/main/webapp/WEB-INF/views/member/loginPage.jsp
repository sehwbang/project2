<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
<div id="login-total">
	<div id="login-part">
		<div id="id-part">
			<div><label for="id">아이디&ensp;&ensp; :&ensp;</label></div>
			<div><input type="text" id="id" name="id"></div>
		</div>
		<div id="pw-part">
			<div><label for="pw">비밀번호 :&ensp;</label></div>
			<div><input type="password" id="pw" name="pw"></div>
		</div>
	</div>
	<div id="signup-part">
		<div><a href="#">아이디/비밀번호 찾기</a></div>
		<div><a href="${pageContext.request.contextPath}/member/memberEnroll.me">회원가입</a></div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>