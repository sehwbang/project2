<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	table {
		width: 100%;
	}
	td {
		width: 14%;
		height: 60px;
		text-align: center;
	}
</style>
<script>
	function redirectToToday() {
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();
		
		var url = "${pageContext.request.contextPath}/match/matchReg.ma?day=" + year + "-" + month + "-" + day;
		
		window.location.href = url;
	}
/* $(document).ready(function check_today(indexs, weeks, dates){
    if(dates > today_days){
        //인덱스가 오늘의 날짜보다 크다면(미래: 일정 추가 가능)
        weeks[indexs].style.backgroundColor = '#FFEFD5'; //CSS 불러오기
    } else if(dates == today_days){
         //인덱스가 오늘의 날짜와 같다면(현재: 일정 추가 가능)
         weeks[indexs].style.backgroundColor = '#DB7093'; //CSS 불러오기
    } else if(dates < today_days){
        //인덱스가 오늘의 날짜보다 작다면(지나온 날: 일정 추가 불가)
        weeks[indexs].style.backgroundColor = 'gray'; //CSS 불러오기
    }
} */
/*	$(document).ready(function getDayOfWeek(){ //ex) getDayOfWeek('2022-06-13')	
  		const sunday = new Date('2023-07-02');
 		const sunday2 = new Date('2023-07-02');
		console.log("날짜 : " + sunday.getDate());
		
		sunday2.setDate(sunday.getDate() + 7);
		
		console.log(sunday.getDate());
		console.log(sunday2.getDate()); */
/*
		const tomorrow = 0;
		tomorrow.setDate(today.getDate()+1);
		console.log(tomorrow);
		*/
		
/* 		function addDays(date, days) {
			console.log(date);
			console.log(date.getDate);
			
		  const sunday = new Date(date);
		  console.log(sunday);
		  
		  
		  //sunday.setDate(date.getDate() + days)
		  return sunday;
		}
		
		const sunday2 = addDays('2023-07-02', 7); */
/* 		
	    const week = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];   	    
	    const num = new Date().getDay();
	    console.log("요일 숫자로 : " + num);
	    
	    const dayOfWeek = week[num];
	    console.log(dayOfWeek);
	    
/* 	    const date = new Date().getDate();
	    console.log(date); 
	    
	    for(let i=0; i<7; i++) {
	    	switch(dayOfWeek) {
		    	case "sun":
				    $("#"+i).html(date);	
		    		break;
		    	case "mon":
				    $("#"+i).html(date);	
		    		break;
		    	case 2:
				    $("#"+i).html(date);			    
		    		break;
		    	case "wed":
				    $("#"+i).html(date);	
		    		break;
		    	case "thu":
				    $("#"+i).html(date);	
		    		break;
		    	case "fri":
				    $("#"+i).html(date);	
				    break;
		    	case "sat":
				    $("#"+i).html(date);	
				    break;
	    	}
	    }
	
	}); */
	
	
/* 	function getYoilDate() {
		let today = new Date();
		console.log("날짜 : " + today);
		
		console.log("요일 : " + getDayOfWeek(today));
		let yoil = today.getDay();
		console.log("숫자로 : " + yoil)
		return yoil;
	};
	
	var value = getYoilDate()
	$("#yoil").html(value); */
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div id="nav2">
	<div id="matching"></div>
	<div id="matching"></div>
	<div id="gym"><a onclick="redirectToToday();">매치 등록</a></div>
	<div id="gym"><a href="${pageContext.request.contextPath}/match/matchList.ma">상대방 찾기</a></div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>