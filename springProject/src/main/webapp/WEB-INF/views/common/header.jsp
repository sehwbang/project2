<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/header.css">
<c:if test="${not empty msg}">
	<script type="text/javascript">
		alert('${msg}');
	</script>
</c:if>
</head>
<body>
	<div id="header">
		<!-- 헤더 로고 -->
		<div id="logo">
			<a href="${pageContext.request.contextPath}"><img
				src="${pageContext.request.contextPath}/resources/img/logo.png"
				alt="logo" width="200px" height="90px"></a>
		</div>

		<div class="bar">
			<!-- Nav -->
			<!-- 헤더 메뉴바 -->
			<nav class="menubar">
				<ul id="menu_list">
					<li id="menu_menu"><a class="submenu"
						href="${pageContext.request.contextPath}/match/matchList.ma"><h3>매칭</h3></a>
						<ul id="submenu_list">
							<li id="submenu_menu"><a
								href="${pageContext.request.contextPath}/match/matchReg.ma">매치
									등록</a></li>
							<li id="submenu_menu"><a href="#">매치 찾기</a></li>
						</ul></li>
					<li id="menu_menu"><a class="submenu"
						href="${pageContext.request.contextPath}/ranking/rankingList.ra"><h3>랭킹</h3></a></li>
					<li id="menu_menu"><a class="submenu" href=""><h3>빈체로</h3></a>
						<ul id="submenu_list">
							<li><a
								href="${pageContext.request.contextPath}/support/vincero.su">빈체로
									소개</a></li>
							<li><a
								href="${pageContext.request.contextPath}/support/rule.su">룰
									소개</a></li>
							<li><a href="#">가맹 신청</a></li>
						</ul></li>
					<li id="menu_menu"><a class="submenu"
						href="${pageContext.request.contextPath}/support/support.su"><h3>고객센터</h3></a>
						<ul id="submenu_list">
							<li id="submenu_menu"><a href="#">자주묻는질문</a></li>
							<li id="submenu_menu"><a href="#">등등</a></li>
						</ul></li>
					<li id="menu_menu"><img
						src="${pageContext.request.contextPath}/resources/img/index/bell.png"
						alt="bell" width="30px" height="30px"></li>
					<li id="menu_menu" class="member"><img
						src="${pageContext.request.contextPath}/resources/img/index/menuIcon120.png"
						alt="member" width="30px" height="30px">
						<ul>
							<c:if test="${empty loginMember}">
								<li><a
									href="${pageContext.request.contextPath}/member/GoLoginPage.me">로그인</a></li>
							</c:if>
							<c:if test="${not empty loginMember}">
								<li id="loginName">${loginMember.userName}님<hr></li>
								<li><a
									href="${pageContext.request.contextPath}/member/memberLogout.me">로그아웃</a></li>
								<li><a
									href="${pageContext.request.contextPath}/member/memberDetail.me?userId=${loginMember.userId}">마이페이지</a></li>
								<c:choose>
									<c:when test="${loginMember.userStatus == 2}">
										<li><a
											href="${pageContext.request.contextPath}/profile/profileUpdate.pr">프로필
												수정</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/profile/profileEnroll.pr">프로필
												등록</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${loginMember.userType eq 'admin'}">
										<li><a
											href="${pageContext.request.contextPath}/manager/mnMainPage.mn">관리자</a></li>
									</c:when>
									<c:when test="${loginMember.userType eq 'coach'}">
										<li><a
											href="${pageContext.request.contextPath}/gym/gymMainPage.gym">관장</a></li>
									</c:when>
								</c:choose>
							</c:if>
						</ul></li>
				</ul>
			</nav>
		</div>
		<!-- 헤더 회원정보 -->
	</div>


	<!-- 사이드바 -->
	<div class="sidebar">
		<nav class="navbar">
			<ul id="side__list">
				<c:if test="${empty loginMember}">
					<li><a
						href="${pageContext.request.contextPath}/member/GoLoginPage.me">로그인</a>
				</c:if>
				<c:if test="${not empty loginMember}">
					<li id="loginName">${loginMember.userName}님
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/member/memberLogout.me">로그아웃</a></li>
							<li><a
								href="${pageContext.request.contextPath}/member/memberDetail.me?userId=${loginMember.userId}">마이페이지</a></li>
							<c:choose>
								<c:when test="${loginMember.userStatus == 2}">
									<li><a
										href="${pageContext.request.contextPath}/profile/profileUpdate.pr">프로필
											수정</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/profile/profileEnroll.pr">프로필
											등록</a></li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${loginMember.userType eq 'admin'}">
									<li><a
										href="${pageContext.request.contextPath}/manager/mnMainPage.mn">관리자</a>
										<ul class="third">
											<li><a
												href="${pageContext.request.contextPath}/gym/gymForm.gym?gymNo=${gym.gymNo}">공지사항</a></li>
											<li><a
												href="${pageContext.request.contextPath}/gym/gymCalendar.gym">체육관
													정보</a></li>
											<li><a
												href="${pageContext.request.contextPath}/gym/gymView.gym">회원
													정보</a></li>
										</ul></li>
								</c:when>
								<c:when test="${loginMember.userType eq 'coach'}">
									<li><a
										href="${pageContext.request.contextPath}/gym/gymMainPage.gym">관장</a>
										<ul class="third">
											<li><a
												href="${pageContext.request.contextPath}/gym/gymForm.gym?gymNo=${gym.gymNo}">나의
													체육관 정보</a></li>
											<li><a
												href="${pageContext.request.contextPath}/gym/gymCalendar.gym">일정
													관리</a></li>
											<li><a
												href="${pageContext.request.contextPath}/gym/gymView.gym">사용자
													통계</a></li>
										</ul></li>
								</c:when>
							</c:choose>
						</ul>
					</li>
				</c:if>
				<li id="side__side"><a class="subside"
					href="${pageContext.request.contextPath}/match/matchList.ma">매칭</a>
					<ul id="subside__list">
						<li id="subside__side"><a
							href="${pageContext.request.contextPath}/match/matchReg.ma">매치
								등록</a></li>
						<li id="subside__side"><a href="#">매치 찾기</a></li>
					</ul></li>
				<li id="side__side"><a class="subside"
					href="${pageContext.request.contextPath}/ranking/rankingList.ra">랭킹</a></li>
				<li id="side__side"><a class="subside" href="">빈체로</a>
					<ul id="subside__list">
						<ul id="submenu_list">
							<li><a
								href="${pageContext.request.contextPath}/support/vincero.su">빈체로
									소개</a></li>
							<li><a
								href="${pageContext.request.contextPath}/support/rule.su">룰
									소개</a></li>
							<li><a href="#">가맹 신청</a></li>
						</ul></li>
			</ul>
			</li>
			<li id="side__side"><a class="subside"
				href="${pageContext.request.contextPath}/support/support.su">고객센터</a>
				<ul id="subside__list">
					<li id="subside__side"><a href="#">자주묻는질문</a></li>
					<li id="subside__side"><a href="#">등등</a></li>
				</ul></li>
			</ul>
		</nav>
	</div>


	<script>
		window.onscroll = scrollF();
	    
	    function scrollF() {
	    	if(document.body.scrollTop > 200 || document.documentElement.scrollTop > 200){
	        	document.getElementById('navBar').style.top = '0';
	        }else{
	        	document.getElementById('navBar').style.top = '-200px';
	        }
	</script>