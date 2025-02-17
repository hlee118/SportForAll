<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>

<body>
<div class="header">
	<div class="left_btn">
		<img class="top_button" id="back" src="<c:url value="/resources/images/icon_back.png" />" onclick="history.back();">
		<!-- <img class="top_button" id="back" src="<c:url value="/resources/images/icon_back.png" />" onclick="location.href='../club/club_user.do?club_code=${param.club_code}'"> -->
	</div>
	<c:choose>
		<c:when test="${IS_FED eq 0}">
			<div class="title"><span id="page_name">회원추가</span></div>
		</c:when>
		<c:when test="${IS_FED eq 1}">
			<div class="title"><span id="page_name" class="fed">
				<c:choose>
					<c:when test="${IS_MEMBER eq 1}">동호회 추가</c:when>
					<c:when test="${IS_MANAGER eq 1}">운영진 추가</c:when>
				</c:choose>
			</span></div>
		</c:when>
	</c:choose>
	<div class="right_btn">
	</div>
</div>

<script>
	$(function() {
		$("#search_key").keydown(function(e) {
			if(e.keyCode == 13){
				var input_value = $(this).val();
				<c:choose>
					<c:when test="${IS_FED eq 0}">
						location.href="./club_user_add.do?club_code=${param.club_code}&mode=${param.mode}&USER_NAME="+input_value;
					</c:when>
					<c:when test="${IS_FED eq 1}">
						<c:choose>
							<c:when test="${IS_MANAGER eq 1}">
								location.href="./fed_manager_add.do?FED_CODE=${param.FED_CODE}&mode=${param.mode}&KEYWORD="+input_value;
							</c:when>
							<c:when test="${IS_MEMBER eq 1}">
								location.href="./fed_member_add.do?FED_CODE=${param.FED_CODE}&mode=${param.mode}&KEYWORD="+input_value;
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>
			}
		});
		$(".user_grade").click(function() {
			var user_id = $(this).siblings(".user_manager").children(".user_id").val();
			<c:choose>
				<c:when test="${IS_FED eq 0}">
					ajax_invite_user("${param.club_code}", user_id, function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
						var result = jsonObj.result;
						if(result == 0 || result == 1 || result == 2){
							alert("초대 요청 완료!");
						}
						else if(result == 3){
							alert("이미 가입된 회원입니다.");
						}
						else{
							alert("오류");
						}
						location.reload();
					});
				</c:when>
				<c:when test="${IS_FED eq 1 && IS_MANAGER eq 1}">
					ajax_invite_manager("${param.FED_CODE}", user_id, function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
						var result = jsonObj.result;
						if(result == 1){
							alert("초대완료!");
						}
						else{
							alert("오류");
						}
						location.reload();
					});
				</c:when>
				<c:when test="${IS_FED eq 1 && IS_MEMBER eq 1}">
					ajax_invite_member("${param.FED_CODE}", user_id, function(json) {
						var jsonObj = JSON.parse(JSON.stringify(json));
						var result = jsonObj.result;
						if(result == 1){
							alert("초대완료!");
						}
						else{
							alert("오류");
						}
						location.reload();
					});
				</c:when>
			</c:choose>
		});
	});
</script>
<div id="club_user_add">
	<div class="space1" align="center">
		<div class="space1_input" align="left">
			<img class="icon_search" src="../resources/images/icon_clubSearch.png">
			<c:choose>
				<c:when test="${IS_FED eq 0 || (IS_FED eq 1 && IS_MANAGER eq 1) }">
					<input type="text" id="search_key" name="search_frame" size="35px" placeholder="ID, 연락처 검색으로 회원을 추가하세요." value="${param.USER_NAME}${param.KEYWORD}">
				</c:when>
				<c:when test="${IS_FED eq 1 && IS_MEMBER eq 1 }">
					<input type="text" id="search_key" name="search_frame" size="35px" placeholder="동호회 이름을 검색하세요." value="${param.KEYWORD}">
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${IS_FED eq 0 && param.USER_NAME ne null && param.USER_NAME ne ''}">
					<img class="icon_x" src="../resources/images/icon_X.png" onclick="location.href='../club/club_user_add.do?club_code=${param.club_code}&mode=${param.mode}'">
				</c:when>
				<c:when test="${IS_FED eq 1 && param.KEYWORD ne null && param.KEYWORD ne ''}">
					<img class="icon_x" src="../resources/images/icon_X.png" onclick="location.href='../club/fed_manager_add.do?FED_CODE=${param.FED_CODE}'">
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="list_div">
		<c:choose>
			<c:when test="${IS_FED eq 0 && (param.USER_NAME eq null || param.USER_NAME eq '' || userListInvite eq null)}">
				<img src="../resources/images/background_add_member.png" style="height: 600px; width: 100%">
			</c:when>
			<c:when test="${IS_FED eq 1 && (param.KEYWORD eq null || param.KEYWORD eq '' || (userListInvite eq null && clubListInvite eq null))}">
				<img src="../resources/images/background_add_member.png" style="height: 600px; width: 100%">
			</c:when>
			<c:when test="${IS_FED eq 0 || (IS_FED eq 1 && IS_MANAGER eq 1) }">
				<table class="list_tb">
					<c:forEach items="${userListInvite}" var="list">
						<tr class="list_tr">
					 		<td class="user_icon" width="18%" align="center" onclick="location.href='../myprofile/user_info.do?user_id=${list.USER_ID}';"><img src="/resources/upload/user/profile/${list.PROFILE}" onerror="this.src='../resources/images/icon_프로필사진(공백).png'"></td>
					 		<td class="user_name" width="40%" onclick="location.href='../myprofile/user_info.do?user_id=${list.USER_ID}';">${list.USER_NAME}</td>
					 		<td class="user_manager" width="30%" align="center" onclick="location.href='../myprofile/user_info.do?user_id=${list.USER_ID}';"><input type="hidden" class="user_id" value="${list.USER_ID}"></td>
					 		<td class="user_grade" width="12%" align="left">
					 			<c:choose>
					 				<c:when test="${IS_FED eq 0}">
					 					<img src="../resources/images/icon_운영진_회원추가.png">
					 				</c:when>
					 				<c:when test="${IS_FED eq 1}">
					 					<img src="../resources/images/icon_운영진_회원추가_연합회.png">
					 				</c:when>
					 			</c:choose>
					 		</td>
				 		</tr>
				 	</c:forEach>
				</table>
			</c:when>
			<c:when test="${IS_FED eq 1 && IS_MEMBER eq 1}">
				<table class="list_tb">
					<c:forEach items="${clubListInvite}" var="list">
						<tr class="list_tr">
					 		<td class="user_icon" width="18%" align="center"><img src="${list.MAIN_PIC}" onerror="this.src='../resources/images/icon_fill_people.png'"></td>
					 		<td class="user_name" width="40%">${list.CLUB_NAME}</td>
					 		<td class="user_manager" width="30%" align="center"><input type="hidden" class="user_id" value="${list.CLUB_CODE}"></td>
					 		<td class="user_grade" width="12%" align="left">
					 			<img src="../resources/images/icon_운영진_회원추가_연합회.png">
					 		</td>
				 		</tr>
				 	</c:forEach>
				</table>
			</c:when>
		</c:choose>
	</div>
</div>
</body>