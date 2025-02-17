<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/club_detail_modify.css'/>" rel="stylesheet">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<script>
	var parameterString = "";
	if("${param.si}" != ""){
		parameterString += "&si=${param.si}";
	}
	if("${param.gu}" != ""){
		parameterString += "&gu=${param.gu}";
	}
	if("${param.category}" != ""){
		parameterString += "&category=${param.category}";
	}
	if("${param.sportsName}" != ""){
		parameterString += "&sportsName=${param.sportsName}";
	}
</script>
<div class="info_container">
	<c:if test="${IS_FED eq 0}">
		<div class="div1 border_container padding_container">
			<div class="ranking">
				<img src="../resources/images/icon_랭킹.png">
				<p class="img_name">랭킹</p>
				<p class="value">${ClubRanking}위</p>
			</div>
			<div class="point">
				<img src="../resources/images/icon_포인트.png">
				<p class="img_name">포인트</p>
				<p class="value">${point_total}</p>
			</div>
			<div class="level">
				<img src="../resources/images/icon_실력.png">
				<p class="img_name">실력</p>
				<p class="value">
					<c:choose>
						<c:when test="${ClubInfo.SKILL_POINT eq null || ClubInfo.SKILL_POINT eq 0}">미지정</c:when>
						<c:when test="${ClubInfo.SKILL_POINT % 2 == 1}">
							<c:forEach var="i" begin="1" end="${ClubInfo.SKILL_POINT / 2}" step="1">
								<img src="../resources/images/icon_star.png" style="width: 13px; height: 13px;">
							</c:forEach>
							<img src="../resources/images/icon_half_star.png" style="width: 13px; height: 13px;">
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="1" end="${ClubInfo.SKILL_POINT / 2}" step="1">
								<img src="../resources/images/icon_star.png" style="width: 13px; height: 13px;">
							</c:forEach>
						</c:otherwise>
					</c:choose></p>
			</div>
			<div class="matchingdate">
				<img src="../resources/images/icon_매칭희망일.png">
				<p class="img_name">매칭 희망일</p>
				<p class="value">
					<c:choose>
						<c:when test="${ClubInfo.MATCH_DATE eq null || ClubInfo.MATCH_DATE eq ''}">미정</c:when>
						<c:otherwise>
							<fmt:parseDate value="${ClubInfo.MATCH_DATE}" var="dateString" pattern="yyyy-mm-dd"/>
							<fmt:formatDate value="${dateString}" pattern="mm월 dd일"/>
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
		<div class="div2">
			<table class="table_border_container">
				<tr class="tr_header"><th colspan="2">동호회 상세정보</th>
				<tr class="tr_exercise_place">
					<td class="td_title">운동장소
					<td class="td_content">${ClubInfo.EXERCISE_PLACE}</td>
				<tr class="tr_exercise_time">
					<td class="td_title">운동시간
					<td class="td_content">${ClubInfo.EXERCISE_TIME}</td>
				<tr class="tr_ages">
					<td class="td_title">주요 연령대
					<td class="td_content">${ClubInfo.CLUB_TARGET_NAME}</td>
				<tr class="tr_establishment_year">
					<td class="td_title">설립연도
					<td class="td_content">
						<fmt:parseDate value="${ClubInfo.ESTABLISHMENT_YEAR}" var="dateFmt" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${dateFmt}" pattern="yyyy. MM"/></td>
				<tr class="tr_member_num">
					<td class="td_title">회원수
					<td class="td_content">${ClubInfo.MEMBER_NUM}명</td>
			</table>
		</div>
	</c:if>
	<div class="div3_header padding_container">동호회 소개</div>
	<div class="div3 padding_container"><br>${ClubInfo.INTRODUCTION}<br></div>
	<c:choose>
		<c:when test="${IS_FED eq 0}">
			<div class='inquiry <c:if test="${user_level eq 2}">off</c:if>'>문의하기</div>
			<c:if test="${user_level ne 2}">
			<script>
				$(".info_container .inquiry").click(function() {
					location.href="./club_info_inquiry.do?club_code=${ClubCode}&replace=clubdetailinfo"+parameterString;
				});
			</script>
			</c:if>
			<div class='member_num'>앱에 가입한 회원 수&nbsp;<span class="blue">${UserNumber}</span></div>
			<div class="div4 padding_container">
				<table>
					<c:forEach items="${ClubUserInfo}" var="list">
						<tr onclick="location.href='../myprofile/user_info.do?user_id=${list.USER_ID}';">
							<td class="td_icon"><img src="<c:url value="/resources/upload/user/profile/${list.PROFILE}" />" onerror="this.src='../resources/images/icon_프로필사진(공백).png'"/>
							<td class="td_name">${list.USER_NAME}
							<td class="td_manager"><c:if test="${list.USER_LEVEL eq 2}">운영진</c:if>
					</c:forEach>
				</table>
			</div>
		</c:when>
		<c:when test="${IS_FED eq 1}">
			<div class='inquiry fed <c:if test="${FedManagers.size() eq 0 || user_level eq 2}">off</c:if>'>문의하기</div>
			<c:if test="${FedManagers.size() ne 0}">
			<script>
				$(".info_container .inquiry").click(function() {
					location.href="./fed_info_inquiry.do?FED_CODE=${param.FED_CODE}&replace=feddetailinfo"+parameterString;
				});
			</script>
			</c:if>
			<div class="member_num">${ClubInfo.GU}&nbsp;${ClubInfo.SPORTS_NAME} 연합회 목록</div>
			<div class="div4 border_container">
				<table>
					<c:forEach items="${FedMemberList}" var="list">
						<tr>
							<c:choose>
								<c:when test="${list.MEMBER_STATUS eq 0}">
									<td class="td_icon"><img src="../resources/images/icon_동호회연합회(회색).png">
								</c:when>
								<c:when test="${list.MEMBER_STATUS eq 1}">
									<td class="td_icon"><img src="../resources/images/icon_동호회연합회(보라).png">
								</c:when>
							</c:choose>
							<td class="td_name">${list.CLUB_NAME}<input class="club_code" type="hidden" value="${list.CLUB_CODE}"/>
					</c:forEach>
				</table>
			</div>
		</c:when>
	</c:choose>
	
	<!-- 
	<script>
		$(".div4 td").click(function() {
			var club_code = $(this).parent().find(".club_code").val();
			if(club_code == 0){
				return;
			}
			location.href="./club_detail.do?club_code="+club_code;
		});
	</script> -->
</div>
