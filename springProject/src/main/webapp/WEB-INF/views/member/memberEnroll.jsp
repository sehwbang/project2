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
					<td>
						<input type="text" id="id" name="id" required>
						<input type="button" id="idc" value="중복확인" onclick="idChecka();">
						<span id="result"></span>
						<input type="hidden" name="idbtncheck" value="idUncheck">
					</td>
				</tr>
				<tr>
                    <td colspan="2" id="messageId" class="message"></td>
                </tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td><input type="password" id="pw" name="pw" required></td>
				</tr>
				<tr>
                    <td colspan="2" id="messagePw" class="message"></td>
                </tr>
				<tr>
					<th><label for="pwc">비밀번호찾기</label></th>
					<td><input type="password" id="pwc" required></td>
				</tr>
				<tr>
                    <td colspan="2" id="messagePwc" class="message"></td>
                </tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td><input type="text" id="name" name="name" required></td>
				</tr>
				<tr>
                    <td colspan="2" id="messageName" class="message"></td>
                </tr>
				<tr>
					<th><label for="rnn">주민등록번호</label></th>
					<td>
						<input type="text" id="rnn" class="rnnc"> - 
						<input type="text" id="rnn2" class="rnnc">
					</td>
				</tr>
				<tr>
                    <td colspan="2" id="messageRnn" class="message"></td>
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
					<td colspan="2" id="messagePhone" class="message"></td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td><input type="email" id="email" name="email"></td>
				</tr>
				<tr>
                    <td colspan="2" id="messageEmail" class="message"></td>
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
<script type="text/javascript">
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

let idCheck = false;
let pwCheck = false;
let pwcCheck = false;
let nameCheck = false;
let emailCheck = false;
let rnnCheck1 = false;
let rnnCheck2 = false;
let rnnCheck = false;
let phoneCheck = false;

document.getElementById("id").addEventListener("focusout", () => {
	setTimeout(() => {
    const inputId = document.getElementById("id").value;
    let messageId = document.getElementById("messageId");
    const regExp1 = /^[a-zA-Z][a-zA-Z0-9]{5,12}$/;

    if (regExp1.test(inputId)) {
        idCheck = true;
        messageId.innerHTML = "중복체크하세요.";
    } else if (inputId === "") {
        messageId.innerHTML = "필수 정보입니다.";
        idCheck = false;
    } else {
        messageId.innerHTML = "첫글자는 반드시 영문자이며, 숫자 포함 총 6~13자로 입력하시오.";
        idCheck = false;
    }
	}, 200);
})

function idChecka() {
   	$.ajax({
           url: "${pageContext.request.contextPath}/member/id.ch",
           type: "get",
           data : {ida : $("#id").val()},
           dataType : "json",
          
               success(result) {
            	   	console.log(result);
					
					const {userId, available} = result;
					console.log(result);
					
					if(available) {
						
						$("#messageId").text("멋진 아이디네요 !");
						document.getElementById("idc").addEventListener("focusout", () => {
						    const inputId = document.getElementById("id").value;
						    let messageId = document.getElementById("messageId");
						    const regExp1 = /^[a-zA-Z][a-zA-Z0-9]{5,12}$/;

						    if (regExp1.test(inputId)) {
						        idCheck = true;
						    } else if (inputId === "") {
						        messageId.innerHTML = "필수 정보입니다.";
						        idCheck = false;
						    } else {
						        messageId.innerHTML = "첫글자는 반드시 영문자이며, 숫자 포함 총 6~13자로 입력하시오.";
						        idCheck = false;
						    }
						})

						iddCheck = true;
						
						$("#idbtncheck").val("idCheck");
					} else {
						$("#messageId").text("이미 사용중이거나 탈퇴한 아이디입니다");
						iddCheck = false;
						$("#idbtncheck").val("idUncheck");
					}
	
				},
				error : console.log
       });
}

function inputIdChk() {
	regFrm.idbtncheck.value = "idUncheck";
}

document.getElementById("pw").addEventListener("focusout", () => {
	setTimeout(() => {
    const inputPw = document.getElementById("pw").value;
    let messagePw = document.getElementById("messagePw");
    const regExp2 = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;

    if (regExp2.test(inputPw)) {
        messagePw.innerHTML = "멋진 비밀번호입니다 !";
        pwCheck = true;
    } else if (inputPw === "") {
        messagePw.innerHTML = "필수 정보입니다.";
        pwCheck = false;
    } else {
        messagePw.innerHTML = "영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.";
        pwCheck = false;
    }
	}, 200);
})

document.getElementById("pwc").addEventListener("focusout", () => {
	setTimeout(() => {
	    const inputPw = document.getElementById("pw").value;
	    const inputPwc = document.getElementById("pwc").value;
	    let messagePwc = document.getElementById("messagePwc");
	    if ((inputPwc == inputPw)) {
	        if (inputPwc === "") {
	            messagePwc.innerHTML = "필수 정보입니다.";
	            pwcCheck = false;
	        } else {
	            messagePwc.innerHTML = "비밀번호가 일치합니다 !";
	            pwcCheck = true;
	        }
	    } else if (inputPw === "") {
	        messagePwc.innerHTML = "필수 정보입니다.";
	        pwcCheck = false;
	    } else {
	        messagePwc.innerHTML = "비밀번호가 일치하지 않습니다.";
	        pwcCheck = false;
	    }
	}, 200);
})

