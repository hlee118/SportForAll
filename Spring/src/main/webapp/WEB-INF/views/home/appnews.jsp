 
<style>

body {
	background-color: #eeeeee;
	width: 540px;
	
	border: 1px solid red;
}

.title {
	background-color: #ef65a3;
	color: white;
	size: 36px;
}

img {
	width: 190px;
	height: 145px;
}

</style>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>

<link rel="stylesheet" type="text/css" href="style.css">

<div>
	<select>
		<option value="전체보기">전체보기</option>
	</select>
	
	<select>
		<option value="카테고리">카테고리</option>
	</select>
	
	<div style="width: 350px">
		<img style="float: left" src="https://www.dpreview.com/files/p/articles/7192167506/images/intro.jpeg">
		<div style="float: right">
			<div>위</div>
			<div>아래</div>
		</div>
	</div>
	
</div>

<%@ include file="../common/footer.jsp" %>