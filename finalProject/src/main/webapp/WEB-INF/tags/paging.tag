<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="co.finalproject.farm.common.Paging" %>
<%@ attribute name="jsFunc" required="false" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--페이징태그 내 margin 스타일을 여기에다 주니 농촌속으로 메뉴바 li에 영향을 미쳐서 li마다 직접 margin값 주는 걸로 수정 - 송예솔 0423-->
<style>
     li { display: inline-block;}
</style>
<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
<c:if test="${paging.startPage>1}">
	<li><a href="javascript:${jsFunc}(${paging.startPage-1})" class="btn btn-primary" style="margin: 5px">이전</a>
</c:if>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<li style="margin: 5px"><a href="javascript:${jsFunc}(${i})" class="btn btn-primary">${i}</a>
	</c:if>
	<c:if test="${i == paging.page}">
		<li class="btn btn-primary active" style="margin: 5px">${i}
	</c:if>
</c:forEach>
<c:if test="${paging.endPage<paging.lastPage}">
	<li style="margin: 5px"><a href="javascript:${jsFunc}(${paging.endPage+1})" class="btn btn-primary">다음</a>
</c:if>
</ul>
</nav>

