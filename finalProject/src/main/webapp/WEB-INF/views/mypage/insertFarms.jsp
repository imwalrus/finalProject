<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>나의 농지 등록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="resources/admin/css/style.css">

</head>
<body>
	    <div class="pcoded-main-container">
        <div class="pcoded-content">
            <section class="pcoded-main-container">
                <div class="col-md-9" align="center">
                    <div class="card">
                        <form id="frm" name="frm" action="insertFarms" method="post">
                            <h3 align="center">
                                <input type="text" class="form-control form-control-lg" id="farm_name" name="farm_name"
                                    placeholder="농장이름을 입력하세요">
                            </h3>
                            <div class="card-body table-border-style">
                                <div class="table-responsive">

                                    <table class="table">
                                        <tr>
                                            <td name="farm_no">
                                                <input type="hidden" class="form-control form-control-lg" id="farm_no"
                                                    name="farm_no" placeholder="번호">
                                            </td>
                                            <th class="table-success">
                                                <h3>소유자</h3>
                                            </th>
                                            <td name="farm_no">
                                                <input type="text" class="form-control form-control-lg" id="user_id"
                                                    name="user_id" placeholder="소유자ID">
                                            </td>

                                            <th class="table-success">
                                                <h3>면적</h3>
                                            </th>
                                            <td name="farm_area">
                                                <input type="text" class="form-control form-control-lg" id="farm_area"
                                                    name="farm_area" placeholder="면적입력">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="table-success">
                                                <h3>주소</h3>
                                            </th>
                                            <td colspan="5" name="farm_adr">
                                                <input type="text" class="form-control form-control-lg" id="farm_adr"
                                                    name="farm_adr" placeholder="주소입력">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="table-success">
                                                <h3>소개</h3>
                                            </th>
                                            <td colspan="5" name="farm_content">
                                                <textarea class="form-control form-control-lg" id="farm_content"
                                                    name="farm_content" rows="3" placeholder="농장소개를 입력하세요"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Upload</span>
                                                    </div>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input"
                                                            id="inputGroupFile01"> <label class="custom-file-label"
                                                            for="inputGroupFile01">Choose
                                                            file</label>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="col-md-10" align="center">
                                        <button type="submit" class="btn  btn-outline-success">등록</button>
                                        <button type="reset" class="btn  btn-outline-danger">취소</button>
                                    </div>
                                    </div>
                                    </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
    </div>
</body>
</html>