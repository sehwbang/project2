<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<c:if test="${not empty msg}">
	<script type="text/javascript">
		alert('${msg}');
	</script>
</c:if>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="로그인" name="title" />
	</jsp:include>

	<div class="header" id="login-total">
		<div class="container">
			<form id="login-form"
				action="${pageContext.request.contextPath}/member/memberLogin.me"
				method="post">
				<table>
					<c:if test="${empty loginMember}">
						<tr>

							<th>ID</th>
							<td id="id-part"><input type="text" id="userId" name="userId"></td>
							<td rowspan="2"><button class="btn" type="submit">로그인</button></td>

						</tr>
						<tr>
							<th>PW</th>
							<td id="pw-part"><input type="password" id="userPw" name="userPw"></td>
						</tr>
						<tr id="signup-part">
						<td></td>
						<td><a href="#" style="text-decoration: none";>아이디/비밀번호
								찾기</a></td>
						<td><a
							href="${pageContext.request.contextPath}/member/memberEnroll.me"
							style="text-decoration: none";>회원가입&emsp;</a></td>
					</tr>
					</c:if>
					<c:if test="${not empty loginMember}">
					<div id= "modal">
						<a
							href="${pageContext.request.contextPath}/member/memberDetail.me"></a>
						&emsp;
						<button class="Logoutbtn" type="button"
							onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.me'">로그아웃</button>
						<button class="myPagebtn" type="button"
							onclick="location.href='${pageContext.request.contextPath}/member/memberDetail.me'">마이페이지</button>	
						</div>	
					</c:if>
					</form>
					


				</table>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>