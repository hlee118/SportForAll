<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!-- 이 페이지는 버리는페이지인가요? 흐름상에 안보이네용 -->
<body>
<div class="header">
	<div class="left_btn">
		<img class="top_button" id="back" src="<c:url value="/resources/images/icon_back.png" />">
	</div>
	<div class="title"><span id="page_name">회원추가</span></div>
	<div class="right_btn">
		<img src="../resources/images/icon_회원추가.png" onclick="location.href='../club/club_user_add.do?club_code=${param.club_code}'">
	</div>
</div>

<div class="header">
	<table><tr>
			<td align="left" style="width:33%; padding-left: 20px">
				<img src="../resources/images/icon_back.png"
					style="width:24px; height: 24px;"
					onclick="location.href='../club/club_user.do?club_code=${param.club_code}'">
			<td style="width:33%;">회원추가
			<td align="right" style="width:33%; padding-right: 20px">
	</tr></table>
</div>

<div id="club_user_search">
	<div class="space1" align="center">
		<div class="space1_input" align="left">
			<img src="../resources/images/icon_clubSearch.png" style="width:16px; height:19px; padding-bottom: 3px;">
			<input type="text" name="search_frame" size="35px" placeholder="ID, 연락처, 회원 검색으로 회원을 추가하세요."
				style="border:0; background-color: #fff; font-size: 14px; padding-left: 8px;">
		</div>
	</div>
	
	<div class="body">
		<img src="../resources/images/background_add_member.png" style="height: 600px; width: 100%">
	</div>
</div>
