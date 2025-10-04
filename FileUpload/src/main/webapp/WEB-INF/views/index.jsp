<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="resources/index.js"></script>
</head>
<body>
	<div><h3>이미지 갤러리</h3></div>

	<div>
		<form action="upload" method="post" enctype="multipart/form-data">
			<div>
				<div><label>제목:</label></div>
				<div><input type="text" name="title"></div>
			</div>
			<div>
				<div><label>파일:</label></div>
				<div><input type="file" name="uploadFile"></div>
			</div>
			<div>
				<div><button>[FORM] 등록</button></div>
				<div><button type="button" id="upload">[AJAX] 등록</button></div>
			</div>
		</form>
	</div>
	
	<div><hr></div>
	
	<div>
		<div>
			<ul>
				<c:if test="${list.size() < 1}">
					<li>등록 된 이미지가 없습니다.</li>
				</c:if>
				
				<c:forEach var="item" items="${list}">
				
					<li>
						<div>${item.title}</div>
						<div><img src="upload/${item.uuid}_${item.filename}"></div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>