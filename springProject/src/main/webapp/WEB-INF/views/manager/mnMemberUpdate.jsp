<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.spring.member.model.vo.Member, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/manager/mnGymList.css">
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div id="container">

	<!--  회원정보 리스트 테이블 -->
	<form name="frmm" method="post" action="${pageContext.request.contextPath}/manager/mnMemberUpdate.mn">
	<button id="reset" type="button" style="width:80px" onclick="window.location.reload()">원래대로</button>
	<button type="button" style="width:80px" onclick="javascript:history.back()">목록으로</button>
	<button type="button" style="width:100px" onclick="profileToggle()">프로필 보기</button>
	<table>
		<tr align="center">
			<th >아이디</th>
			<th >주민번호</th>
			<th >이름</th>
			<th>성별</th>
			<th>이메일</th>
			<th>휴대폰 번호</th>
			<th colspan="2">우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>타입</th>
			<th>상태</th>
			<th>통제기간</th>
			<th>가입일</th>
		</tr>
			<tr align="center">
				<td>
					<input type="text" style="border:0 solid black;width:80px;" id="userId" name="userId" value="${member.userId}" readonly>
					<br><button type="submit" style="width:80px">수정완료</button>
				</td>
				<td>
					<input type="text" style="border:0 solid black;width:68px;" id="userRnn" name="userRnn" value="${member.userRnn}" readonly>
				</td>
				<td>
					<input type="text" id="userName" name="userName" style="width:80px;" value="${member.userName}">
				</td>
				<td>
					<input type="text" style="border:0 solid black;width:20px;" id="userGender" name="userGender" value="${member.userGender}" readonly>
				</td>
				<td>
					<input type="email" id="userEmail" name="userEmail" style="width:150px;" value="${member.userEmail}">
				</td>
				<td>
					<input type="text" id="phone" name="phone" style="width:120px;" value="${member.phone}">
				</td>
				<td>
					<input type="text" id="postcode" name="zipcode" style="width:65px;" value="${member.zipcode}">
				</td>
				<td>
					<input type="button" value="찾기" style="width:40px;" onclick="findAddr();">
				</td>
				<td>
					<input type="text" id="addr" name="address" value="${member.address}" readonly>
				</td>
				<td>
					<input id="detailAddr" name="detailAddress" style="width:220px;" value="${member.detailaddress}">
				</td>
				<td>
					<select name="userType" style="width:75px;">
						<option value="admin" ${member.userType eq 'admin' ? 'selected' : '' }>관리자</option>
						<option value="coach" ${member.userType eq 'coach' ? 'selected' : '' }>관장님</option>
						<option value="user" ${member.userType eq 'user' ? 'selected' : '' }>일반</option>
						<option value="young" ${member.userType eq 'young' ? 'selected' : '' }>청소년</option>
					</select>
				</td>
				<td>
					<select name="userStatus" style="width:85px;"onchange="handleUserStatusChange(this)">
						<option value=0 ${member.userStatus eq 0 ? 'selected' : '' }>탈퇴</option>
						<option value=1 ${member.userStatus eq 1 ? 'selected' : '' }>회원가입</option>
						<option value=2 ${member.userStatus eq 2 && member.userType ne 'young' ? 'selected' : '' } ${member.userType eq 'young' ? 'disabled' : '' }>프로필</option>
						<option value=4 ${member.userStatus eq 4 ? 'selected' : '' }>제재상태</option>
					</select>
				</td>
				<td>
					<select name="userControl" style="width:85px;" ${member.userStatus ne 4 ? 'disabled' : ''}>
						<option value=0 ${member.userControl eq 0 ? 'selected' : '' }>제재없음</option>
						<option value=1 ${member.userControl eq 1 ? 'selected' : '' }>7일</option>
						<option value=2 ${member.userControl eq 2 ? 'selected' : '' }>30일</option>
						<option value=3 ${member.userControl eq 3 ? 'selected' : '' }>60일</option>
						<option value=4 ${member.userControl eq 4 ? 'selected' : '' }>100일</option>
						<option value=5 ${member.userControl eq 5 ? 'selected' : '' }>무기한</option>
					</select>
				</td>
				<td>
					<input style="border:0 solid black;width:80px;" id="userRegdate" name="userRegdate" value="${member.userRegdate}" readonly>
				</td>
			</tr>
	</table>
	</form>
	
	<!--  프로필 리스트 테이블 -->
	<form name="frmp" method="post" action="${pageContext.request.contextPath}/manager/mnProfileUpdate.mn">
	<button id="profileButton" class="h3" type="submit" style="width:80px">수정완료</button>
	<br>
	<table id="profileTable" style="display: none;">
		<tr align="center">
			<th>사진</th>
			<th>닉네임</th>
			<th>주종목</th>
			<th colspan="2">키</th>
			<th>승</th>
			<th>공식대회이력</th>
			<th>개인대회이력</th>
			<th>욕설</th>
			<th>지각</th>
		</tr>
		<tr align="center">
			<td rowspan="3">
				<input type="text" id="proPhoto" name="proPhoto" style="width:120px" value="${profile.proPhoto}">
			</td>
			<td>
				<input type="text" id="proNick" name="proNick" style="width:160px" value="${profile.proNick}">
			</td>				
			<td>
	 			<select name="proMajor">
					<option value="taek" ${profile.proMajor eq 'taek' ? 'selected' : '' }>태권도</option>
					<option value="grap" ${profile.proMajor eq 'grap' ? 'selected' : '' }>잡기류</option>
					<option value="striker" ${profile.proMajor eq 'striker' ? 'selected' : '' }>킥복싱류</option>
					<option value="box" ${profile.proMajor eq 'box' ? 'selected' : '' }>복싱</option>
				</select>
			</td>
			<!--  
			<td>
				<input type="text" id="userGender" name="userGender" value="${profile.userGender}">
			</td>
			-->
			<td>
				<input type="text" id="proHeight" name="proHeight" style="width:50px" value="${profile.proHeight}">
			</td>
			<td>
				cm
			</td>
			<td>
				<input type="text" id="win" name="win" style="width:50px" value="${profile.win}">
			</td>
			<td rowspan="3">
				<textarea id="official" name="official">${profile.official}</textarea>
			</td>
			<td rowspan="3">
				<textarea id="personal" name="personal">${profile.personal}</textarea>
			</td>	
			<td>
				<input type="text" id="warn1" name="warn1" style="width:50px" value="${profile.warn1}">
			</td>
			<td>
				<input type="text" id="warn2" name="warn2" style="width:50px" value="${profile.warn2}">
			</td>
		</tr>

		<tr>
			<input type="hidden" id="userId" name="userId" value="${member.userId}">
			<th>건강상태</th>
			<th>급수</th>
			<th colspan="2">몸무게</th>
			<th>패</th>
			<th>룰위반</th>
			<th>기타<br>비매너</th>
		</tr>
		<tr>
			<td>
				<input type="text" id="note" name="note" style="width:160px" value="${profile.note}">
			</td>		
			<td>
				<input type="text" id="proLevel" name="proLevel" style="width:120px" value="${profile.proLevel}">
			</td>
			<td>
				<input type="text" id="proWeight" name="proWeight" style="width:50px" value="${profile.proWeight}">
			</td>
			<td>
				kg
			</td>
			<td>
				<input type="text" id="lose" name="lose" style="width:50px" value="${profile.lose}">
			</td>
			<td>
				<input type="text" id="warn3" name="warn3" style="width:50px" value="${profile.warn3}">
			</td>
			<td>
				<input type="text" id="warn4" name="warn4" style="width:50px" value="${profile.warn4}">
			</td>			
		</tr>
	</table>
	</form>
	
