<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
		<form action="${pageContext.request.contextPath}/member/memberEnroll.me" method="post">
			<table>
				<tr>
					<th><label for="id">아이디</label></th>
					<td><input type="text" id="id" name="id"></td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td><input type="password" id="pw" name="pw"></td>
				</tr>
				<tr>
					<th><label for="pwc">비밀번호찾기</label></th>
					<td><input type="password" id="pwc"></td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label for="m">남</label>
						<input id="m" type="radio" value="m" name="gender">
						<label for="w">녀</label>
						<input id="w" type="radio" value="w" name="gender">
					</td>
				</tr>
				<tr>
					<th><label for="birth">생년월일</label></th>
					<td><input type="text" id="birth" name="birth"></td>
				</tr>
           		<tr>
					<th>
						<label for="phone">휴대폰번호</label>
					</th>
					<td>
						<input id="phone" type="text" name="phone" required>
						<input type="button" id="phoneChk" class="doubleChk" value="인증번호 보내기">
					</td>	
				</tr>
				<tr>
					<th></th>
					<td>
						<input id="phone2" type="text" disabled required/>
						<input type="button" id="phoneChk2" class="doubleChk" value="본인인증"></input>
					</td>
					<td>
						<span class="point successPhoneChk">휴대폰번호 입력후 인증번호 보내기</span>
						<input type="hidden" id="phoneDoubleChk"/>
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td><input type="email" id="email" name="email"></td>
				</tr>
				<tr>
                  	<th>주소</th>
                  	<td>
	                      <input name="zipcode" id="postcode" readonly>
	                      <input type="button" value="우편번호 찾기" onclick="findAddr();">
                  	</td>
              	</tr>
              	<tr>
                  	<th></th>
	                  <td>
	                      <input name="address" id="addr" readonly>
	                      
	                  </td>
	                  
              	</tr>
              	<tr>
              		<th></th>
              			<td>
	                  	<input name="detailaddress" id="detailAddr" required>
	                  </td>
                </tr>
                <tr>
                	<td><input type="hidden" name="usertype" value="u"></td>
                	<td><input type="hidden" name="status" value="normal"></td>
                </tr>
			</table>
			<button type="submit">회원가입</button>&emsp;
			<button type="reset">초기화</button>
		</form>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
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
</html>


