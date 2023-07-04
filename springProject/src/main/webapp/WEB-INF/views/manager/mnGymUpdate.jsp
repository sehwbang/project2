<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.spring.gym.model.vo.Gym, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/manager/mnGymList.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div id="container">
	<!-- 체육관정보 리스트 테이블 -->
	<form name="frm" method="post" action="${pageContext.request.contextPath}/manager/mnGymUpdate.mn">
	<table>
		<tr align="center">
			<th rowspan="2" style="width:200px">계약 고유번호</th>
			<th>체육관 이름</th>
			<th>종목</th>
			<th>대표자 이름</th>
			<th>체육관 번호</th>
			<th>은행명</th>
			<th>계약일</th>
			<th>체육관 주소</th>
			<th>체육관상태</th>
			<th>가입상태</th>
		</tr>
		<tr>
			<th>사업자 번호</th>
			<th>매치 수</th>
			<th>관장님 이름</th>
			<th>관장님 번호</th>
			<th>계좌</th>
			<th>체육관 우편번호</th>
			<th>체육관 상세주소</th>
			<th>사유</th>
			<th>관장ID</th>
		</tr>
			<tr align="center">
				<td>
					${gym.gymNo}
					<input type="hidden" id="gymNo" name="gymNo" value="${gym.gymNo}">
					<br><br><button type="submit" style="width:80px">수정완료</button>
					<br><button type="button" style="width:80px" onclick="window.location.reload()">초기화</button>
				</td>
				<td>
					<input type="text" id="gymName" name="gymName" value="${gym.gymName}"><br><br><hr><br>
					<input type="text" id="businessNo" name="businessNo" value="${gym.businessNo}">
				</td>
				<td>
					<select name="gymType">
						<option value="taek" ${gym.gymType eq 'taek' ? 'selected' : '' }>태권도</option>
						<option value="grap" ${gym.gymType eq 'grap' ? 'selected' : '' }>잡기류</option>
						<option value="striker" ${gym.gymType eq 'striker' ? 'selected' : '' }>킥복싱류</option>
						<option value="box" ${gym.gymType eq 'box' ? 'selected' : '' }>복싱</option>
					</select><br><br><hr><br>
					<input type="text" id="matchCount" name="matchCount" value="${gym.matchCount}">
				</td>
				<td>
					<input type="text" id="gymBoss" name="gymBoss" value="${gym.gymBoss}"><br><br><hr><br>
					<input type="text" id="gymCoach" name="gymCoach" value="${gym.gymCoach}">
				</td>
				<td>
					<input type="text" id="gymPhone" name="gymPhone" value="${gym.gymPhone}"><br><br><hr><br>
					<input type="text" id="coachPhone" name="coachPhone" value="${gym.coachPhone}">
				</td>
				<td>
					<input type="text" id="gymBank" name="gymBank" value="${gym.gymBank}"><br><br><hr><br>
					<input type="text" id="gymAccount" name="gymAccount" value="${gym.gymAccount}">
				</td>
				<td>
					<input type="date" id="gymRegdate" name="gymRegdate" value="${gym.gymRegdate}"><br><br><hr><br>
					<input type="text" id="gymZipcode" name="gymZipcode" value="${gym.gymZipcode}">
				</td>
				<td>
					<input type="text" id="gymAddress" name="gymAddress" value="${gym.gymAddress}"><br><br><hr><br>
					<input type="text" id="gymDetailaddress" name="gymDetailaddress" value="${gym.gymDetailaddress}">
				</td>
				<td>
					<select name="gymStatus" onchange="handleGymStatusChange(this)">
						<option value=0 ${gym.gymStatus eq 0 ? 'selected' : '' }>가맹신청</option>
						<option value=1 ${gym.gymStatus eq 1 ? 'selected' : '' }>심사중</option>
						<option value=2 ${gym.gymStatus eq 2 ? 'selected' : ''   }>계약체결</option>
						<option value=3 ${gym.gymStatus eq 3 ? 'selected' : '' }>계약실패</option>
						<option value=4 ${gym.gymStatus eq 4 ? 'selected' : '' }>계약해지</option>
					</select><br><br><hr><br>
					<!-- gymStatus의 값이 4로 저장되어있으면 reason <input>태그의 타입을 date로 보여지게 -->
					<input type="${gym.gymStatus eq 4 ? 'date' : 'text'}" id="reason" name="reason" value="${gym.reason}" ${gym.gymStatus eq 3 || gym.gymStatus eq 4 ? '' : 'disabled'}>
																									<!-- 하기의 스크랩트는 선택되었을때이고, 상기의 코드는 값이 이미 3또는 4로 저장되어있는 경우 활성화를 따로 지정 -->
				</td>
				<td>
					<c:if test="${gym.userId == null}">
						미가입
					</c:if>
					<c:if test="${gym.userId != null}">
						가입완료
					</c:if><br><br><hr><br>
					<c:if test="${gym.userId == null}">
					</c:if>
					<c:if test="${gym.userId != null}">
						${gym.userId}
					</c:if>
					 <input type="hidden" id="userId" name="userId" value="${gym.userId}">
				</td>
			</tr>
	</table>
	</form>
	
</div>


<!-- 수정완료버튼을 누르면 작동하는 스크립트 -->
<script>
	function mnGymUpdate(gymNo) {
		location.href='${pageContext.request.contextPath}/manager/mnGymUpdate.mn?gymNo='+gymNo;
	}
</script>


<!-- 체육관 상태에 대한 스크립트 -->
<script>
	function handleGymStatusChange(selectElement) {
		var reasonInput = document.getElementById('reason');
		var selectedValue = selectElement.value;
		
		// 계약실패(3) 또는 계약해지(4)를 선택하였을때 사유입력란이 활성화되도록 하는 스크립트
	    if (selectedValue === '3' || selectedValue === '4') {
	        reasonInput.disabled = false; // 비활성화를 false함
	      } else {
	        reasonInput.disabled = true; // 비활성화를 true함
	      }
		
		// 계약해지(4)를 선택하였을때 <input>태그 타입이 날짜로 변경되게 하는 스크립트
		if (selectedValue === '4') {
		  reasonInput.type = 'date'; // 계약해지(4)로 들어와서 if문이 true면 date타입으로 
		  							 // date형식으로 날짜를 입력받지만 DB에 reason은 varchar2이므로 String으로 저장됨
		} else {
		  reasonInput.type = 'text'; // 그외의 값으로 들어와서 if문이 false면 text타입으로 
		}

	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />


