<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
 input{
 	border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;  /* 테두리 없애기 */
 }
</style>
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
position: relative;
right:70px;
}
.my-calendar {
  width: 698px;
  padding: 20px 20px 10px;
  text-align: center;
  font-weight: 800;
  cursor: default;
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
  background: #ffd255;
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
</style>
<form id="updatefrm" method="post" action="updateFarm" >
<table class="table table-hover" id="updatetbl">
	<thead class="text-center">
		<tr class="content">
			<th class="text-left">아이디 : <input type="text" value="${upFarm.user_id}" readonly="readonly">
			<input type="hidden" name="into_no" value="${upFarm.into_no}">
			</th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 이름 : <input type="text" name="into_title" value="${upFarm.into_title}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">
				지역 :
				<select name="into_city" id="city-select" style="margin-top: 1%;">
					<option value="">${upFarm.into_city}</option>
					<option value="광주">광주</option>
					<option value="대구">대구</option>
					<option value="대전">대전</option>
					<option value="독도">독도</option>
					<option value="부산">부산</option>
					<option value="서울">서울</option>
					<option value="울릉도">울릉도</option>
					<option value="울산">울산</option>
					<option value="인천">인천</option>
					<option value="제주도">제주도</option>
				</select><br> 
			</th>
		</tr>
		<tr class="content">
			<th class="text-left">농작물 종류 : <input type="text" name="into_product" value="${upFarm.into_product}"></th>
		</tr>
		<tr class="content">
			<th class="text-left">모집 인원 수 : <input type="text" name="into_entry" value="${upFarm.into_entry}"></th>
		</tr>
		 <tr class="content">
			<th class="text-left">체험 일정 : <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#showDate">달력보기</a>
			</th>
		</tr>
		<tr class="content">
			<th class="text-left">체험 내용  <textarea id="summernote" name="into_info" >${upFarm.into_info}</textarea></th>
		</tr>
		
		<tr class="content">
			<th class="text-left">문의 전화번호 :  <input type="text" name="into_phone" value="${upFarm.into_phone}"></th>
		</tr>
		<!--파일 가져오기 > 다시 지우고 올리는것! -->
		<tr class="content">
			<th class="text-left">파일 :  <input multiple="multiple" name="into_filename" type="file" accept="image/png, image/jpeg, image/jpg"></th>
		</tr>
		<!-- <tr class="content">
		<th> -->
		
		<!-- </th>
		</tr> -->				
	</thead>
	
</table>
 
<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">취소</button>
					<!--농업인& 관리자 수정-->
					<button class="btn btn-primary" type="button" data-dismiss="modal" onclick="goupdate('${upFarm.into_no}')">저장</button>
				</div>
</form>


<!--모달-달력띄우기  -->
	<div class="modal fade" id="showDate" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="max-width: 50%; width: auto;">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">
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
							
						</div>
			 	</div>
			</div>
		</div>
	</div>	
<script>
/* 
function showCal() { 
	$('#showDate .modal-body').show();
		
} */

	var plusdate=0;
	/////////////////////////////////////////날짜 
	function addDate(){
		plusdate++;
		var calendarAdd = document.querySelector('.cal-plus');
		var pd= 'date'+plusdate;
		calendarAdd.innerHTML += "<tr id="+pd+" style='border:1px solid #f8f9fa;'><td><input name='classDates' type='date' value='"+init.activeDate.toISOString().slice(0,10)+"' style='text-align:right;'></td><td><button type='button' class='calendbutton' onclick='deleteDate("+'"'+pd+'"'+")'>삭제</button></td></tr>";
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

	alert("ddd");
</script>  
