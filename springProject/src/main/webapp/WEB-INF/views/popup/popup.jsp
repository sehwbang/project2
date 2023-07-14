<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/popup.css">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="layerPopup" id="layer_popup" style="visibility: visible;">
		<div class="layerBox">
		<div class="popupTop">
			<h4 class="title">VINCERO EVENT</h4>
			<button type="button" id="close" onclick="closePop();">x</button>
		</div>
			<div class="cont">
					<img
						src="${pageContext.request.contextPath}/resources/img/popup/trophy.png"
						width=350 height=500 usemap="#popup" alt="event page">
			</div>
<!-- 			<form name="pop_form">
				
        <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
         <label for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label></div>
			</form> -->
		</div>
	</div>


</body>

<script>
	function closePop() {
		document.getElementById("layer_popup").style.visibility = "hidden";
	}
</script>
</html>