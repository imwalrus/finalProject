<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body class="goto-here">
	<!-- footer 시작 -->
	<footer class="ftco-footer ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-around">
				<!-- 배너(하단 1, 2, 3) -->
				<c:forEach items="${applicationScope.banner}" var="banner1" begin="1" end="3" varStatus="status">
					<c:if test="${banner1.banner_check eq 0}">
						<div class="col-4">
							<div align="center">
								<a href="${banner1.banner_link}">
									<img src="resources/images/banner/${banner1.banner_filename}" style="max-width:190px;">
								</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</footer>
	<!-- footer 끝 -->
</body>
</html>