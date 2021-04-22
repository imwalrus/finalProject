<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<style>
  	#info{
 		display: block; 
 		margin: 0px auto;
 	}
 	#header{
 		width:200px;
 	}
 	.leftMenu {
	    list-style-type: none;
	    margin: 0;
	    padding:0 !important;
	    width: 230px !important;
	    background-color: #fff;
	}
	.leftMenuBar{
		height:60px !important;
	}
	.leftMenuBar a {
	    display: block;
	    color: #000;
	    padding: 15px 16px;
	    text-decoration: none;
	}
	.leftMenuBar a.active {
	    background-color: #78c2ad;
	    color: white;
	}
	.leftMenuBar a:hover:not(.active) {
	    background-color: #78c2ad59;
	    color: white;
	}
	.leftMenuDiv{
	    display: block;
	    z-index: 1028;
	    position: fixed;
	    box-shadow: 0 2px 10px -1px rgb(69 90 100 / 30%);
	    transition: all 0.3s ease-in-out;
	    width: 230px;
	    height: calc(100% - 50px);
	    margin-top: 50px;
	    border-radius: 0 6px 0 0;
	    top: 50px;
	    background: #fff;
	    color: #97a7c1;
	}
	
	.leftMenuDiv ul {
	    padding-left: 0;
	    list-style: none;
	    margin-bottom: 0;
	}
	.leftMenuDiv .leftMenuHeader{
		position: relative;
	    padding-top: 20px;
	    height: 116px;
	    text-align: center;
	}	
</style>
<body>
	<div class="leftMenuDiv">
		<div class="leftMenuHeader">
			<img id="header" alt="농촌속으로 소개" src="resources/gotoFarm/images/nongchone.png" >
		</div>
		<div>	
		    <ul class="leftMenu">
		      <li class="leftMenuBar"><a class="active" href="getFarmInfo"><span class="material-icons">home</span>  농촌속으로 소개</a></li>
		      <li class="leftMenuBar"><a href="getFarmList"><span class="material-icons">view_headline</span>  체험신청</a></li>
		      <li class="leftMenuBar"><a href="insertFarm"><span class="material-icons">view_headline</span>  체험등록</a></li>
		      <li class="leftMenuBar"><a href="#"><span class="material-icons">view_headline</span>  농촌속으로 문의</a></li>
		    </ul>
	    </div>
    </div>
<script>
	
	$(".leftMenu > .leftMenuBar > a").on('click',function(){
		$(".leftMenu > .leftMenuBar > a ").removeClass('active');
		$(this).addClass("active"); 
		localStorage.ClassName ="active";
	});	
	$(document).ready(function() {
	    SetClass();
	});

	function SetClass() {
	    $("#themecolors li a").addClass(localStorage.ClassName);
	}
</script>
</body>
</html>