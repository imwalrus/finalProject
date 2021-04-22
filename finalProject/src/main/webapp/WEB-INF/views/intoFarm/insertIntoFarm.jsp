<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>체험등록</title>

<!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="./resources/gotoFarm/js/summernote-ko-KR.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script>
/*체험등록 */
function insertFarm() {
	var into_city = frm.into_city.value;
	var into_title = frm.into_title.value;
	var into_product = frm.into_product.value;
	var into_phone = frm.into_phone.value;
	var classDates = document.getElementsByName("classDates"); //선택한 날짜 배열로 받아오기
	var into_entry = frm.into_entry.value;
	var into_info = frm.into_info.value;
	
	var into_date = []; //빈 배열 선언
	for(i=0; i<classDates.length; i++){
		into_date.push(classDates[i].value); 
	}
	//배열을 string으로 묶어줌(join)
	frm.into_date.value=into_date.join(',');
	
	
	if (into_city.trim() == ''){
		alert("지역을 선택해주세요");
		return false;
	}
	if (into_title.trim() == ''){
		alert("체험이름을 입력해주세요");
		return false;
	}
	if (into_product.trim() == ''){
		alert("농작물 종류를 선택해주세요");
		return false;
	}
	if (into_phone.trim() == ''){
		alert("연락처를 입력해주세요");
		return false;
	}
	 if (into_date == ''){
		alert("일정을 선택해주세요");
		return false;
	} 
	if (into_entry.trim() == ''){
		alert("참여가능 인원 수를 입력해주세요");
		return false;
	}
	if (into_info.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	var yn = confirm("등록하시겠습니까?")
	
	if(yn) {
		frm.action = "insertFarm";
		frm.submit();
	}else{
		alert("취소되었습니다.")
	}
}

</script>
<style type="text/css">
*, *:before, *:after {
  box-sizing: inherit;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
  float: none;
}
.calendbutton {
color: black;
}
/* ======== Calendar ======== */
.calendalcontainer {
width: 698px;
margin:auto;
right:70px;
}
.my-calendar {
  width: 698px;
  padding: 20px 20px 10px;
  text-align: center;
  font-weight: 800;
  cursor: default;
  border:3px solid #dee2e6;
  border-radius:25px;
  padding:30px;
}
.my-calendar .clicked-date {
  border-radius: 25px;
  margin-top: 36px;
  float: left;
  width: 42%;
  padding: 46px 0 26px;
  background: #ddd;
}
.my-calendar .calendar-box {
  float: left;
  width: 58%;
  padding-left: 0px;
}
.clicked-date .cal-day {
  font-size: 24px;
}
.clicked-date .cal-date {
  font-size: 130px;
}
.ctr-box {
  padding: 0 16px;
  margin-bottom: 20px;
  font-size: 20px;
}
.ctr-box .btn-cal {
  position: relative;
  float: left;
  width: 25px;
  height: 25px;
  margin-top: 5px;
  font-size: 16px;
  cursor: pointer;
  border: none;
  background: none;
}
.ctr-box .btn-cal:after {
  content: '<';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  line-height: 25px;
  font-weight: bold;
  font-size: 20px;
}
.ctr-box .btn-cal.next {
  float: right;
}
.ctr-box .btn-cal.next:after {
  content: '>';
}
.cal-table {
  width: 100%;
}
.cal-table th {
  width: 14.2857%;
  padding-bottom: 5px;
  font-size: 16px;
  font-weight: 900;
}
.cal-table td {
  padding: 3px 0;
  height: 50px;
  font-size: 15px;
  vertical-align: middle;
}
.cal-table td.day {
  position: relative;
  cursor: pointer;
}
.cal-table td.today {
  background: #82ae46;
  border-radius: 50%;
  color: #fff;
}
.cal-table td.day-active {
  background: #ff8585;
  border-radius: 50%;
  color: #fff;
}
.cal-table td.has-event:after {
  content: '';
  display: block;
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 4px;
  background: #FFC107;
}
.form-control{
	height: 30px !important;
}
.intoFarmDiv{
	border:6px solid #78c2ad;
	padding:40px;
	border-radius: 20px;
}
label{
	font-weight: bolder;
	color:#5a5a5a;
}

</style>
</head>
<body>
<div style="margin-top:20px; margin-bottom: 40px;">
<h2 style="text-align: center; font-weight:bold" >🌱 농촌으로 체험 등록 🌱</h2><br>
	<div class="intoFarmDiv" style="	width: 1000px; 	margin: auto;">
		<form id="frm" name="frm" method="post" action="insertFarm"
			enctype="multipart/form-data">
			<input type="hidden" name="into_date" id="into_date"> 
			<input type="hidden" name="user_id" id="user_id" value="hw"> 
			<input type="hidden" name="uploadFile"><!-- <div class="select_img"><img src=""></div> -->
			<div class="form-group">
    		  <label for="exampleInputPassword1">⊚ 체험 지역</label>
				<select class="custom-select" name="into_city" id="city-select" style="width:93%;" required="required">
					<option value="">--지역을 선택 하여 주십시오--</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
					<option value="대전">대전</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="광주">광주</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
					<option value="대구">대구</option>
					<option value="부산">부산</option>
					<option value="울산">울산</option>
					<option value="강원">강원</option>
					<option value="제주">제주</option>
				</select> 
			</div>
			<div class="form-group">
    		  	<label for="into_title" style="">⊚ 체험 상세주소</label>	
				<input type="text" class="form-control" name="into_detailadr" style="width:95%;" placeholder="상세 주소를 입력해주세요. (상세한 지역명을 입력하셔야 합니다.)" required="required"/>
			</div>
			<div class="form-group">
    		  	<label for="into_title" style="">⊚ 체험명</label>	
				<input type="text" class="form-control" name="into_title" style="width:95%;" placeholder="체험명을 입력하세요." required="required"/>
			</div>
			<div class="form-group">
    		 	<label for="into_product">⊚ 체험 농작물</label>
				<input type="text" class="form-control" name="into_product" style="width:95%;" placeholder="농작물 종류를 입력하세요." required="required"/>
			</div>
			<div class="form-group" >
    		  	<label for="into_phone">⊚ 연락처</label>	
				<input type="text" class="form-control" name="into_phone" style="width:95%;" placeholder="연락처를 입력하세요 ex) 000-0000-0000" required="required"/><br>
			</div>
			<div class="form-group">
    		  	<label for="into_entry">⊚ 체험 인원수</label>	
				<input type="number" class="form-control" name="into_entry" style="width:95%;" placeholder="참여 가능 인원 수를 입력하세요. " required="required"/> 
			</div>
			<div class="form-group">
    		  	<label for="uploadFile">⊚ 이미지 파일 첨부</label>				
				<input multiple="multiple" type="file" class="form-control-file"  name="uploadFile" id="uploadFile" accept="image/png, image/jpeg, image/jpg">
		      	<small id="fileHelp" class="form-text" style="color:red;">최소 3장 이상의 사진을 첨부해주시기 바랍니다.</small>
			</div>	
			<br> 
			<div class="form-group">
				<label for="into_info">⊚ 농촌속으로 체험 상세설명</label>	
				<textarea id="summernote" name="into_info" required="required"></textarea>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="">⊚ 등록할 체험 일정 선택</label>	
				<div class="calendalcontainer">
							<div class="my-calendar clearfix">
								
								<div class="calendar-box">
									<div class="ctr-box clearfix">
										<button type="button" title="prev" class="btn-cal prev"></button>
										<span class="cal-month"></span> <span class="cal-year"></span>
										<button type="button" title="next" class="btn-cal next"></button>
									</div>
									<table class="cal-table">
										<thead>
											<tr>
												<th>Sun</th>
												<th>M</th>
												<th>T</th>
												<th>W</th>
												<th>T</th>
												<th>F</th>
												<th>S</th>
											</tr>
										</thead>
										<tbody class="cal-body">
										</tbody>
									</table>
								</div>
								<div class="calendar-add">
									<div class="cal-day"></div>
									<div class="cal-date"></div>
									<table style="text-align: center"><tr><td style="min-width: 185px;">날짜</td><td style="width: 60px">삭제</td></tr>
									<tbody class="cal-plus"></tbody>
									</table>
								</div>
							</div>
							<!-- // .my-calendar -->
						</div>
				</div>
				<div align="center">
					<button type="button" class="btn btn-primary" id="save" onclick="insertFarm()">등록</button>
					<button type="reset" class="btn btn-danger" onclick="getSearchFarm">취소</button>
				</div>
			
		</form>
		</div> 

	</div>
	
	<script>
	$('#summernote')
	.summernote(
			{
				placeholder : '체험 프로그램 소개(소개,일정,준비물안내,오시는길,담당자이름,담당자 전화번호)',
				height : 300,
				minHeight : null,
				maxHeight : null,
				/* focus: true,  */
				lang : 'ko-KR',
				toolbar : [
						// [groupName, [list of button]]
						[ 'fontname', [ 'fontname' ] ],
						[ 'fontsize', [ 'fontsize' ] ],
						[ 'style',[ 'bold', 'italic', 'underline','strikethrough', 'clear' ] ],
						[ 'color', [ 'forecolor', 'color' ] ],
						[ 'table', [ 'table' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'height', [ 'height' ] ],
						[ 'insert', [ 'picture', 'link', 'video' ] ],
						[ 'view', [ 'fullscreen', 'help' ] ] ],
				fontNames : [ 'Arial', 'Arial Black','Comic Sans MS', 'Courier New', '맑은 고딕','궁서', '굴림체', '굴림', '돋움체', '바탕체' ],
				fontSizes : [ '8', '9', '10', '11', '12', '14','16', '18', '20', '22', '24', '28', '30','36', '50', '72' ]
			});
	</script>
	
	<!--모달-달력띄우기  -->
	<!-- <div class="modal fade" id="showDate" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 50%; width: auto; display: table;">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body"> -->
					
				
			<!-- 	</div>
			</div>
		</div>
</div>	 -->
<script>
	var plusdate=0;
	/////////////////////////////////////////날짜 
	function addDate(){
		plusdate++;
		var calendarAdd = document.querySelector('.cal-plus');
		var pd= 'date'+plusdate;
		calendarAdd.innerHTML += "<tr id="+pd+" style='border:1px solid #f8f9fa;'><td><input name='classDates' type='date' value='"+init.activeDate.toISOString().slice(0,10)+"' style='text-align:right;' required='required'></td><td><button type='button' class='calendbutton btn btn-primary btn-sm' onclick='deleteDate("+'"'+pd+'"'+")'>삭제</button></td></tr>";
	}
	function deleteDate(id){
		plusdate--;
		var deleteDay=document.getElementById(id).remove();
	}
const init = {
		  monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
		  dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
		  today: new Date(),
		  monForChange: new Date().getMonth(),
		  activeDate: new Date(),
		  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
		  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
		  nextMonth: function () {
		    let d = new Date();
		    d.setDate(1);
		    d.setMonth(++this.monForChange);
		    this.activeDate = d;
		    return d;
		  },
		  prevMonth: function () {
		    let d = new Date();
		    d.setDate(1);
		    d.setMonth(--this.monForChange);
		    this.activeDate = d;
		    return d;
		  },
		  addZero: (num) => (num < 10) ? '0' + num : num,
		  activeDTag: null,
		  getIndex: function (node) {
		    let index = 0;
		    while (node = node.previousElementSibling) {
		      index++;
		    }
		    return index;
		  }
		};
		const $calBody = document.querySelector('.cal-body');
		const $btnNext = document.querySelector('.btn-cal.next');
		const $btnPrev = document.querySelector('.btn-cal.prev');
		/**
		 * @param {number} date
		 * @param {number} dayIn
		*/
		function loadDate (date, dayIn) {
		  document.querySelector('.cal-date').textContent = date;
		  document.querySelector('.cal-day').textContent = dayIn;
		}
		/**
		 * @param {date} fullDate
		 */
		function loadYYMM (fullDate) {
		  let yy = fullDate.getFullYear();
		  let mm = fullDate.getMonth();
		  let firstDay = init.getFirstDay(yy, mm);
		  let lastDay = init.getLastDay(yy, mm);
		  let markToday;  // for marking today date
		  
		  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
		    markToday = init.today.getDate();
		  }
		  document.querySelector('.cal-month').textContent = init.monList[mm];
		  document.querySelector('.cal-year').textContent = yy;
		  let trtd = '';
		  let startCount;
		  let countDay = 0;
		  for (let i = 0; i < 6; i++) {
		    trtd += '<tr>';
		    for (let j = 0; j < 7; j++) {
		      if (i === 0 && !startCount && j === firstDay.getDay()) {
		        startCount = 1;
		      }
		      if (!startCount) {
		        trtd += '<td>'
		      } else {
		        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
		        trtd += '<td class="day';
		        trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
		        trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
		      }
		      trtd += (startCount) ? ++countDay : '';
		      if (countDay === lastDay.getDate()) { 
		        startCount = 0; 
		      }
		      trtd += '</td>';
		    }
		    trtd += '</tr>';
		  }
		  $calBody.innerHTML = trtd;
		}
		/**
		 * @param {string} val
		 */
		function createNewList (val) {
		  let id = new Date().getTime() + '';
		  let yy = init.activeDate.getFullYear();
		  let mm = init.activeDate.getMonth() + 1;
		  let dd = init.activeDate.getDate();
		  const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);
		  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);
		  let eventData = {};
		  eventData['date'] = date;
		  eventData['memo'] = val;
		  eventData['complete'] = false;
		  eventData['id'] = id;
		  init.event.push(eventData);
		  $todoList.appendChild(createLi(id, val, date));
		}
		 
		loadYYMM(init.today);
		
		$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
		$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));
		$calBody.addEventListener('click', (e) => {
		  if (e.target.classList.contains('day')) {
		    if (init.activeDTag) {
		      init.activeDTag.classList.remove('day-active');
		    }
		    let day = Number(e.target.textContent);
		    e.target.classList.add('day-active');
		    init.activeDTag = e.target;
		    init.activeDate.setDate(day);
		    addDate();
		    
		  }
		});
</script>  
</body>
</html>