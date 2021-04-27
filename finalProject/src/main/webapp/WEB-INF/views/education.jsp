<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>청년농장</title>
<script>
/**
 * 다음 단계
 */
function fnNextStep(step) {
	
	var nowSeq = $(".stepArea").index($(".stepArea:visible"));
	
	$(".stepArea:eq(" + nowSeq + ")").hide();
	$(".stepArea:eq(" + (step - 1) + ")").show();
	
	if(step == 1){
		$("input:radio").attr("checked", false);
	}
}


/**
 * 설문 합계
 */
function fnSumPoint() {
	
	var questionSize = $(".base_boardlist").length;
	var questionAreaObj = $(".base_boardlist");
	var totalSumPoint = 0;
	questionAreaObj.each(function(i){
		
		var checkedQuestion = $(this).find("input:radio:checked");
		var sumPoint = 0;
		var numToEng = "";
		
		checkedQuestion.each(function(){
			sumPoint = sumPoint + Number($(this).val());
		});
		
		totalSumPoint = totalSumPoint + sumPoint;
		
		if(i == 0){
			numToEng = "A";
		}else if(i == 1){
			numToEng = "B";
		}else if(i == 2){
			numToEng = "C";
		}else if(i == 3){
			numToEng = "D";
		}else if(i == 4){
			numToEng = "E";
		}else if(i == 5){
			numToEng = "F";
		}
		
		$("#testStep3Area table").find("td[name='ans0" + (i + 1) + "']").html(sumPoint);
		$("#testStep3Area table").find("span.colorange").text(totalSumPoint);
		
		if(totalSumPoint <= 74){
			$("#testStep3Area").find(".selftext04").text("귀농하기까지 갖추어야 할 것이 많이 남아 있지만, 장기적인 계획을 갖고 교육기관이나 전문가와의 상담을 통해 준비를 해 나간다면 좋은 성과들이 나타날 것입니다. 귀농선배들로부터 체험담을 듣거나, 농촌체험과정을 통해 귀농비전을 세워 보시기 바랍니다. 농업의 비전을 명확히 하고, 자신의 스타일에 맞는 농업이 나 자신에게 지금 무엇이 필요한지를 확인할 필요가 있습니다.");
			$("#testStep3Area").find(".score").text("30 ~ 74");
		}else if(totalSumPoint >= 75 && totalSumPoint <= 119){
			$("#testStep3Area").find(".selftext04").text("귀농에 대한 기본적인 이해도나 적응 준비는 되어 있다고 생각됩니다. 목표가 명확해지면 귀농에 대한 망설임이 보다 명확해질 거라고 봅니다. 주말농장경험, 단기 연수과정 등을 통해 스스로 확인하고 자신감을 높여 보시기 바랍니다. 지식으로는 어느 정도 알고 있는 부분도 있지만, 새롭게 배운다는 적극적인 자세로 농촌의 특성을 잘 파악하여 준비를 하신다면 충분히 가능할 것입니다. \"천 리길도 한 걸음 부터\" 라는 여유로운 마음으로 차분하게 준비하세요.");
			$("#testStep3Area").find(".score").text("75 ~ 119");
		}else if(totalSumPoint >= 120){
			$("#testStep3Area").find(".selftext04").text("귀농에 대한 적응력이나 의욕, 준비정도가 상당히 높은 것으로 판단되어지며, 귀농조건은 일단 갖추어졌다고 보여 집니다. 귀농에 성공하기 위해서는 귀농선배들을 통한 체험담뿐만이 아니라 실제 연수과정이나 농촌체험을 통해 귀농에 대한 지식을 높여 가시기 바랍니다. 또한 각종 지원제도 등도 변경되거나 신설되어 시행되는 경우도 있으므로 늘 염두에 두시고, 농촌에 들어가셔서 처음 알게 되는 일들도 아주 많을 것이므로 농촌생활도 영농의 일부라는 생각으로 준비해 가시기 바랍니다.");
			$("#testStep3Area").find(".score").text("120 ~ 150");
		}
		
	});
	
}



/**
 * 다음 질문
 */
