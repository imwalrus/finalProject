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
			<!-- 카드 -->
			<div class="row">
				<div class="col-sm-3">
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
				<div class="col-sm-3">
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
				<div class="col-sm-3">
					<div class="card">
						<div class="card-block">
							<div class="text-left report1-cont">
								<h2 class="font-light m-b-0" align="center">판매</h2>
								<h3 class="text-muted" align="center">
									<i class="ti-arrow-up text-success">￦ ${orderSum}(${order}건)</i>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="card">
						<div class="card-block">
							<div class="text-left report1-cont">
								<h2 class="font-light m-b-0" align="center">커뮤니티</h2>
								<h3 class="text-muted" align="center">
									<i class="ti-arrow-up text-success">${comm}건</i> 
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--***** REPORT-2 *****-->
			<div class="row" id="report2">
				<div class="col-md-6">
					<div class="card card-c1">
						<div class="card-header card-chart">
							<h4 class="title" align="center">일별 매출 건수</h4>
						</div>
						<div class="card-content" data-background-color="green">
                            <div class="ct-chart" id="weekChart" align="center"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card card-c1">
						<div class="card-header card-chart">
							<h4 class="title" align="center">월별 매출 건수</h4>
						</div>
						<div class="card-content" data-background-color="green">
                            <div class="ct-chart" id="monthChart" align="center"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
