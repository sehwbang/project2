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
	href="${pageContext.request.contextPath}/resources/css/memberDetail.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/memberDetail.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<div id="container">
		<form
			action="${pageContext.request.contextPath}/member/memberUpdate.me"
			method="post" name="memInfofrm">
			<h1>마이페이지</h1>
			<table class="container">
				<tbody>
					<tr>
						<th scope="col">아이디</th>
						<td scope="col" name="userId">${loginMember.userId}</td>
					<tr>
						<td colspan="2" id="messageId" class="message"></td>
					</tr>
					<tr>
						<th scope="col">비밀번호</th>
						<td scope="col"><input name="userPw" type="password" type="text" 
							placeholder="*****" required></td>
					</tr>
					<tr>
						<td colspan="2" id="messagePw" class="message"></td>
					</tr>

					<tr>
						<th scope="col">이름</th>
						<td scope="col" name="userName" >${loginMember.userName}</td>
					</tr>
					<tr>
						<td colspan="2" id="messageName" class="message"></td>
					</tr>
					<tr>
						<th scope="col">주민번호</th>
						<td scope="col" name="userRnn">${loginMember.userRnn}</td>
					</tr>
					<tr>
						<td colspan="2" id="messageRnn" class="message"></td>
					</tr>

					<th scope="col">전화번호</th>
					<td scope="col"><input name="phone" type="text"
						value="${loginMember.phone}"></td>

					<tr>
						<td colspan="2" id="messagePhone" class="message"></td>
					</tr>
					<tr>
						<th scope="col">이메일</th>
						<td scope="col" ><input name="userEmail" type="text"
							value="${loginMember.userEmail}"></td>

					</tr>
					<tr>
						<td colspan="2" id="messageEmail" class="message"></td>
					</tr>
					<tr>
						<th></th>
						<td><input name="zipcode" id="postcode"
							placeholder="${loginMember.zipcode}"></td>
						<td><input type="button" value="우편번호 찾기"
							onclick="findAddr();"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2"><input name="address" id="addr"
							placeholder="${loginMember.address}"></td>
					</tr>
					<tr>
						<th></th>
						<td colspan="2"><input name="detailAddress" id="detailAddr"
							placeholder="${loginMember.detailAddress}"></td>
					</tr>
			</table>

			<button type="submit" class="btn btn-outline-success">수정</button>
		</form>
		<div class="footer" align="center" style="padding: 50px;">

			<p>&copy; 2023 VINCERO. All rights reserved.</p>
		</div>

	</div>