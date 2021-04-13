<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Ablepro v8.0 bootstrap admin template by Phoenixcoded</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
									<i class="ti-arrow-up text-success"></i> ${user}명
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
									<i class="ti-arrow-up text-success"></i> ${intoFarm}건
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
									<i class="ti-arrow-up text-success"></i> ${order}건
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
									<i class="ti-arrow-up text-success"></i> ${comm}건
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--***** REPORT-2 *****-->
			<div class="row" id="report2">
				<div class="col-md-4">
					<div class="card card-c1">
						<div class="card-header card-chart" data-background-color="green">
							<canvas class="ct-chart" id="myChart1" height="250"></canvas>
						</div>
						<div class="card-content">
							<h4 class="title">Daily Sales</h4>
							<p class="category">
								<span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.
							</p>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="fa fa-clock-o"></i> updated 4 minutes ago
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-c1">
						<div class="card-header card-chart" data-background-color="orange">
							<canvas class="ct-chart" id="myChart2" height="250"></canvas>
						</div>
						<div class="card-content">
							<h4 class="title">Email Subscriptions</h4>
							<p class="category">Last Campaign Performance</p>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="fa fa-clock-o"></i> campaign sent 2 days ago
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-c1">
						<div class="card-header card-chart" data-background-color="red">
							<canvas class="ct-chart" id="myChart3" height="250"></canvas>
						</div>
						<div class="card-content">
							<h4 class="title">Completed Tasks</h4>
							<p class="category">Last Campaign Performance</p>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="fa fa-clock-o"></i> campaign sent 2 days ago
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
