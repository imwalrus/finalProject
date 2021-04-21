<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="co.finalproject.farm.common.Paging" %>
<%@ attribute name="jsFunc" required="false" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
     li { display: inline-block; margin: 5px}
</style>
<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
<c:if test="${paging.startPage>1}">
	<li><a href="javascript:${jsFunc}(${paging.startPage-1})" class="btn btn-secondary">이전</a>
</c:if>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<li><a href="javascript:${jsFunc}(${i})" class="btn btn-secondary">${i}</a>
	</c:if>
	<c:if test="${i == paging.page}">
		<li class="btn btn-secondary active">${i}
	</c:if>
</c:forEach>
<c:if test="${paging.endPage<paging.lastPage}">
	<li><a href="javascript:${jsFunc}(${paging.endPage+1})" class="btn btn-secondary">다음</a>
</c:if>
</ul>
</nav>