</div>

<!-- 제재상태를 선택하였을때 제재기간드랍박스가 보여지도록 하는 스크립트 -->
<script>
  function handleUserStatusChange(selectElement) {
    var userControlSelect = document.getElementsByName('userControl')[0];
    if (selectElement.value == 4) {
      userControlSelect.disabled = false;
    } else {
      userControlSelect.disabled = true;
    }
    
    <!-- 청소년타입이면 상태변경에서 프로필이 나오지않게 하는 스크립트 -->
	var userTypeSelect = document.getElementsByName('userType')[0];
	if (userTypeSelect.value === 'young') {
	  selectElement.value = selectElement.value === '2' ? '0' : selectElement.value;
	}
  }
</script>

<!-- 회원 주소설정 스크립트 -->
<script>
function findAddr() {
    new daum.Postcode({
        oncomplete: function (data) {
            let roadAddr = data.roadAddress;
            let jibunAddr = data.jibunAddress;
            let extraAddr = '';

            document.getElementById("postcode").value = data.zonecode;

            if (data.userSelectedType == 'R') {
                if (roadAddr != '') {
                    if (data.bname != '') {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName != '') {
                        extraAddr += extraAddr != '' ? ', ' + data.buildingName : data.buildingName;
                    }
                    roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
                    document.getElementById("addr").value = roadAddr;
                }
            } else if (data.userSelectedType == 'J') {
                document.getElementById("addr").value = jibunAddr;
            }

            document.getElementById("detailAddr").focus();
        }
    }).open();
}
</script>

<!-- 프로필테이블 보여지거나 숨기게 하는 스크립트 -->
<script>
	document.addEventListener("DOMContentLoaded", function() {
	    var button = document.getElementById("profileButton");
	    button.style.display = "none"; // 버튼을 숨김으로 설정
	  });


  function profileToggle() {
    var table = document.getElementById("profileTable");
    var button = document.getElementById("profileButton");
    
    if (table.style.display === "none") {
      table.style.display = "table";
      button.style.display = "inline";
    } else {
      table.style.display = "none";
      button.style.display = "none";
    }
  }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />


