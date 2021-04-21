<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<script>
		//이미지 불러오기
		function readInputFile(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#imagePriview').attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		// 이미지 불러오기
		$('#uploadFile').change(function() {
			readInputFile(this);
		});
	</script>
	<form action="adminBannerUpt" enctype="multipart/form-data" method="post">
		<input type="hidden" name="banner_no" value="${banner.banner_no}">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">${banner.banner_title}</h4>
		</div>
		<div class="modal-body">
			<div class="col">
				<table>
					<tbody>
						<tr>
							<td class="h5"></td>
							<td></td>
							<td class="h6">
								<img id="imagePriview" src="resources/images/banner/${banner.banner_filename}">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>링크</strong>
							</td>
							<td></td>
							<td class="h6">
								<input type="text" class="form-control" name="banner_link" size="40" value="${banner.banner_link}">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>이미지</strong>
							</td>
							<td></td>
							<td class="h6">
								<div class="file_input_div">
									<input type="file" class="form-control" id="uploadFile" name="uploadFile" size="40" onchange="javascript: document.getElementById('fileName').value = this.value" accept=".gif, .jpg, .png">
								</div>
								<input type="text" id="fileName" class="form-control-sm" readonly="readonly" size="40" value="${banner.banner_filename}">
							</td>
						</tr>
						<tr>
							<td class="h5">
								<strong>표시</strong>
							</td>
							<td></td>
							<td class="h6">
								<select class="form-control" name="banner_check">
									<option value="0" <c:if test='${banner.banner_check eq 0}'>selected</c:if>>표시</option>
									<option value="1" <c:if test='${banner.banner_check eq 1}'>selected</c:if>>숨기기</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal-footer">
			<input type="submit" class="btn btn-success" value="수정">
			<input type="button" class="btn btn-info" data-dismiss="modal" value="닫기">
		</div>
	</form>
</body>