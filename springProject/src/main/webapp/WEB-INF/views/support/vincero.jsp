<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
        margin: 0 auto; 
        padding: 0; 
        list-style: none; 
        text-decoration:none; 
        color:black;
    }
    .logo {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        flex-wrap: nowrap;
        margin-top: 100px;
    }
    .howTo {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 100px;
        margin-bottom: 80px;
    }
    footer {
        margin-top: 40px; 
        background-color:rgb(247, 247, 255); 
        align-items: center; 
        display: flex;
    }
    li {
        margin-top: 20px; 
        /*float: left; 
        margin-left: 30px;*/
    }
    p {
        float:left; 
        margin-top: 15px; 
        margin-bottom: 20px;
    }
    @font-face {
        font-family: 'SBAggroB';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    @font-face {
        font-family: 'EliceDigitalBaeum-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    h2 {
        font-family: EliceDigitalBaeum-Bd;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<a href="${pageContext.request.contextPath}/gym/joinEnrollPage.gym">체육관등록</a>
    <div class="logo">
        <div style="margin-left: 450px;">
            <img src="${pageContext.request.contextPath}/resources/img/icon.png" width="300px" height="300px">
        </div>
        <div style="margin-top: 60px; margin-right: 300px;">
            <h2>빈체로(vincero)란 이탈리아어로 승리하다, 이길것이다 라는 <br>
                뜻을 대련을 통하여 원하는 목적을 얻고승리하기를 원한다.</h2>
        </div>
    </div>
    <div class="howTo">
        <h1 style="margin-bottom: 40px;">HOW TO</h1>
        <img src="${pageContext.request.contextPath}/resources/img/flow.jpg">
    </div>
    <div class="logo">
        <h2 style="text-align: center; margin-top: 100px; margin-left: 300px;">싸움이 목적이 아닌 자신의 기술을 시험해보고 대련을 <br>
            통하여 자신의 수준을 평가가 목적이다.</h2>
        <img style="margin-right: 450px;" src="${pageContext.request.contextPath}/resources/img/kickboxing.jpg">
    </div>
    <div class="logo">
        <img style="margin-left: 300px;" src="${pageContext.request.contextPath}/resources/img/medal.jpg">
        <h2 style="text-align: center; margin-top: 100px; margin-right: 300px; ">대련을 목적으로 격투 기술을 연습하기 위한것으로 부상을 <br>
            만드는것이 아닌 안정을 최우선으로 실행합니다.</h2>
    </div>
    <div class="logo">
        <h2 style="text-align: center; margin-top: 100px; margin-left: 200px;">보호장비를 착용하고 미리 정해진 규칙과 제한사항에 따라 진행!</h2>
        <img style="margin-right: 300px" src="${pageContext.request.contextPath}/resources/img/headgear.jpg" width="600px" height="300px">
    </div>
    <footer> 
        <ul>
            <li><a href="#">법적고지</a></li>
            <li><a href="#">개인정보취급방침</a></li>
            <li><a href="#">개인정보처리방침</a></li>
        </ul>
        <p>
            상호명:빈체로<br>
            대표자:???<br>
            개인정보관리책임자:???<br>
            상담전화:1234-1234<br>
            찾아오는길 : ???<br>
            E-mail : contact@vincero.com <br>
            사업자 번호 789-81-77777
        </p>
    </footer>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>