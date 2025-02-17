<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<link href="<c:url value='/resources/css/profile_setting.css?v=2'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/jquery.mobile.css'/>" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.mobile.js'/>"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<div class="header">
	<div class="left_btn"><img src="../resources/images/icon_back.png" onclick="history.back();"></div>
	<div class="title">설정</div>
	<div class="right_btn"></div>
</div>


<div id="profile_setting" style="background-color: #EEEEEE; height:600px; width: 100%">
	<div class="div2" style="height: 149px; width:100%">
		<div id="space1">
			&nbsp;&nbsp;&nbsp;개인정보
		</div>
		<div class="list">
			<table style="text-align:left; height: 54px; width: 100%;">
				<tr>
					<td style="width: 80%;"><font size="3.5px">&nbsp;&nbsp;&nbsp;${user_info.EMAIL}</font></td>
					<td id="settings" style="text-align: right" span=2>
						<input class="profile_setting_btn" type="image" src="../resources/images/로그아웃.png" style="height:20px; width: 55px; padding-right: 10px"
							   onclick="logout()">
					</td>
				</tr>
			</table>
		</div>
		<div class="list">
			<table style="text-align:left; height: 52px; width: 100%;" onclick="location.href='./account_info.do'">
				<tr>
					<td style="width: 80%"><font size="3.5px">&nbsp;&nbsp;&nbsp;계정 설정</font></td>
					<td id="settings" style="text-align: right" span=2>
						<input class="profile_setting_btn" type="image" src="../resources/images/icon_detail.png" style="height: 15px; width: 15px; padding-right: 10px">
					</td>
				</tr>
			</table>
		</div>
	</div>


	<div class="div3" style="height: 105px">
		<div id="space6">
			&nbsp;&nbsp;&nbsp;알림 설정
		</div>
		<div class="list">
			<table style="height: 70px; width: 100%">
				<tr>
					<td class="push_container">
						<div class="push_massage">푸시 알림 받기</div>
						<div class="push_submassage">푸시 메세지를 통해 알림을 받습니다</div>
					<td id="settings" span=2>
						<form>
						    <input type="checkbox" data-role="flipswitch" name="flip-checkbox-1" id="push_checkbox" <c:if test="${user_info.PUSH_ALRAM eq 1}">checked</c:if>>
						</form>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<div class="div4" style="height: 93px">
		<div id="space6">
			&nbsp;&nbsp;&nbsp;친구 초대
		</div>
		<div class="list">
			<table style="height: 60px; width: 100%;">
				<tr id="kakao-link-btn">
					<td style="width: 15%; text-align: right">
						<img src="https://happytalk.io/assets/main/img/btn-chat-kakao.png" style="height:40px; width:40px; border-radius: 50%">
					</td>
					<td style="width: 65%;">
						&nbsp;<font size="3.5px">카카오톡으로 초대하기</font>
					</td>
					<td id="settings" style="width:20%; text-align: right" span=2>
						<input class="profile_setting_btn" type="image" src="../resources/images/icon_detail.png" value="설정하기" style="height: 15px; width: 15px">
					</td>
				</tr>
				</a>
			</table>
		</div>
	</div>
	<div class="div5" style="height: 160px">
		<div id="space6">
			&nbsp;&nbsp;&nbsp;운동생활 앱 버전 정보
		</div>
		<div class="list">
			<table style="height: 50px; width: 100%;">
				<tr>
					<td style="width: 25%; text-align: center">
						현재 버전
					</td>
					<td style="width: 75%;">
						&nbsp;<font size="3.5px">v<span id="current_version">1.0</span></font>
					</td>
				</tr>
			</table>
		</div>
		<div class="list">
			<table style="height: 50px; width: 100%;">
				<tr>
					<td style="width: 25%; text-align: center">
						최신 버전
					</td>
					<td style="width: 75%;">
						&nbsp;<font size="3.5px" color="#2199EB">v<span id="new_version">1.0</span></font>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="div6">
		<a href="https://docs.google.com/forms/d/e/1FAIpQLSeGHpSpaf4IY4B0ZjtVuZzds8EKux3zygWYN2fnvVDks03bIA/viewform"><img src="../resources/images/img_11.png"></a>
	</div>
	
	
</div>

<script>
	//<![CDATA[
	// // 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('f9fe2a56ceb46da685c3fecbe6ed1070');
	// // 카카오톡 링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
	Kakao.Link.createTalkLinkButton({
		container: '#kakao-link-btn',
		image: {
			src: 'http://222.239.254.231/SportForAll/resources/images/kakao_msg_img.jpg',
			width: '300',
			height: '150'
		},
		label: '동호회 커뮤니티, 매칭, 대회·시설 정보를 한번에!\n\n지금 다운받으세요!',
		appButton: {
			text: '앱으로 이동',
		}
	});
	//]]>

	function logout(){
		ajax_logout(function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			
			if(result){
				location.replace('../');
			} else {
				window.alert("오류");
			}
		});
	}
	
	$("#push_checkbox").change(function(){
		if($(this).is(':checked')){
			ajax_push_check(function callback(json){
				var jsonObj = JSON.parse(JSON.stringify(json));
				var result = jsonObj.result;
				
				if(result){
				} else {
					window.alert("오류");
				}
			});
		} else {
			ajax_push_check_cancel(function callback(json){
				var jsonObj = JSON.parse(JSON.stringify(json));
				var result = jsonObj.result;
				
				if(result){
				} else {
					window.alert("오류");
				}
			});
		}
		
	})
	
	
	$(document).ready(function(){
		window.Android.getCurrentVersion();
		ajax_get_version(function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			var value = jsonObj.value;
			
			if(result){
				$("#new_version").html(value);
				var current_version_html = $("#current_version").html();
				if(current_version_html==$("#new_version").html()){
					$("#current_version").html(current_version_html+"(최신버전입니다)");
				}
			} else {
				window.alert("오류");
			}
		});
	});
	
	function current_version(value){
		$("#current_version").html(value);
		var current_version_html = $("#current_version").html();
		if(current_version_html==$("#new_version").html()){
			$("#current_version").html(current_version_html+"(최신버전입니다)");
		}
	}
	
</script>
<%@ include file="../common/backeventjs.jsp" %>