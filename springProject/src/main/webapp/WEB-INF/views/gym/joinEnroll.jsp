<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gym/join.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="가맹점신청" name="title"/>
	</jsp:include>
	<div id="describe">
		<h1>- 가맹점 신청 -</h1>
		<p>1. 가맹점 신청란에 정보를 입력하시고, 등록을 하세요</p>
		<p>2. 모든 정보는 계약상의 정보로서 정확히 입력해주세요</p>
		<p>3. 등록을 하시면, 직원이 계약을 위해 연락을 취할 것입니다.</p>
	</div>
	<div id="join">
		<div id="image">
			<img src="${pageContext.request.contextPath}/resources/img/gym/taekwon.jpg" alt="taekwondo" width="800px" height="800px">
		</div>
		<form action="${pageContext.request.contextPath}/gym/joinEnroll.gym" method="post">
			<table>
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
						<input type="text" id="gymCoach" name="gymCoach" placeholder="&emsp;대표명과 중복되어도 됩니다" required>
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
						<label for="coachPhone">관장전화번호&emsp;:&emsp;</label>
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
						<input type="text" id="gymAddress" name="gymAddress" readonly placeholder="&emsp;주소찾기를 클릭" required size="35">
					</td>
				</tr>
				<tr>
					<th>
						<label for="gymDetailaddress">체육관상세주소&emsp;:&emsp;</label>
					</th>
					<td>
						<input type="text" id="gymDetailaddress" name="gymDetailaddress" placeholder="&emsp;상세 주소를 입력해주세요" required size="35">
					</td>
				</tr>
			</table>
			<div id="button">
				<input type="submit" value="가맹신청" id="submitButton">
				<input type="reset" value="다시쓰기" id="resetButton">
			</div>
		</form>
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