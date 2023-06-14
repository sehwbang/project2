<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
</head>
<body>
<div id="nav1">
	<div id="left"></div>
	<div id="logo"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" width="200px" height="90px"></a></div>
	<div id="member"><a href="${pageContext.request.contextPath}/member/GoLoginPage.me"><img src="${pageContext.request.contextPath}/resources/img/member.png" alt="member" width="40px" height="40px"></a></div>
	<div id="search"><input placeholder="&emsp;장소/선수를 검색하세요"></div>
</div>
<div id="nav2">
	<div id="matching"><a href="#">매칭</a></div>
	<div id="ranking"><a href="#">랭킹</a></div>
	<div id="league"><a href="#">대회</a></div>
	<div id="vincero"><a href="#">빈체로</a></div>
</div>
</body>
</html>