function fnNextQuestion() {
	
	var nowSeq = $(".base_boardlist").index($(".base_boardlist:visible"));
	var checkBoxGroupSize = $(".base_boardlist:eq(" + nowSeq + ")").find(".chkbgcol01").closest("tr").length;
	var checkBoxObjGroup = $(".base_boardlist:eq(" + nowSeq + ")").find(".chkbgcol01").closest("tr");
	var checkBoxObjFlag = false;
	
	checkBoxObjGroup.each(function(){
		
		var checkBoxObj = $(this).find("input:radio");
		var checkBoxObjCnt = 0;
		
		checkBoxObj.each(function(){
			if($(this).is(":checked")){
				checkBoxObjCnt++;
			}
		});
		if(checkBoxObjCnt == 0){
			$.alert({message : "모든 문항에 응답해주세요."});
			checkBoxObjFlag = true;
			return false;
		}
		
	});
	
	if(checkBoxObjFlag) return false;
	
	if($(".base_boardlist").length == (nowSeq+1)){				//문항 선택 종료
		console.log('선택종료');
		fnNextStep(3);
		fnSumPoint();
		
		$(".base_boardlist:eq(" + nowSeq + ")").hide();
		$(".base_boardlist:eq(0)").show();
		
	}
	
	$(".base_boardlist:eq(" + nowSeq + ")").hide();
	$(".base_boardlist:eq(" + (nowSeq + 1) + ")").show();
	
}

// 시연시 빠르게 결과 표시 하기 위한 JS (시연 후 삭제바람)
$(document).ready(function(){
	$('.input_radios').on("click", function (){
		$('.input_radios').attr('checked', true);
	});
});

 
</script>
<style>
.te_left { 
          text-align: left;
         }
.selftitle01 {
             list-style-type: none;
             font-size: 35px;
             color: #00cc99;
             margin-bottom:30px;
             }
.selftext01 {
            list-style-type: none;
            font-size: 20px;
            }
.selftext04 {
            list-style-type: none;
            font-size: 20px;
            margin-bottom:5px;
            }
.score      {
            list-style-type: none;
            font-size: 37px;
            color: #006600;
            margin-bottom:20px;
            }   
.stepArea {
          border: 1px solid #00cc99;
          padding:40px;
          }     
</style>

</head>
<body class="goto-here">
    <div class="hero-wrap hero-bread" style="background-image: url('resources/main/images/farm.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"></span><span>YOUTH FARM</span></p>
            <h1 class="mb-0 bread" style="font-size:50px !important;">귀농 적성 체크리스트</h1>
          </div>
        </div>
      </div>
    </div>
   
    
     <section class="ftco-section testimony-section">
     <div align="center" style="margin-left:400px; margin-right:400px;">
	<!-- 	내용 시작 -->
