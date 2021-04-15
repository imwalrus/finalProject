<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농촌속으로 소개</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
 	body{
 		background-color: #FFFAE9; 
 	}
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
	    padding:0 ;
	    width: 230px;
	    background-color: #fff;
	}
	.leftMenuBar{
		height:60px;
	}
	.leftMenuBar a {
		height:60px;
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
	    height: calc(100%);
	    margin-top: 50px;
	    border-radius: 0 6px 0 0;
	    top: 0;
	    background: #fff;
	    color: #97a7c1;
	}
	.leftMenuDiv .leftMenuHeader{
		position: relative;
	    padding-top: 20px;
	    height: 116px;
	    text-align: center;
	}
	.material-icons{
		
	}
	
</style>
</head>
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
    <div class="rightContent">
		<img id="info" alt="농촌속으로 소개" src="resources/gotoFarm/images/intoFarmInfo.png" >
	</div>
</body>
</html>