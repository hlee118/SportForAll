<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>


<div class="header">
	<div class="left_btn"><img src="../resources/images/icon_back.png"  onclick="history.back();"></div>
	<div class="title">찾기</div>
	<div class="right_btn"></div>
</div>

<table>
	<tr>
		<td class="left_btn">
			
		</td>
		<td class="input_title">
				<img src="../resources/images/icon_검색.png">
				<input type="text" name="search_frame" size="30px" placeholder="찾고싶은 운동 종목을 찾아보세요.">
		<td class="right_btn">
		</td>
	</tr>
</table>

<div id="search">
	<div class="search_div">
		<table class="search_tb">
			<tr class="search_tr">
				<td class="search_td" align="right">
					<div class="search_number">1</div>
				<td class="field_td" align="left">배드민턴
		</table>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>