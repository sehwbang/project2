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
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.5231462, 126.9096533), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	<c:forEach items="${gymList}" var="gym">
		var address = "${gym.gymAddress}";
		console.log(address);	
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        
		        var marker = new kakao.maps.Marker({
			        map: map,
			        position: coords
			    });
			    
			    var overlay = new kakao.maps.CustomOverlay({
			        yAnchor: 3,
			        position: marker.getPosition()
			    });
		
/* 		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords); */
 
	
				var wrap = document.createElement('div');
				wrap.className = "wrap";
				
				var info = document.createElement('div');
				info.className = "info";
				
				wrap.appendChild(info);
				
				var title = document.createElement('div');
				title.className = "title";
				sometext = document.createTextNode("${gym.gymName}");
				
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
				
				var text = document.createTextNode("${gym.gymAddress} ${gym.gymDetailAddress}");
				
				ellipsis.appendChild(text);
				
				desc.appendChild(ellipsis);
				
				var jibun = document.createElement('div');
				jibun.className = "jibun-ellipsis";
				
				var text2 = document.createTextNode("(우) 63309 (지번) 영평동 2181");
				
				jibun.appendChild(text2);
				
				desc.appendChild(jibun);
				
				var footerDev = document.createElement('div');
				
				desc.appendChild(footerDev);
				
				var link = document.createElement('a');
				link.className = "link";
				
				var text3 = document.createTextNode("09:00, 10:00, 11:00, 11:00, 12:00");
				link.target = "_blank";
				link.href = "javascript:alertTest()";
				
				footerDev.appendChild(link);
		
				kakao.maps.event.addListener(marker, 'click', function() {
			        overlay.setMap(map);
			    });
	
				close.onclick = function() {
					overlay.setMap(null);
				} 
				
/* 		var positions = [
		    {
		        content: 
		        latlng: new kakao.maps.LatLng(37.5231462, 126.9096533)
		    },
		    {
		        title: '생태연못', 
		        latlng: new kakao.maps.LatLng(37.5249580, 126.9076628)
		    }
		]; */
		
		
/* 		positions.forEach(function (position) {
			console.log(position);
			var marker1 = new kakao.maps.Marker({
		        map: map,
		        position: position.latlng		        
		    });
			
		    var overlay1 = new kakao.maps.CustomOverlay({
		    	map: map,
		        position: marker1.getPosition()
		    });
		    
		    //overlay1.setContent(wrap);
		}); */
		
		
		
		
/*  		for(let i=0; i < positions.length; i++){
		    var data = positions[i];
		    console.log(data);
		    displayMarker(data);
		} */

			// 지도에 마커를 표시하는 함수입니다    
			function displayMarker(wrap) { 
				console.log("marker띄어줘");
				
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: coords
			    });
			    
			    var overlay = new kakao.maps.CustomOverlay({
			        yAnchor: 3,
			        position: marker.getPosition()
			    });
		    
/* 		    var content = document.createElement('div');
		    content.innerHTML =  '<div class="wrap">' + 
						        '    <div class="info">' + 
						        '        <div class="title">' + 
						        '            ${gym.gymName}' + 
						        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
						        '        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="/spring/resources/img/member.png" width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div class="ellipsis">${gym.gymAddress} ${gym.gymDetailAddress}</div>' + 
						        '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
						        '                <div><a href="javascript:alertTest()" class="link">09:00, 10:00, 11:00, 11:00, 12:00</a></div>' + 
						        '                <div><a href="javascript:alertTest()" class="link">13:00, 14:00, 15:00, 16:00, 17:00</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
		    content.style.cssText = 'background: white; border: 1px solid black'; */

				close.onclick = function() {
					overlay.setMap(null);
				} 
		    
		   /*  var closeBtn = document.createElement('button');
		    closeBtn.innerHTML = '닫기';
		    closeBtn.onclick = function () {
		        overlay.setMap(null);
		    }; */
		    //content.appendChild(closeBtn);
			    //overlay.setContent(wrap);
	
			    kakao.maps.event.addListener(marker, 'click', function() {
			        overlay.setMap(map);
			    });
			}
		
		
			    } 
		}); 
	</c:forEach>
		
		
		// 커스텀 오버레이 엘리먼트를 만들고, 컨텐츠를 추가합니다
/* 		var content = document.createElement('div');
		content.innerHTML = '<div class="wrap">' + 
					        '    <div class="info">' + 
					        '        <div class="title">' + 
					        '            ${gym.gymName}' + 
					        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
					        '        </div>' + 
					        '        <div class="body">' + 
					        '            <div class="img">' +
					        '                <img src="/spring/resources/img/member.png" width="73" height="70">' +
					        '           </div>' + 
					        '            <div class="desc">' + 
					        '                <div class="ellipsis">${gym.gymAddress} ${gym.gymDetailAddress}</div>' + 
					        '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
					        '                <div><a href="javascript:alertTest()" class="link">09:00, 10:00, 11:00, 11:00, 12:00</a></div>' + 
					        '                <div><a href="javascript:alertTest()" class="link">13:00, 14:00, 15:00, 16:00, 17:00</a></div>' + 
					        '            </div>' + 
					        '        </div>' + 
					        '    </div>' +    
					        '</div>'; 
*/

		// 커스텀 오버레이를 생성합니다 
/* 		var customoverlay = new kakao.maps.CustomOverlay({
		    map: map,
		    content: content,
		    position: new kakao.maps.LatLng(37.5231462, 126.9096533), // 지도의 중심좌표
		});*/
		
		function alertTest() {
			alert('haha~~');
		}

	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>