<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
</head>
<body>
<form action="insertBoards" method="post" encType="multipart/form-data">
	작성자		<input type="text" name="writer"><br/>
	제목			<input type="text" name="title"><br/>
	내용			<textarea name="content"></textarea><br/>
	첨부파일		<input type="file" name="uploadFile" multiple="multiple"/><br/>
	<input type="submit" value="저장">
</form>
</body>
</html>