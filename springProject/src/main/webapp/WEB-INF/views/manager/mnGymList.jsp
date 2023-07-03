<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/manager/mnGymList.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div id="container">

	<!-- 체육관정보 리스트 테이블 -->
	<table>
		<tr align="center">
			<th rowspan="2">계약 고유번호</th>
			<th>체육관 이름</th>
			<th>종목</th>
			<th>대표자 이름</th>
			<th>체육관 번호</th>
			<th>은행명</th>
			<th>계약일</th>
			<th>체육관 주소</th>
			<th>체육관상태</th>
			<th>가입상태</form>
		</tr>
		<tr>
			<th>사업자 번호</th>
			<th>매치 수</th>
			<th>관장 이름</th>
			<th>관장 번호</th>
			<th>계좌</th>
			<th>체육관 우편번호</th>
			<th>체육관 상세주소</th>
			<th>사유</th>
			<th>관장 ID</th>
		</tr>
		<c:forEach items="${gymList}" var="gym">
			<tr align="center">
				<td>${gym.gymNo}<br><br><button onclick="mnGymUpdate(${gym.gymNo});">수정하기</button></td>
				<td>${gym.gymName}<br><br><hr><br>${gym.businessNo}</td>
				<td>
					<c:if test="${gym.gymType eq 'taek'}">
						태권도
					</c:if> 
					<c:if test="${gym.gymType eq 'grap'}">
						잡기류
					</c:if> 
					<c:if test="${gym.gymType eq 'striker'}">
						킥복싱류
					</c:if> 
					<c:if test="${gym.gymType eq 'box'}">
						복싱
					</c:if><br><br><hr><br>
				${gym.matchCount}</td>
				<td>${gym.gymBoss}<br><br><hr><br>${gym.gymCoach}</td>
				<td>${gym.gymPhone}<br><br><hr><br>${gym.coachPhone}</td>
				<td>${gym.gymBank}<br><br><hr><br>${gym.gymAccount}</td>
				<td>${gym.gymRegdate}<br><br><hr><br>${gym.gymZipcode}</td>
				<td>${gym.gymAddress}<br><br><hr><br>${gym.gymDetailaddress}</td>
				<td>
					<c:if test="${gym.gymStatus eq 0}">
						가맹신청
					</c:if> 
					<c:if test="${gym.gymStatus eq 1}">
						심사중
					</c:if> 
					<c:if test="${gym.gymStatus eq 2}">
						계약체결
					</c:if> 
					<c:if test="${gym.gymStatus eq 3}">
						계약실패
					</c:if> 
					<c:if test="${gym.gymStatus eq 4}">
						계약해지
					</c:if><br><br><hr><br>
					${gym.reason}</td>
				<td>
					<c:if test="${gym.userId == null}">
						미가입
					</c:if>
					<c:if test="${gym.userId != null}">
						가입완료
					</c:if>
					<br><br><hr><br>
					<c:if test="${gym.userId == null}">
					</c:if>
					<c:if test="${gym.userId != null}">
						${gym.userId}
					</c:if>
				</td>
			</tr>
		</c:forEach>	
		
	</table>
	
	<!-- 페이지 코드 -->
	<nav>
		<ul>
			<!-- 1페이지면 이전버튼이 활성화되지않도록 if문 추가 -->
			<c:if test="${pi.nowPage eq 1}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/manager/mnGymList.mn?nowPage=${pi.nowPage}" >이전</a>
				</li>
			</c:if>
			<c:if test="${pi.nowPage ne 1}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/manager/mnGymList.mn?nowPage=${pi.nowPage-1}" >이전</a>
				</li>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${p eq pi.nowPage}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/manager/mnGymList.mn?nowPage=${p}">${p}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/manager/mnGymList.mn?nowPage=${p}">${p}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 마지막 페이지면 다음버튼이 활성화되지않도록 if문 추가 -->
			<c:if test="${ pi.nowPage eq pi.totalPage }">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/manager/mnGymList.mn?nowPage=${pi.nowPage}">다음</a>
				</li>
			</c:if>	
			<c:if test="${ pi.nowPage ne pi.totalPage }">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/manager/mnGymList.mn?nowPage=${pi.nowPage+1}">다음</a>
				</li>
			</c:if>
		</ul>
	</nav>
</div>

<!-- 수정하기버튼을 누르면 작동하는 스크립트 -->
<script>
	function mnGymUpdate(gymNo) {
		location.href='${pageContext.request.contextPath}/manager/mnGymUpdate.mn?gymNo='+gymNo;
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />


