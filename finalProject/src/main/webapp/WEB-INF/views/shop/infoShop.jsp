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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body class="goto-here">
	<!-- 소개 페이지 START (크롤링? 단순히 나열?) -->
	<section class="pt-5 pb-5">
		<div class="container">
			<h2 class="display-5 mb-2 text-center">소개</h2>
			<div class="row w-100">
				<div class="col-lg-12 col-md-12 col-12">
					<div class="row">
						<!-- single -->
						<div class="col d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-single.html" class="block-20" style="background-image: url('resources/main/images/image_2.jpg');"> </a>
								<div class="text d-block pl-md-4">
									<h3 class="heading">
										<a href="#">이름</a>
									</h3>
									<p>1938년부터 담그시던 시어머니의 장을 이어받아 2006년부터 전통장 사업을 시작하게 된 이복순 대표는 돌댕이 석촌골을 창업하여 직접 담근 간장, 된장, 고추장으로 만든 맛깔스러운 절임음식과 정월에 풍년을 기원하며 먹던 이천의 향토음식 볏섬만두와 톡쏘는 맛이 일품인 게걸무를 이용한 요리를 개발하여 만들고 있다. 돌댕이 석촌골 이복순 사장은 우리가족이 먹는다는 마음으로 대부분의 식재료들을 직접 또는 지역 특산물을 사용하여 음식을 대접하고 있으며, 특히 특산물인 게걸무와 이천의 향토음식 볏섬만두를 보존하고 널리 알리기 위해 노력하고 있다.</p>
									<p>
										<a href="blog-single.html" class="btn btn-primary py-2 px-3">Link</a>
									</p>
								</div>
							</div>
						</div>
						<!-- single -->
						<div class="col d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-single.html" class="block-20" style="background-image: url('resources/main/images/image_2.jpg');"> </a>
								<div class="text d-block pl-md-4">
									<h3 class="heading">
										<a href="#">이름</a>
									</h3>
									<p>횡성군 오음산자락 산골에서 우리 풀꽃과 산야초, 유기농 식재료로 건강한 밥상을 차려내고 있습니다. 산골할매의 아침마다 만드는 손두부와 도토리묵, 아침에 채취한 풀꽃들은 정성가득 한끼 보약과 같은 음식을 만들어내며 지친 도시민들에게 따뜻한 정과 친구가 되어드리는 그런 산골 농가맛집을 운영합니다. 봄부터 민들레, 쑥, 냉이, 달래, 곤드레, 참취 등 맛집 주변의 지천으로 있는 산야초도 소개해드리고 먹는 방법과 요리법도 소개해드립니다. 절기마다 강원도 산골에서만 맛볼 수 있는 절기떡과 먹거리도 만나보실 수 있는 오음산 산야초밥상입니다.</p>
									<p>
										<a href="blog-single.html" class="btn btn-primary py-2 px-3">Link</a>
									</p>
								</div>
							</div>
						</div>
						<!-- single -->
						<div class="col d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-single.html" class="block-20" style="background-image: url('resources/main/images/image_2.jpg');"> </a>
								<div class="text d-block pl-md-4">
									<h3 class="heading">
										<a href="#">이름</a>
									</h3>
									<p>맘꽃이 위치한 이동면 묵리는 계곡과 산세가 어우러져 풍광이 아름다운 마을입니다. 엄마의 마음으로 정성스럽게 차린 한상 밥상이 건강을 꽃 피우듯 『맘꽃』에 오시는 손님들에게 정성을 다하고 있습니다. 맛집 곳곳에 다양한 형태의 작은 쉼터를 제공하여 볼거리가 다양하고 자연과 더불어 힐링하고 가실 수 있어서 더욱 높은 호응을 얻고 있습니다.</p>
									<p>
										<a href="blog-single.html" class="btn btn-primary py-2 px-3">Link</a>
									</p>
								</div>
							</div>
						</div>
						<!-- single -->
						<div class="col d-flex ftco-animate">
							<div class="blog-entry align-self-stretch d-md-flex">
								<a href="blog-single.html" class="block-20" style="background-image: url('resources/main/images/image_2.jpg');"> </a>
								<div class="text d-block pl-md-4">
									<h3 class="heading">
										<a href="#">이름</a>
									</h3>
									<p>「청산명가」 강선규 대표는 현재 갈월버섯농장(신북면)을 30년간 운영하고 있으며, 전국농업기술자협회 강사, 한국농수산대학 버섯학과 현장교수로 활동하고 있다. 또한 버섯기술재배와 관련하여 「낙면이용 느타리버섯재배방법」을 특허 출원하였다. 그리고 강우석 조리실장은 중국 충칭조리직업학교, 한국호텔전문학교를 졸업하고, 관련 자격증 취득 및 홍콩 호텔 근무경력으로 「청산명가」의 주방을 책임지고 있다.</p>
									<p>
										<a href="blog-single.html" class="btn btn-primary py-2 px-3">Link</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 소개 페이지 END -->
</body>
</html>