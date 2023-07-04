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
	<div id="gym"><a href="${pageContext.request.contextPath}/match/matchReg.ma">매치 등록</a></div>
	<div id="gym"><a href="${pageContext.request.contextPath}/match/matchList.ma">상대방 찾기</a></div>
</div>

<div>
	<table border="1">
<!-- 		<tr>
			<td>
				<p>일</p>
				<span id="sun"></span>
			</td>
			<td>
				<p>월</p>
				<span id="mon"></span>
			</td>
			<td>
				<p>화</p>
				<span id="tue"></span>
			</td>
			<td>
				<p>수</p>
				<span id="wed"></span>
			</td>
			<td>
				<p>목</p>
				<span id="thu"></span>
			</td>
			<td>
				<p>금</p>
				<span id="fri"></span>
			</td>
			<td>
				<p>토</p>
				<span id="sat"></span>
			</td>
		</tr> -->
		<c:forEach items="dateFilter" var="dates" varStatus = "d">
	 		<tr>
				<td>${d.index}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>