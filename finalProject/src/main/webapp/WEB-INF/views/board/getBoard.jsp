<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
<h3>단건 조회</h3>
번호 : ${board.seq}<br>
제목 : ${board.title}<br>
작성자 : ${board.writer}<br>
내용 : ${board.content}<br>
첨부파일(단건) : <a href="fileDown?seq=${board.seq}">${board.fileName}</a><br>
첨부파일(다중) : 
	<c:forTokens items="${board.fileName}" delims="," var="file">
		<a href="fileNameDown?fileName=${file}">${file}</a>
	</c:forTokens>
</body>
</html>