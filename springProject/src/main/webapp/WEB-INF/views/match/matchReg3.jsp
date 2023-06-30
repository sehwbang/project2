<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1a1baddfc194b964c714fcbe3f6d1aa&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/match/matchReg.css?v=<%=System.currentTimeMillis()%>">

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
	<table>
		<tr>
			<th>아아</th>
		</tr>
		<c:forEach items="${gymList}" var="gym">
			<tr>
		        <td>${gym.gymName}</td>
			</tr>
		</c:forEach>
	</table>
</div>


<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:70%; height:350px; float:left;"></div>
<div style="width:30%; height:350px; float:left;">
	<form>
		<table>
			<thead></thead>
			<tbody id="register">
			</tbody>
			<tfoot>
				<tr>
					<td><button type="button" onclick="registerMatch();">등록하기</button></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.5231462, 126.9096533), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
 	<c:forEach items="${scheduleList}" var="schedule">
		var address = "${schedule.gymAddress}";
		console.log(address);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		console.log("주소-좌표 변환 객체 생성");
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${schedule.gymAddress}", function(result, status) {
		console.log("주소-좌표 검색 함수");	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				console.log("검색 완료됐으면");
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        var marker = new kakao.maps.Marker({
			        map: map,
			        position: coords
			    });
			    
			    var overlay = new kakao.maps.CustomOverlay({		
			        yAnchor: 3,
			        position: marker.getPosition()
			    });
				console.log("overlay밑");
					
	
				var wrap = document.createElement('div');
				wrap.className = "wrap";
				
				var info = document.createElement('div');
				info.className = "info";
				
				wrap.appendChild(info);
				
				var title = document.createElement('div');
				title.className = "title";
				sometext = document.createTextNode("${schedule.gymName}");
				
				title.appendChild(sometext);
				info.appendChild(title);
				
				var close = document.createElement('div');
				close.className = "close";
				close.title = "닫기";
				
				title.appendChild(close);
				
				var body = document.createElement('div');
				body.className = "body";
				info.appendChild(body);
				
				var imgDiv = document.createElement('div');
				imgDiv.className="img";
				body.appendChild(imgDiv);
				
				var img = document.createElement('img');
				img.className = "img";
				img.src = "/spring/resources/img/member.png";
				img.width = "73";
				img.height = "70";
				imgDiv.appendChild(img);
				
				var desc = document.createElement('div');
				desc.className = "desc";
				body.appendChild(desc);
				
				var ellipsis = document.createElement('div');
				ellipsis.className = "ellipsis";
				
				var text = document.createTextNode("${schedule.gymAddress}");
				
				ellipsis.appendChild(text);
				
				desc.appendChild(ellipsis);
				
				/////////////////////////////////////////////////////////////////
				var jibun = document.createElement('div');
				jibun.className = "jibun-ellipsis";
				
				var text2 = document.createTextNode("${schedule.gymDetailAddress}");
				console.log("text2까지 옴");
				
				jibun.appendChild(text2);
				
				desc.appendChild(jibun);
				
				/////////////////////////////////////////////////////////////////
				
					var footerDev = document.createElement('div');
					desc.appendChild(footerDev);
				<c:forEach items="${schedule.matchTimeList}" var="time" varStatus="status">
					console.log(${time});
					
					var link${status.index} = document.createElement('a');
					link${status.index}.className = "link";
					
					var text${status.index} = document.createTextNode("${time} ");
					//link.target = "_blank";
					link${status.index}.href = "javascript:setSchedule('${schedule.gymNo}', '${schedule.code}', '${schedule.matchdate}', '${time}')";
					
					link${status.index}.appendChild(text${status.index});
					
					footerDev.appendChild(link${status.index});					
				</c:forEach>
				
				
				///////////////////////////////////////////////////////////////////
				
				//var link2 = document.createElement('a');
				//link2.className = "link";
				
				//var text4 = document.createTextNode("1000");
				//link.target = "_blank";
				//link2.href = "javascript:alertTest('2', '용인대유도', 'user01,20230625,1000')";
				
				//link2.appendChild(text4);
				
				//footerDev.appendChild(link2);
				
				

				
				console.log("커스텀오버레이 다 그림");
		

	
				console.log("오버레이 띄워줘");
				
				overlay.setContent(wrap);
				
				kakao.maps.event.addListener(marker, 'click', function() {
			        overlay.setMap(map);
			    });
				
				close.onclick = function() {
					overlay.setMap(null);
				}
			}
		}); 
	</c:forEach>
		
	////////////////////////////////////////////////////////////////////////	
		
		var matchList = [];
		
		function setSchedule(gymNo, code, matchdate, time) {
			//if문으로 담았는지 조건 체크해야 함
			//없으면 담아주고, 화면에 띄우기
			//있으면 alert창 경고
	
			if(matchList.includes(code)) {
				alert("이미 담겨있습니다.");
			} else {
				//let sum = gymNo + "," + gymName + "," + code;
				//console.log(code);
				
				let dt = code.slice(-12, -4);
				console.log("8글자 : " + dt);
				
				let year = dt.slice(0, 4);
				console.log("년 : " + year);

				let month = dt.slice(4, 6);
				console.log("월 : " + month);
				
				let day = dt.slice(6, 8);
				console.log("일 : " + day);
	
				let fulldate = year + "/" + month + "/" + day;
				console.log(fulldate);
								
				function getDayOfWeek(fulldate){ //ex) getDayOfWeek('2022-06-13')
				    const week = ['일', '월', '화', '수', '목', '금', '토'];
				    const dayOfWeek = week[new Date(fulldate).getDay()];
				    console.log("요일 : " + dayOfWeek);
				    
				    return dayOfWeek;
				}
				
				let yoil = getDayOfWeek(fulldate);
				
				let tm = code.slice(-4);
				console.log(tm);
				
				let si = tm.slice(0, 2);
				console.log(si);
				
				let bun = tm.slice(2, 4);
				console.log(bun);
				
				let sum = month + "월" + day + "일" + "(" + yoil + ")" + si + ":" + bun;
					
				let content = $("#register").html();
					content += "<tr id='"+ code + "'>"
							+ 	"<td>" + sum + "</td>"
							+ 	"<td><button type='button' style='align:right;' onclick='deleteTime(`"+ code +"`);'>삭제</button></td>"
							+  "</tr>";
								
				console.log("content에 있는 내용 : " + content);
				
				//document.getElementById("register").value = content;
				$("#register").html(content);
				
				console.log("table안에 들어갈 내용 : " + content);
				
				matchList.push(code);
				
				console.log("matchList에 담겨 있는 리스트 : " + matchList);
			
			}
			/* matchList.put(ddd);
			matchList.put(ddd); */
		}
		
		function deleteTime(code) {
			alert('code=' + code);
			$("#"+code).remove();
		}

		function registerMatch() {
			console.log(matchList);
			//alert('hoho~~2');
 			$.ajax({
				url: "${pageContext.request.contextPath}/match/register.do",
				type: "post",
				data:  JSON.stringify(matchList),
				dataType: "JSON",
		        contentType : "application/json",
				susscess(data) {
					console.log(data);
				},
				error : function() {
					console.log("ajax 통신 실패!")
				}
			});
		}
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>