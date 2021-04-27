<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="resources/main/css/style.css">



<div class="pcoded-main-container">
    <div class="pcoded-content">
        <div class="page-header">
            <div class="page-block">
            	<div class="row">
					<div class="col-md-10">
						<div class="card">
							<div class="card-body" align="center">
								<div class="col-md-12">
									<div class="card-header">
										<h2>농촌속으로 문의</h2>
									</div>

									<table class="table table-hover">
										<thead>
											<tr>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일자</th>
												<th>비밀여부</th>
											</tr>
										</thead>

										<tbody>
											<c:if test="${fn:length(list) >=1}">
												<c:forEach items="${list }" var="list">
													<tr>
														<td>${list.comm_title }</td>
														<td>${list.comm_content}</td>
														<td>${list.comm_date}</td>
														<td>$(list.comm_adr}</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${fn:length(list) == 0}">
												<tr>
													<td colspan="4">입력하신 커뮤니티 글이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>
           
            </div>
        </div>

        </div>
    </div>

