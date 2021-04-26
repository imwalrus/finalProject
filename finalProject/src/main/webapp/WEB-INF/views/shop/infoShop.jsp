<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script>
	// 페이징 active 적용
	$(document).ready(function() {
		var url = window.location.href.substr(window.location.href.lastIndexOf('?') + 5);
		var pagSize = $("input[name='cnt']").length;
		var pag = new Array(pagSize);
		for(var i = 0; i < pagSize; i++){ 
			pag[i] = $("input[name='cnt']").eq(i).val();
			if(url == pag[i]) {
				$("input[value=1]").removeClass('active');
				$("input[value=" + pag[i] + "]").addClass('active');
			}
	 	}
	});
</script>
</head>
<body class="goto-here">
	<!-- 소개 페이지 START -->
	<section class="pt-4 pb-4">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="row">
						<!-- single -->
						<c:forEach items="${list}" var="list">
							<div class="col-sm-6 col-md-6 col-lg-4">
								<div class="product" >
									<a href="http://www.nongsaro.go.kr${list.farmBaro}" class="img-prod">
										<!-- 이미지 -->
										<img class="img-fluid" src="http://www.nongsaro.go.kr${list.img}" alt="Colorlib Template">
									</a>
									<div class="text py-3 pb-4 px-3 text-center">
										<h3>
											<!-- 이름 -->
											<a href="http://www.nongsaro.go.kr${list.farmBaro}">${list.name}</a>
										</h3>
										<div class="d-flex">
											<div class="pricing">
												<!-- 가격 -->
												<p class="price">
													<span class="price-sale">￦ ${list.price}</span>
												</p>
											</div>
										</div>
										<div class="bottom-area d-flex px-3">
											<div class="m-auto d-flex">
												<!-- 상세 페이지 이동 -->
												<a href="http://www.nongsaro.go.kr${list.farmBaro}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
													<i class="material-icons zoom_in">&#xe8ff;</i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row mt-5">
						<div class="col text-center">
							<form action="infoShop" id="infoShop">
								<input type="submit" class="btn btn-primary active" name="cnt" value="1">
								<input type="submit" class="btn btn-primary" name="cnt" value="2">
								<input type="submit" class="btn btn-primary" name="cnt" value="3">
								<input type="submit" class="btn btn-primary" name="cnt" value="4">
								<input type="submit" class="btn btn-primary" name="cnt" value="5">
								<input type="submit" class="btn btn-primary" name="cnt" value="6">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 소개 페이지 END -->
</body>
</html>