document.getElementById("name").addEventListener("focusout", () => {
    setTimeout(() => {
    	 const inputName = document.getElementById("name").value;
    	 let messageName = document.getElementById("messageName");
    	 const regExp3 = /^[가-힣]{2,}$/;
    if (regExp3.test(inputName)) {
        messageName.innerHTML = "멋진 이름입니다 !";
        nameCheck = true;
    } else if (inputName === "") {
        messageName.innerHTML = "필수 정보입니다.";
        nameCheck = false;
    } else {
        messageName.innerHTML = "한글 2글자 이상, 15자 이하로 입력하시오.";
        nameCheck = false;
    }
  }, 200);
   
})

document.getElementById("rnn").addEventListener("focusout", () => {
	const inputRnn = document.getElementById("rnn").value;
    const regExp5 = /^\d{6}$/;
    const inputRnn = document.getElementById("rnn").value;
    const regExp5 = /^\d{6}$/;
    if (regExp5.test(inputRnn)) {
        rnnCheck1 = true;
    } else if (inputRnn === "") {
        rnnCheck1 = false;
    } else {
    	rnnCheck1 = false;
    }
    if (regExp6.test(inputRnn2)) {
        rnnCheck2 = true;
    } else if (inputRnn2 === "") {
        rnnCheck2 = false;
    } else {
    	rnnCheck2 = false;
    }
    setTimeout(() => {
		let messageRnn = document.getElementById("messageRnn");
		console.log(rnnCheck1)
		console.log(rnnCheck2)
    if (rnnCheck1 == true && rnnCheck2 == true) {
    	messageRnn.innerHTML = "주민등록번호를 기입하셨습니다.";
        rnnCheck = true;
    }  else {
    	messageRnn.innerHTML = "주민등록번호를 기입하셔야 합니다.";
    }
	}, 200);
})

document.getElementById("rnn2").addEventListener("focusout", () => {
		const inputRnn = document.getElementById("rnn").value;
	    const regExp5 = /^\d{6}$/;
	    const inputRnn2 = document.getElementById("rnn2").value;
	    const regExp6 = /^\d{7}$/;
	    if (regExp5.test(inputRnn)) {
	        rnnCheck1 = true;
	    } else if (inputRnn === "") {
	        rnnCheck1 = false;
	    } else {
	    	rnnCheck1 = false;
	    }
	    if (regExp6.test(inputRnn2)) {
	        rnnCheck2 = true;
	    } else if (inputRnn2 === "") {
	        rnnCheck2 = false;
	    } else {
	    	rnnCheck2 = false;
	    }
	    setTimeout(() => {
			let messageRnn = document.getElementById("messageRnn");
			console.log(rnnCheck1)
			console.log(rnnCheck2)
	    if (rnnCheck1 == true && rnnCheck2 == true) {
	    	messageRnn.innerHTML = "주민등록번호를 기입하셨습니다.";
	        rnnCheck = true;
	    }  else {
	    	messageRnn.innerHTML = "주민등록번호를 기입하셔야 합니다.";
	    }
		}, 200);
})

document.querySelector(".rnnc").addEventListener("focusout", () => {
	setTimeout(() => {
		let messageRnn = document.getElementById("messageRnn");
		console.log(rnnCheck1)
		console.log(rnnCheck2)
    if (rnnCheck1 == true && rnnCheck2 == true) {
    	messageRnn.innerHTML = "주민등록번호를 기입하셨습니다.";
        rnnCheck = true;
    }  else {
    	messageRnn.innerHTML = "주민등록번호를 기입하셔야 합니다.";
    }
	}, 200);
})

/* document.getElementById("email").addEventListener("focusout", () => {
	setTimeout(() => {
    const inputMail = document.getElementById("email").value;
    let messageMail = document.getElementById("messageMail");
    const regExp4 = /^[a-zA-Z0-9._-]{3,10}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (regExp4.test(inputMail)) {
        messageMail.innerHTML = "멋진 이메일입니다 !";
        mailCheck = true;
    } else if (inputMail === "") {
        messageMail.innerHTML = "필수 정보입니다.";
        mailCheck = false;
    } else {
        messageMail.innerHTML = "이메일 형식에 맞아야 합니다.";
        mailCheck = false;
    }
	}, 200);
}) */

document.getElementById("phone").addEventListener("focusout", () => {
	setTimeout(() => {
    const inputPhone = document.getElementById("phone").value;
    let messagePhone = document.getElementById("messagePhone");
    const regExp7 = /^(\d{3})-(\d{4})-(\d{4})$/;
    if (regExp6.test(inputPhone)) {
        messagePhone.innerHTML = "멋진 전화번호입니다 !";
        phoneCheck = true;
    } else if (inputPhone === "") {
        messagePhone.innerHTML = "필수 정보입니다.";
        phoneCheck = false;
    } else {
        messagePhone.innerHTML = "-를 넣어 전화번호를 입력하세요. 예) 010-6752-7417";
        phoneCheck = false;
    }
	}, 200);
})      
    
</script>
</html>


