<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>    

    <input type="hidden" name="edu_no" value="${edu.edu_no}">
    <div align="center">
    <table class="table table-bordered" style="width:800px;">
    <thead>
    <tr>
    <th class="table-active" width="15%" align="center">주제</th>
    <td width="35%"align="center">${edu.edu_title}</td>
    <th class="table-active" width="15%" align="center">강의일자</th>
    <td width="35%"align="center">${edu.edu_date}</td>
    </tr>
    <tr>
    <th class="table-active" width="15%" align="center">교육시간</th>
    <td width="35%" align="center">${edu.edu_time}</td>
    <th class="table-active" width="15%" align="center">교육기관</th>
    <td width="35%" align="center">${edu.edu_organ}</td>
    </tr>
    <tr>
    <td class="table-active" width="100" align="center">장소</td>
    <td align="center">${edu.edu_adr}</td>
    <td class="table-active" width="100" align="center">신청여부</td>
    <td align="center">${edu.edu_check}</td>
    </tr>
    <tr>
    <td class="table-active" width="100" align="center">담당자 이름</td>
    <td align="center">${edu.edu_person}</td>
    <td class="table-active" width="100" align="center">담당자 연락처</td>
    <td align="center">${edu.edu_phone}</td>
    </tr>
    <tr>
    <td class="table-active" align="center" colspan="4">교육이미지</td>
    </tr>
    <tr>
    <td align="center" style="height:400px;" colspan="4" align="center">
	<img width="900px" src="resources/main/images/${edu.edu_filename}">
    </td>
    </tr>
    <tr>
    <td class="table-active" align="center" colspan="4">교육소개</td>
    </tr>
    <tr>
    <td align="center" style="height:400px;" colspan="4" align="center">${edu.edu_content}</td>
    </tr>
    </thead>
    </table>
    </div>