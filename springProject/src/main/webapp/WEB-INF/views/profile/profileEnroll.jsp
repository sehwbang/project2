<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="viewport" content="width=800, height=1400, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileEnroll.css">
</head>
<body>
	<form action="${pageContext.request.contextPath}/profile/profileEnroll.pr" method="post">
    <table border="1" class="table1">
        <tr>
            <th rowspan="3">
                <div class="profile_photo">
                    <img id="imgThumb" src="https://static.nid.naver.com/images/web/user/default.png?type=s160" width="100" height="100">
                </div>
            </th>
            <th>닉네임</th>
            <td> 
          	 <input type="hidden" id="userId" name="userId" value="${loginMember.userId}"readonly>
                <input type="text" id="" name="proNick" required>
                <input type="button" id="nickc" value="중복확인" onclick="nickCheck();">
                <!-- <span id="result"></span>
                <input type="hidden" name="nickcheck" value="nickcheck"> -->
            </td>
        </tr>
        <tr>
            <th>주종목</th>
            <td>
                <select id="gymType" name="proMajor">
                	<option value="no">없음</option>
                    <option value="taek">태권도</option>
                    <option value="grap">잡기류 ex)유도, 주짓수</option>
                    <option value="striker">킥복싱류 ex)무에타이, 킥복싱</option>
                    <option value="box">복싱</option>
                </select>
            </td>
        </tr>
        <tr>
        	<th>
                <label for="level">급수</label>
            </th>
            <td>
                <input type="text" id="proLevel" name="proLevel" placeholder="ex) 3단, 블루벨트">
            </td>
            
        </tr>
        <tr>
            <th>    
                <div>
                    <span class="btn_file">
                        <input type="file" id="file" name="proPhoto" type="hidden">
                        <div id="filepointer"><label for="file">파일첨부</label></div>
                    </span>
                </div>
            </th>
            <th>전적</th>
            <td>승 : <input type="text" id="win" name="win" placeholder="0" disabled> &emsp; 패 : <input type="text" id="lose" name="lose" placeholder="0" disabled></td>
        </tr>
        </table>
        <table border="1" class="table2">
        <tr>
            <th>키</th>
            <td><input type="text" id="height" name="proHeight" required> cm</td>
            <th>몸무게</th>
            <td><input type="text" id="weight" name="proWeight" required> kg</td>
        </tr>
        <tr>
            <th colspan="4">공식대회</th>
        </tr>
        <tr>
            <td colspan="4"><textarea class="textarea" name="official" cols="35" rows="10" placeholder="빈체로대회에 도전해보세요" disabled></textarea></td>
        </tr>
        <tr>
            <th colspan="4">개인대회</th>
        </tr>
        <tr>
            <td colspan="4"><textarea class="textarea" name="personal" cols="35" rows="10" placeholder="ex) 용인대 35회 우승"></textarea></td>
        </tr>
        <tr>
            <th colspan="4">건강상태</th>
        </tr>
        <tr>
            <td colspan="4"><textarea class="textarea" name="note" cols="35" rows="10"  placeholder="응급상황을 위해서 작성해주세요!
            
ex) 어깨탈골,기흉" ></textarea></td>
        </tr>
        <tr>
            <th colspan="4">누적경고</th>
        </tr>
        <tr id="warn">
            <th>욕설</th>
            <td><input type="text" id="warn1" name="warn1" disabled placeholder="0"> 회</td>
            <th>지각</th>
            <td><input type="text" id="warn2" name="warn2" disabled placeholder="0"> 회</td>
        </tr>
        <tr>
            <th>룰 위반</th>
            <td><input type="text" id="warn3" name="warn3" disabled placeholder="0"> 회</td>
            <th>기타 비매너</th>
            <td><input type="text" id="warn4" name="warn4" disabled placeholder="0"> 회</td>
        </tr>
    </table>
    
    <br>
	    <button type="submit">등록</button>&emsp;
		<button onclick="goBack()">취소</button>&emsp;
		<button type="reset">초기화</button>
	</form>
</body>
<script>
  function goBack() {
    history.back();
  }
</script>
</html>