<div class="contentfullwrap">
	<div class="contentwrap">
	
	
		<!-- 내용시작 -->
		<!-- 1단계 -->
		<div class="stepArea" id="testStep1Area">
			<div class="selfWrap mt30">
				<div class="selfBox02">
					<ul>
						<li class="selftitle01">귀농귀촌 <span>준비도 리스트</span></li>
						<li class="selftext01">다음은 내가 귀농·귀촌에 어느정도 준비되어 있는지를 알아보는 적용테스트 입니다.<br />
							각각의 문항에서 자신이 해당하는 항목에 체크해 주세요. <br />
							체크된 점수를 합산하여 자신의 준비 정도를 파악해 보실 수 있습니다.
						</li>
					</ul><br/>
				 <div><a href="#none" onClick="fnNextStep(2);" class="btn btn-success">시작하기</a></div>
				</div>
			</div>
		</div>
		<!-- 1단계 -->
		
		<!-- 2단계 -->
		<div class="base_boardwrap mt30 stepArea" id="testStep2Area" style="display:none">
			<div class="base_boardlist03">
				<div class="texthide"></div>
				<table border="1" style ="table-layout: auto; width: 100%; summary="귀농귀촌 준비도 테스트 평가기준(점수)입니다.">
					<colgroup>
						<col style="width:50%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
					</colgroup>
					<tbody>
					<thead>
						<tr>
							<th style="padding:33px;  text-align: center;" rowspan="2" class="tblvalign" scope="col">평가점수</th>
							<th scope="col" style="text-align: center;">매우 긍정</th>
							<th scope="col" style="text-align: center;">긍정</th>
							<th scope="col" style="text-align: center;">보통</th>
							<th scope="col" style="text-align: center;">부정</th>
							<th scope="col" style="text-align: center;">매우 부정</th>
						</tr>
						<tr>
							<td style="text-align: center;">5점</td>
							<td style="text-align: center;">4점</td>
							<td style="text-align: center;">3점</td>
							<td style="text-align: center;">2점</td>
							<td style="text-align: center;">1점</td>
						</tr>
					 </thead>
					</tbody>
				</table>
			</div><br/>
			
			<!-- A -->
			<div class="base_boardlist mt15">
				<div class="texthide"></div>
				<table class="table table-hover" summary="귀농귀촌 준비도 테스트 평가기준 항목입니다.">
					<colgroup>
						<col style="width:50%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">진단(A) 영농에 대한 적성</th>
							<th scope="col">5점</th>
							<th scope="col">4점</th>
							<th scope="col">3점</th>
							<th scope="col">2점</th>
							<th scope="col">1점</th>
						</tr>
					</thead>
					<tbody>
					<thead>
						<tr>
							<td class="te_left chkbgcol01" scope="row" width="80">1. 건강 및 체력에 자신 있다.</td>
							<td><label for="que111" class="selfhidden">5점</label><input type="radio" id="que111" name="que11" class="input_radios" value="5" /></td>
							<td><label for="que112" class="selfhidden">4점</label><input type="radio" id="que112" name="que11" class="input_radios" value="4" /></td>
							<td><label for="que113" class="selfhidden">3점</label><input type="radio" id="que113" name="que11" class="input_radios" value="3" /></td>
							<td><label for="que114" class="selfhidden">2점</label><input type="radio" id="que114" name="que11" class="input_radios" value="2" /></td>
							<td><label for="que115" class="selfhidden">1점</label><input type="radio" id="que115" name="que11" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">2. 동식물을 좋아한다.</td>
							<td><label for="que121" class="selfhidden">5점</label><input type="radio" id="que121" name="que12" class="input_radios" value="5" /></td>
							<td><label for="que122" class="selfhidden">4점</label><input type="radio" id="que122" name="que12" class="input_radios" value="4" /></td>
							<td><label for="que123" class="selfhidden">3점</label><input type="radio" id="que123" name="que12" class="input_radios" value="3" /></td>
							<td><label for="que124" class="selfhidden">2점</label><input type="radio" id="que124" name="que12" class="input_radios" value="2" /></td>
							<td><label for="que125" class="selfhidden">1점</label><input type="radio" id="que125" name="que12" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">3. 단순 작업도 기분 좋게 한다.</td>
							<td><label for="que131" class="selfhidden">5점</label><input type="radio" id="que131" name="que13" class="input_radios" value="5" /></td>
							<td><label for="que132" class="selfhidden">4점</label><input type="radio" id="que132" name="que13" class="input_radios" value="4" /></td>
							<td><label for="que133" class="selfhidden">3점</label><input type="radio" id="que133" name="que13" class="input_radios" value="3" /></td>
							<td><label for="que134" class="selfhidden">2점</label><input type="radio" id="que134" name="que13" class="input_radios" value="2" /></td>
							<td><label for="que135" class="selfhidden">1점</label><input type="radio" id="que135" name="que13" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">4. 사교성이 좋다.</td>
							<td><label for="que141" class="selfhidden">5점</label><input type="radio" id="que141" name="que14" class="input_radios" value="5" /></td>
							<td><label for="que142" class="selfhidden">4점</label><input type="radio" id="que142" name="que14" class="input_radios" value="4" /></td>
							<td><label for="que143" class="selfhidden">3점</label><input type="radio" id="que143" name="que14" class="input_radios" value="3" /></td>
							<td><label for="que144" class="selfhidden">2점</label><input type="radio" id="que144" name="que14" class="input_radios" value="2" /></td>
							<td><label for="que145" class="selfhidden">1점</label><input type="radio" id="que145" name="que14" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">5. 사무실보다 야외에서 일하는 게 좋다.</td>
							<td><label for="que151" class="selfhidden">5점</label><input type="radio" id="que151" name="que15" class="input_radios" value="5" /></td>
							<td><label for="que152" class="selfhidden">4점</label><input type="radio" id="que152" name="que15" class="input_radios" value="4" /></td>
							<td><label for="que153" class="selfhidden">3점</label><input type="radio" id="que153" name="que15" class="input_radios" value="3" /></td>
							<td><label for="que154" class="selfhidden">2점</label><input type="radio" id="que154" name="que15" class="input_radios" value="2" /></td>
							<td><label for="que155" class="selfhidden">1점</label><input type="radio" id="que155" name="que15" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">6. 혼자보다 여럿이 일하는 것에 더 보람과 흥미를 느낀다.</td>
							<td><label for="que161" class="selfhidden">5점</label><input type="radio" id="que161" name="que16" class="input_radios" value="5" /></td>
							<td><label for="que162" class="selfhidden">4점</label><input type="radio" id="que162" name="que16" class="input_radios" value="4" /></td>
							<td><label for="que163" class="selfhidden">3점</label><input type="radio" id="que163" name="que16" class="input_radios" value="3" /></td>
							<td><label for="que164" class="selfhidden">2점</label><input type="radio" id="que164" name="que16" class="input_radios" value="2" /></td>
							<td><label for="que165" class="selfhidden">1점</label><input type="radio" id="que165" name="que16" class="input_radios" value="1" /></td>
						</tr>
					</thead>
					</tbody>
				</table>
			</div>
			<!-- A -->
			
			<!-- B -->
			<div class="base_boardlist mt15" style="display:none">
				<div class="texthide"></div>
				<table class="table table-hover" summary="귀농귀촌 준비도 테스트 평가기준 항목입니다.">
					<colgroup>
						<col style="width:50%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">진단(B) 영농에 대한 의욕, 동기, 지식</th>
							<th scope="col">5점</th>
							<th scope="col">4점</th>
							<th scope="col">3점</th>
							<th scope="col">2점</th>
							<th scope="col">1점</th>
						</tr>
					</thead>
					<tbody>
					<thead>
						<tr>
							<td class="te_left chkbgcol01" scope="row">1.농업을 직업으로 선택했다.</td>
							<td><label for="que211" class="selfhidden">5점</label><input type="radio" id="que211" name="que21" class="input_radios" value="5" /></td>
							<td><label for="que212" class="selfhidden">4점</label><input type="radio" id="que212" name="que21" class="input_radios" value="4" /></td>
							<td><label for="que213" class="selfhidden">3점</label><input type="radio" id="que213" name="que21" class="input_radios" value="3" /></td>
							<td><label for="que214" class="selfhidden">2점</label><input type="radio" id="que214" name="que21" class="input_radios" value="2" /></td>
							<td><label for="que215" class="selfhidden">1점</label><input type="radio" id="que215" name="que21" class="input_radios" value="1" /></td>
						</tr>
						
						<tr>
							<td class="te_left chkbgcol01" scope="row">2.영농 경험자와 만나서 체험담을 직접 들은 적이 있다.</td>
							<td><label for="que221" class="selfhidden">5점</label><input type="radio" id="que221" name="que22" class="input_radios" value="5" /></td>
							<td><label for="que222" class="selfhidden">4점</label><input type="radio" id="que222" name="que22" class="input_radios" value="4" /></td>
							<td><label for="que223" class="selfhidden">3점</label><input type="radio" id="que223" name="que22" class="input_radios" value="3" /></td>
							<td><label for="que224" class="selfhidden">2점</label><input type="radio" id="que224" name="que22" class="input_radios" value="2" /></td>
							<td><label for="que225" class="selfhidden">1점</label><input type="radio" id="que225" name="que22" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">3.농사의 어려움을 직접 체험한 적이 있다.</td>
							<td><label for="que231" class="selfhidden">5점</label><input type="radio" id="que231" name="que23" class="input_radios" value="5" /></td>
							<td><label for="que232" class="selfhidden">4점</label><input type="radio" id="que232" name="que23" class="input_radios" value="4" /></td>
							<td><label for="que233" class="selfhidden">3점</label><input type="radio" id="que233" name="que23" class="input_radios" value="3" /></td>
							<td><label for="que234" class="selfhidden">2점</label><input type="radio" id="que234" name="que23" class="input_radios" value="2" /></td>
							<td><label for="que235" class="selfhidden">1점</label><input type="radio" id="que235" name="que23" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">4.가족과 함께 생활하면서 일하고 싶다.</td>
							<td><label for="que241" class="selfhidden">5점</label><input type="radio" id="que241" name="que24" class="input_radios" value="5" /></td>
							<td><label for="que242" class="selfhidden">4점</label><input type="radio" id="que242" name="que24" class="input_radios" value="4" /></td>
							<td><label for="que243" class="selfhidden">3점</label><input type="radio" id="que243" name="que24" class="input_radios" value="3" /></td>
							<td><label for="que244" class="selfhidden">2점</label><input type="radio" id="que244" name="que24" class="input_radios" value="2" /></td>
							<td><label for="que245" class="selfhidden">1점</label><input type="radio" id="que245" name="que24" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">5.자연재해 등 요인으로 수확이 뜻대로 되지 않는 것을 알고 있다.</td>
							<td><label for="que251" class="selfhidden">5점</label><input type="radio" id="que251" name="que25" class="input_radios" value="5" /></td>
							<td><label for="que252" class="selfhidden">4점</label><input type="radio" id="que252" name="que25" class="input_radios" value="4" /></td>
							<td><label for="que253" class="selfhidden">3점</label><input type="radio" id="que253" name="que25" class="input_radios" value="3" /></td>
							<td><label for="que254" class="selfhidden">2점</label><input type="radio" id="que254" name="que25" class="input_radios" value="2" /></td>
							<td><label for="que255" class="selfhidden">1점</label><input type="radio" id="que255" name="que25" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">6.농업은 경영자로서 새 출발을 하는 것이다.</td>
							<td><label for="que261" class="selfhidden">5점</label><input type="radio" id="que261" name="que26" class="input_radios" value="5" /></td>
							<td><label for="que262" class="selfhidden">4점</label><input type="radio" id="que262" name="que26" class="input_radios" value="4" /></td>
							<td><label for="que263" class="selfhidden">3점</label><input type="radio" id="que263" name="que26" class="input_radios" value="3" /></td>
							<td><label for="que264" class="selfhidden">2점</label><input type="radio" id="que264" name="que26" class="input_radios" value="2" /></td>
							<td><label for="que265" class="selfhidden">1점</label><input type="radio" id="que265" name="que26" class="input_radios" value="1" /></td>
						</tr>
					</thead>
					</tbody>
				</table>
			</div>
			<!-- B -->
			
			<!-- C -->
			<div class="base_boardlist mt15" style="display:none">
				<div class="texthide"></div>
				<table class="table table-hover" summary="귀농귀촌 준비도 테스트 평가기준 항목입니다.">
					<colgroup>
						<col style="width:50%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">진단(C) 영농 사전 준비상황</th>
							<th scope="col">5점</th>
							<th scope="col">4점</th>
							<th scope="col">3점</th>
							<th scope="col">2점</th>
							<th scope="col">1점</th>
						</tr>
					</thead>
					<tbody>
					<thead>
						<tr>
							<td class="te_left chkbgcol01" scope="row">1.신규 영농에 관한 다양한 정보수집에 노력을 기울이고 있다</td>
							<td><label for="que311" class="selfhidden">5점</label><input type="radio" id="que311" name="que31" class="input_radios" value="5" /></td>
							<td><label for="que312" class="selfhidden">4점</label><input type="radio" id="que312" name="que31" class="input_radios" value="4" /></td>
							<td><label for="que313" class="selfhidden">3점</label><input type="radio" id="que313" name="que31" class="input_radios" value="3" /></td>
							<td><label for="que314" class="selfhidden">2점</label><input type="radio" id="que314" name="que31" class="input_radios" value="2" /></td>
							<td><label for="que315" class="selfhidden">1점</label><input type="radio" id="que315" name="que31" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">2.재배할 작물을 선택하고 연구해 놓았다</td>
							<td><label for="que321" class="selfhidden">5점</label><input type="radio" id="que321" name="que32" class="input_radios" value="5" /></td>
							<td><label for="que322" class="selfhidden">4점</label><input type="radio" id="que322" name="que32" class="input_radios" value="4" /></td>
							<td><label for="que323" class="selfhidden">3점</label><input type="radio" id="que323" name="que32" class="input_radios" value="3" /></td>
							<td><label for="que324" class="selfhidden">2점</label><input type="radio" id="que324" name="que32" class="input_radios" value="2" /></td>
							<td><label for="que325" class="selfhidden">1점</label><input type="radio" id="que325" name="que32" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">3.영농 정착지에 대해 조사를 마쳤다</td>
							<td><label for="que331" class="selfhidden">5점</label><input type="radio" id="que331" name="que33" class="input_radios" value="5" /></td>
							<td><label for="que332" class="selfhidden">4점</label><input type="radio" id="que332" name="que33" class="input_radios" value="4" /></td>
							<td><label for="que333" class="selfhidden">3점</label><input type="radio" id="que333" name="que33" class="input_radios" value="3" /></td>
							<td><label for="que334" class="selfhidden">2점</label><input type="radio" id="que334" name="que33" class="input_radios" value="2" /></td>
							<td><label for="que335" class="selfhidden">1점</label><input type="radio" id="que335" name="que33" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">4.영농까지의 준비과정과 단계별 사항을 충분히 알고 있다.</td>
							<td><label for="que341" class="selfhidden">5점</label><input type="radio" id="que341" name="que34" class="input_radios" value="5" /></td>
							<td><label for="que342" class="selfhidden">4점</label><input type="radio" id="que342" name="que34" class="input_radios" value="4" /></td>
							<td><label for="que343" class="selfhidden">3점</label><input type="radio" id="que343" name="que34" class="input_radios" value="3" /></td>
							<td><label for="que344" class="selfhidden">2점</label><input type="radio" id="que344" name="que34" class="input_radios" value="2" /></td>
							<td><label for="que345" class="selfhidden">1점</label><input type="radio" id="que345" name="que34" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">5.가족이 영농에동의하고 있다.</td>
							<td><label for="que351" class="selfhidden">5점</label><input type="radio" id="que351" name="que35" class="input_radios" value="5" /></td>
							<td><label for="que352" class="selfhidden">4점</label><input type="radio" id="que352" name="que35" class="input_radios" value="4" /></td>
							<td><label for="que353" class="selfhidden">3점</label><input type="radio" id="que353" name="que35" class="input_radios" value="3" /></td>
							<td><label for="que354" class="selfhidden">2점</label><input type="radio" id="que354" name="que35" class="input_radios" value="2" /></td>
							<td><label for="que355" class="selfhidden">1점</label><input type="radio" id="que355" name="que35" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">6.자동차 운전면허가 있다.</td>
							<td><label for="que361" class="selfhidden">5점</label><input type="radio" id="que361" name="que36" class="input_radios" value="5" /></td>
							<td><label for="que362" class="selfhidden">4점</label><input type="radio" id="que362" name="que36" class="input_radios" value="4" /></td>
							<td><label for="que363" class="selfhidden">3점</label><input type="radio" id="que363" name="que36" class="input_radios" value="3" /></td>
							<td><label for="que364" class="selfhidden">2점</label><input type="radio" id="que364" name="que36" class="input_radios" value="2" /></td>
							<td><label for="que365" class="selfhidden">1점</label><input type="radio" id="que365" name="que36" class="input_radios" value="1" /></td>
						</tr>
					</thead>
					</tbody>
				</table>
			</div>
			<!-- C -->
			
			<!-- D -->
			<div class="base_boardlist mt15" style="display:none">
				<div class="texthide"></div>
				<table class="table table-hover" summary="귀농귀촌 준비도 테스트 평가기준 항목입니다.">
					<colgroup>
						<col style="width:50%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">진단(D) 영농조건의 준비현황</th>
							<th scope="col">5점</th>
							<th scope="col">4점</th>
							<th scope="col">3점</th>
							<th scope="col">2점</th>
							<th scope="col">1점</th>
						</tr>
					</thead>
					<tbody>
					<thead>
						<tr>
							<td class="te_left chkbgcol01" scope="row">1.1년 이상 본격적인 농업 연수를 받은 적 있다.</td>
							<td><label for="que411" class="selfhidden">5점</label><input type="radio" id="que411" name="que41" class="input_radios" value="5" /></td>
							<td><label for="que412" class="selfhidden">4점</label><input type="radio" id="que412" name="que41" class="input_radios" value="4" /></td>
							<td><label for="que413" class="selfhidden">3점</label><input type="radio" id="que413" name="que41" class="input_radios" value="3" /></td>
							<td><label for="que414" class="selfhidden">2점</label><input type="radio" id="que414" name="que41" class="input_radios" value="2" /></td>
							<td><label for="que415" class="selfhidden">1점</label><input type="radio" id="que415" name="que41" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">2.영농 정착지에서 도와줄 사람이 있다.</td>
							<td><label for="que421" class="selfhidden">5점</label><input type="radio" id="que421" name="que42" class="input_radios" value="5" /></td>
							<td><label for="que422" class="selfhidden">4점</label><input type="radio" id="que422" name="que42" class="input_radios" value="4" /></td>
							<td><label for="que423" class="selfhidden">3점</label><input type="radio" id="que423" name="que42" class="input_radios" value="3" /></td>
							<td><label for="que424" class="selfhidden">2점</label><input type="radio" id="que424" name="que42" class="input_radios" value="2" /></td>
							<td><label for="que425" class="selfhidden">1점</label><input type="radio" id="que425" name="que42" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">3.농지 소유 요건과 관련 법규, 과정을 모두 알고 있다.</td>
							<td><label for="que431" class="selfhidden">5점</label><input type="radio" id="que431" name="que43" class="input_radios" value="5" /></td>
							<td><label for="que432" class="selfhidden">4점</label><input type="radio" id="que432" name="que43" class="input_radios" value="4" /></td>
							<td><label for="que433" class="selfhidden">3점</label><input type="radio" id="que433" name="que43" class="input_radios" value="3" /></td>
							<td><label for="que434" class="selfhidden">2점</label><input type="radio" id="que434" name="que43" class="input_radios" value="2" /></td>
							<td><label for="que435" class="selfhidden">1점</label><input type="radio" id="que435" name="que43" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">4.영농자금 융자제도를 이용할 경우 담보가 있다.</td>
							<td><label for="que441" class="selfhidden">5점</label><input type="radio" id="que441" name="que44" class="input_radios" value="5" /></td>
							<td><label for="que442" class="selfhidden">4점</label><input type="radio" id="que442" name="que44" class="input_radios" value="4" /></td>
							<td><label for="que443" class="selfhidden">3점</label><input type="radio" id="que443" name="que44" class="input_radios" value="3" /></td>
							<td><label for="que444" class="selfhidden">2점</label><input type="radio" id="que444" name="que44" class="input_radios" value="2" /></td>
							<td><label for="que445" class="selfhidden">1점</label><input type="radio" id="que445" name="que44" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">5.경영에 대해서 일정 지식(회계 등)이 있다.</td>
							<td><label for="que451" class="selfhidden">5점</label><input type="radio" id="que451" name="que45" class="input_radios" value="5" /></td>
							<td><label for="que452" class="selfhidden">4점</label><input type="radio" id="que452" name="que45" class="input_radios" value="4" /></td>
							<td><label for="que453" class="selfhidden">3점</label><input type="radio" id="que453" name="que45" class="input_radios" value="3" /></td>
							<td><label for="que454" class="selfhidden">2점</label><input type="radio" id="que454" name="que45" class="input_radios" value="2" /></td>
							<td><label for="que455" class="selfhidden">1점</label><input type="radio" id="que455" name="que45" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">6.농산물 판매에 자신 있다.</td>
							<td><label for="que461" class="selfhidden">5점</label><input type="radio" id="que461" name="que46" class="input_radios" value="5" /></td>
							<td><label for="que462" class="selfhidden">4점</label><input type="radio" id="que462" name="que46" class="input_radios" value="4" /></td>
							<td><label for="que463" class="selfhidden">3점</label><input type="radio" id="que463" name="que46" class="input_radios" value="3" /></td>
							<td><label for="que464" class="selfhidden">2점</label><input type="radio" id="que464" name="que46" class="input_radios" value="2" /></td>
							<td><label for="que465" class="selfhidden">1점</label><input type="radio" id="que465" name="que46" class="input_radios" value="1" /></td>
						</tr>
					</thead>
					</tbody>
				</table>
			</div>
			<!-- D -->
			
			<!-- E -->
			<div class="base_boardlist mt15" style="display:none">
				<div class="texthide"></div>
				<table class="table table-hover" summary="귀농귀촌 준비도 테스트 평가기준 항목입니다.">
					<colgroup>
						<col style="width:50%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">진단(E) 농촌생활</th>
							<th scope="col">5점</th>
							<th scope="col">4점</th>
							<th scope="col">3점</th>
							<th scope="col">2점</th>
							<th scope="col">1점</th>
						</tr>
					</thead>
					<tbody>
					<thead>
						<tr>
							<td class="te_left chkbgcol01" scope="row">1.영농자금 이외에 생활자금(1~2년 정도)이 준비되어 있다.</td>
							<td><label for="que511" class="selfhidden">5점</label><input type="radio" id="que511" name="que51" class="input_radios" value="5" /></td>
							<td><label for="que512" class="selfhidden">4점</label><input type="radio" id="que512" name="que51" class="input_radios" value="4" /></td>
							<td><label for="que513" class="selfhidden">3점</label><input type="radio" id="que513" name="que51" class="input_radios" value="3" /></td>
							<td><label for="que514" class="selfhidden">2점</label><input type="radio" id="que514" name="que51" class="input_radios" value="2" /></td>
							<td><label for="que515" class="selfhidden">1점</label><input type="radio" id="que515" name="que51" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">2.농업 이외에 본인 및 가족수입을 얻을 수 있다.</td>
							<td><label for="que521" class="selfhidden">5점</label><input type="radio" id="que521" name="que52" class="input_radios" value="5" /></td>
							<td><label for="que522" class="selfhidden">4점</label><input type="radio" id="que522" name="que52" class="input_radios" value="4" /></td>
							<td><label for="que523" class="selfhidden">3점</label><input type="radio" id="que523" name="que52" class="input_radios" value="3" /></td>
							<td><label for="que524" class="selfhidden">2점</label><input type="radio" id="que524" name="que52" class="input_radios" value="2" /></td>
							<td><label for="que525" class="selfhidden">1점</label><input type="radio" id="que525" name="que52" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">3.아파트에 주거하기 어렵다는 것을 알고 있다.</td>
							<td><label for="que531" class="selfhidden">5점</label><input type="radio" id="que531" name="que53" class="input_radios" value="5" /></td>
							<td><label for="que532" class="selfhidden">4점</label><input type="radio" id="que532" name="que53" class="input_radios" value="4" /></td>
							<td><label for="que533" class="selfhidden">3점</label><input type="radio" id="que533" name="que53" class="input_radios" value="3" /></td>
							<td><label for="que534" class="selfhidden">2점</label><input type="radio" id="que534" name="que53" class="input_radios" value="2" /></td>
							<td><label for="que535" class="selfhidden">1점</label><input type="radio" id="que535" name="que53" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">4.농지와 주거지가 멀 경우 작업이 불편하다는 것을 알고 있다.</td>
							<td><label for="que541" class="selfhidden">5점</label><input type="radio" id="que541" name="que54" class="input_radios" value="5" /></td>
							<td><label for="que542" class="selfhidden">4점</label><input type="radio" id="que542" name="que54" class="input_radios" value="4" /></td>
							<td><label for="que543" class="selfhidden">3점</label><input type="radio" id="que543" name="que54" class="input_radios" value="3" /></td>
							<td><label for="que544" class="selfhidden">2점</label><input type="radio" id="que544" name="que54" class="input_radios" value="2" /></td>
							<td><label for="que545" class="selfhidden">1점</label><input type="radio" id="que545" name="que54" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">5.농촌에서 지역과의 커뮤니케이션이 중요함을 알고 있다.</td>
							<td><label for="que551" class="selfhidden">5점</label><input type="radio" id="que551" name="que55" class="input_radios" value="5" /></td>
							<td><label for="que552" class="selfhidden">4점</label><input type="radio" id="que552" name="que55" class="input_radios" value="4" /></td>
							<td><label for="que553" class="selfhidden">3점</label><input type="radio" id="que553" name="que55" class="input_radios" value="3" /></td>
							<td><label for="que554" class="selfhidden">2점</label><input type="radio" id="que554" name="que55" class="input_radios" value="2" /></td>
							<td><label for="que555" class="selfhidden">1점</label><input type="radio" id="que555" name="que55" class="input_radios" value="1" /></td>
						</tr>
						<tr>
							<td class="te_left chkbgcol01" scope="row">6.농업에 관련된 공동작업과 역활이 요구됨을 알고 있다.</td>
							<td><label for="que561" class="selfhidden">5점</label><input type="radio" id="que561" name="que56" class="input_radios" value="5" /></td>
							<td><label for="que562" class="selfhidden">4점</label><input type="radio" id="que562" name="que56" class="input_radios" value="4" /></td>
							<td><label for="que563" class="selfhidden">3점</label><input type="radio" id="que563" name="que56" class="input_radios" value="3" /></td>
							<td><label for="que564" class="selfhidden">2점</label><input type="radio" id="que564" name="que56" class="input_radios" value="2" /></td>
							<td><label for="que565" class="selfhidden">1점</label><input type="radio" id="que565" name="que56" class="input_radios" value="1" /></td>
						</tr>
					</thead>
					</tbody>
				</table>
			</div><br/>
			<!-- E -->
			
			<div class="te_center mt25">
				<button type="button" class="btn btn-success" onClick="fnNextQuestion();"><span class="val">다음단계</span></button>
			</div>
		</div>
		<!-- 2단계 -->

		<!-- 3단계 -->
		<div class="stepArea" id="testStep3Area" style="display:none">
			<div class="selfWrap mt30">
				<div class="selfBox03">
					<ul>
						<li class="selftitle01">귀농귀촌 준비도 <span>테스트 결과</span>입니다</li>
						<li class="score"><span></span>점</li>
						<li class="selftext04">
						</li>
					</ul>
					<div class="base_boardlist03">
						
						<table class="table table-hover"  summary="귀농귀촌 준비도 테스트 결과입니다">
							<colgroup>
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">진단A</th>
									<th scope="col">진단B</th>
									<th scope="col">진단C</th>
									<th scope="col">진단D</th>
									<th scope="col">진단E</th>
									<th scope="col">합계</th>
								</tr>
								<tr>
									<td name="ans01"><span class="tblshow"></span></td>
									<td name="ans02"><span class="tblshow"></span></td>
									<td name="ans03"><span class="tblshow"></span></td>
									<td name="ans04"><span class="tblshow"></span></td>
									<td name="ans05"><span class="tblshow"></span></td>
									<td><span class="tblshow">합계</span><span class="colorange">300</span>점</td>
								</tr>
						 </thead>
						</table>
					</div>
				</div>
			</div><br/>
			<div class="te_center mt45"><a href="#none" onClick="fnNextStep(1);" class="btn btn-success">다시하기</a></div>

		</div>
		<!-- 3단계 -->
		
		
		<!-- 내용끝 -->
	
	
	</div>
</div>
<!-- 	내용 종료 -->
	</div>
    </section>
</body>
</html>