<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gym/join.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="가맹점신청" name="title"/>
	</jsp:include>
	<div id="container">
		<div id="describe">
			<h1>- 가맹점 신청 -</h1>
			<h3>( 빈체로 공식 체육관이 된다면 ?&ensp; 다음과 같은 혜택이 있습니다 ! )</h3>
			<p>1. 스포츠를 즐기는 다양한 빈체로 유저들이 관장님의 체육관을 매치를 위해 쉽게 예약 가능 !</p>
			<p>2. 체육관에서 진행되는 매치의 대부분 수익은 관장님께 !</p>
			<p>3. 많은 사람에게 체육관을 홍보 할 수 있는 절호의 기회 !</p>
		</div>
		<div id="join">
			<div id="image">
				<img src="${pageContext.request.contextPath}/resources/img/gym/taekwon.jpg" alt="taekwondo" width="750px" height="750px">
			</div>
			<div id="table">
				<form action="${pageContext.request.contextPath}/gym/joinEnrollForm.gym" method="post">
					<table>
						<tr>
							<td colspan="2">
								<h2>가맹점신청란</h2>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<i>1. 가맹점 신청란에 정보를 입력하시고, 가맹신청을 누르세요</i>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<i>2. 모든 정보는 계약상의 정보로서 정확히 입력해주세요</i>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<i>3. 신청을 하시면, 직원이 빠른 시일내에 연락을 취할 것입니다</i><br>
							</td>
						</tr>
						<tr>
							<td height="10px">
							</td>
						</tr>
						<tr>
							<th>
								<label for="gymBoss">사업자대표명&emsp;:&emsp;</label>
							</th>
							<td>
								<input type="text" id="gymBoss" name="gymBoss" placeholder="&emsp;사업자 대표명 입력하세요" required>
							</td>
						</tr>
						<tr>
							<th>
								<label for="businessNo">사업자번호&emsp;:&emsp;</label>
							</th>
							<td>
								<input type="text" id="businessNo" name="businessNo" placeholder="&emsp;숫자만 입력하세요" required>
							</td>
						</tr>	
						<tr>
							<th>
								<label for="gymCoach">관장님성함&emsp;:&emsp;</label>
							</th>
							<td>
								<input type="text" id="gymCoach" name="gymCoach" placeholder="&emsp;대표명과 중복가능" required>
							</td>
						</tr>
						<tr>
							<th>
								<label for="gymName">체육관이름&emsp;:&emsp;</label>
							</th>
							<td>
								<input type="text" id="gymName" name="gymName" placeholder="&emsp;체육관 이름 입력하세요" required>
							</td>
						</tr>
						<tr>
							<th>
								<label for="gymType">체육관종목&emsp;:&emsp;</label>
							</th>
							<td>
								<select id="gymType" name="gymType">
									<option value="taek">태권도</option>
								    <option value="grap">잡기류 ex)유도, 주짓수</option>
								    <option value="striker">킥복싱류 ex)무에타이, 킥복싱</option>
								    <option value="box">복싱</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								<label for="coachPhone">관장님전화번호&emsp;:&emsp;</label>
							</th>
							<td>
								<input type="text" id="coachPhone" name="coachPhone" placeholder="&emsp;000-0000-0000" required>
							</td>
						</tr>
						<tr>
							<th>
								<label for="gymPhone">체육관전화번호&emsp;:&emsp;</label>
							</th>
							<td>
								<input type="text" id="gymPhone" name="gymPhone" placeholder="&emsp;000-0000-0000" required>
							</td>
						</tr>
						<tr>
							<th>
								<label for="gymZipcode">체육관우편번호&emsp;:&emsp; </label>
							</th>
							<td>
								<input type="text" id="gymZipcode" name="gymZipcode" readonly placeholder="&emsp;주소찾기를 클릭" required>
								<input type="button" id="addressButton" value="주소찾기" onclick="findAddr();">
							</td>
						</tr>
						<tr>
							<th>
								<label for="gymAddress">체육관주소&emsp;:&emsp;</label>
							</th>
							<td>
								<input type="text" id="gymAddress" name="gymAddress" readonly placeholder="&emsp;주소찾기를 클릭" required>
							</td>
						</tr>
						<tr>
							<th>
								<label for="gymDetailaddress">체육관상세주소&emsp;:&emsp;</label>
							</th>
							<td>
								<input type="text" id="gymDetailaddress" name="gymDetailaddress" placeholder="&emsp;상세 주소를 입력해주세요" required>
							</td>
						</tr>
						<tr>
							<th>
							</th>
							<td>
								<input type="hidden" name="userId" value="${loginMember.userId}">
							</td>
						</tr>
					</table>
					<div id="button">
						<input type="submit" value="가맹신청" id="submitButton">
						<input type="reset" value="다시쓰기" id="resetButton">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function findAddr() {
    new daum.Postcode({
        oncomplete: function (data) {
            let roadAddr = data.roadAddress;
            let jibunAddr = data.jibunAddress;
            let extraAddr = '';
         
            document.getElementById("gymZipcode").value = data.zonecode;

            if (data.userSelectedType == 'R') {
                if (roadAddr != '') {
                    if (data.bname != '') {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName != '') {
                        extraAddr += extraAddr != '' ? ', ' + data.buildingName : data.buildingName;
                    }
                    roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
                    document.getElementById("gymAddress").value = roadAddr;
                }
            } else if (data.userSelectedType == 'J') {
                document.getElementById("gymAddress").value = jibunAddr;
            }

            document.getElementById("gymDetailaddress").focus();
        }
    }).open();
}
</script>
</html>