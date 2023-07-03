<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상세보기" name="title"/>
</jsp:include>
<div id="container">
		<table id="detailTable">
			<tr>
				<th>제목</th>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${notice.noticeWriter}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${not empty notice.originalFilename}">
						<button type="button" class="btn btn-outline-secondary"
							onclick="location.href='${pageContext.request.contextPath}/support/fileDownload.su?noticeNo=${notice.noticeNo}'">${notice.originalFilename}</button>
					</c:if>
					<c:if test="${empty notice.originalFilename}">
						파일없음
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="50" cols="100" required>${notice.content}</textarea>
				</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${notice.count}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${notice.createDate}</td>
			</tr>
		</table>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>