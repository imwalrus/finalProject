<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
</head>
<body>
	<section class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- 정보 -->
			<div class="row" id="report1">
				<div class="col">
					<div class="card">
						<div class="card-block">
							<div class="text-left report1-cont">
								<h2 class="font-light m-b-0" align="center">회원</h2>
								<h3 class="text-muted" align="center">
									<i class="ti-arrow-up text-success">${user}명</i>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-block">
							<div class="text-left report1-cont">
								<h2 class="font-light m-b-0" align="center">오프라인 교육</h2>
								<h3 class="text-muted" align="center">
									<i class="ti-arrow-up text-success">${edu}건</i>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-block">
							<div class="text-left report1-cont">
								<h2 class="font-light m-b-0" align="center">농촌속으로</h2>
								<h3 class="text-muted" align="center">
									<i class="ti-arrow-up text-success">${intoFarm}건</i>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-block">
							<div class="text-left report1-cont">
								<h2 class="font-light m-b-0" align="center">판매상품</h2>
								<h3 class="text-muted" align="center">
									<i class="ti-arrow-up text-success">${prod}건</i>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-block">
							<div class="text-left report1-cont">
								<h2 class="font-light m-b-0" align="center">커뮤니티</h2>
								<h3 class="text-muted" align="center">
									<i class="ti-arrow-up text-success">${comm}개</i>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 요일별 차트 -->
			<div class="row" id="report2">
				<div class="col-md-6">
					<div class="card card-c1">
						<div class="card-header card-chart">
							<h4 class="title" align="center">요일별 판매량</h4>
							<h6>(현재 날짜 기준)</h6>
						</div>
						<div class="card-content" data-background-color="green">
							<div class="ct-chart" id="weekChart"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card card-c2">
						<div class="card-header card-chart">
							<h4 class="title" align="center">요일별 매출액</h4>
							<h6>(현재 날짜 기준)</h6>
						</div>
						<div class="card-content" data-background-color="green">
							<div class="ct-chart" id="weekSumChart"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 월별 차트 -->
			<div class="row" id="report3">
				<div class="col">
					<div class="card card-c1">
						<div class="card-header card-chart">
							<h4 class="title" align="center">월별 판매량</h4>
							<h6>(현재 월 기준)</h6>
						</div>
						<div class="card-content" data-background-color="green">
							<div class="ct-chart" id="monthChart"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 월별 차트 -->
			<div class="row" id="report4">
				<div class="col">
					<div class="card card-c1">
						<div class="card-header card-chart">
							<h4 class="title" align="center">월별 매출액</h4>
							<h6>(현재 월 기준)</h6>
						</div>
						<div class="card-content" data-background-color="green">
							<div class="ct-chart" id="monthSumChart"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
