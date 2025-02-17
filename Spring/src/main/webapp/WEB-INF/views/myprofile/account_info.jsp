<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link href="<c:url value='/resources/css/account_info.css?v=1'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/resources/js/validation.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/sha256.js'/>"></script>

<div class="header">
	<div class="left_btn"><img src="../resources/images/icon_back.png" onclick="history.back(-1);"></div>
	<div class="title">계정 설정</div>
	<div class="right_btn"></div>
</div>

<div id="account_info" style="text-align:left; padding-left: 25px; padding-right: 25px; padding-top: 10px">
	<table style="font-size: 13px;">
	<tr><td style="vertical-align:bottom; padding-bottom:5px;  text-align:left; height:40px; color: #008ae8;">비밀번호 변경</td></tr>
	<tr>
		<td style="text-align:left; height:50px; color:#757575">
			 <img src="../resources/images/파랭이.png" style="height: 27px; width: 5px; vertical-align: middle;">&nbsp;
				<input type="password" placeholder="현재 비밀번호" id="current_pw"
						style="font-size:13px; border:1px solid; color:#9B9B9B; height: 40px; width:90%; border-color:white; border-bottom-color: #9B9B9B">
		</td>
	</tr>
	<tr>
		<td style="text-align:left; height:50px; color:#757575">
			 <img src="../resources/images/파랭이.png" style="height: 27px; width: 5px; vertical-align: middle;">&nbsp;
				<input type="password" placeholder="새 비밀번호" id="new_pw"
						style="font-size:13px; border:1px solid; color:#9B9B9B; height: 40px; width:90%; border-color:white; border-bottom-color: #9B9B9B">
		</td>
	</tr>
	<tr>
		<td style="text-align:left; height:50px; color:#757575">
			 <img src="../resources/images/파랭이.png" style="height: 27px; width: 5px; vertical-align: middle;">&nbsp;
				<input type="password" placeholder="새 비밀번호 확인" id="new_pw_check"
						style="font-size:13px; border:1px solid; color:#9B9B9B; height: 40px; width:90%; border-color:white; border-bottom-color: #9B9B9B">
		</td>
	</tr>
	<tr>
		<td style="text-align:center; height:90px;">
			<input type="button" value="비밀번호 변경" onclick="modify_password()"
					style="color:#000000; background-color:white; text-align:center; font-size:13px; border:1px solid; border-color:#5D5D5D; height: 35px; width:93%;">
		</td>
	</tr>
	<tr>
		<td style="text-align:left; height:50px; vertical-align: bottom; color: #008ae8;">
		회원 탈퇴
		</td>
	</tr>
	<tr>
		<td style="text-align:left; padding-left:10px; height:70px; width: 100%">
			계정 탈퇴 시 모든 동호회에서 탈퇴되며, 작성하셨던 글에 대해 수정 및 삭제가 불가능 합니다. 이 점 유념해 주시기 바랍니다.
		</td>
	</tr>
	<tr>
		<td style="text-align:center; height:70px; width: 100%">
			<input type="button" value="회원탈퇴 하기" onclick="drop_out()"
					style="color:#a30005; background-color:white; text-align:center; font-size:13px; border:1px solid; border-color:#F50057; border-radius:30px; height: 35px; width:93%;">
		</td>
	</tr>
</div>

<script>
	function modify_password(){
		var email = "${user_info.EMAIL}";
		var password = $("#current_pw").val();
		var sha256_password = Sha256.hash(password);
		
		ajax_password_check(email, sha256_password, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			
			if(result){
				new_password_check();
			} else {
				window.alert("현재 비밀번호를 잘못 입력하였습니다.");
			}
		});
	}
	
	function new_password_check(){
		var new_pw = $("#new_pw").val();
		var new_pw_check = $("#new_pw_check").val();
		
		if(!password_check(new_pw)){
			window.alert("비밀번호 형식에 맞춰서 다시 입력하여 주세요.");
			return;
		} else if(new_pw != new_pw_check){
			window.alert("새 비밀번호가 일치하지 않습니다.");
			return;
		}
		
		var sha256_password = Sha256.hash(new_pw);
		ajax_password_update(sha256_password, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			
			if(result){
				window.alert("비밀번호 변경이 완료되었습니다.");
				$("#current_pw").val("");
				$("#new_pw").val("");
				$("#new_pw_check").val("");
			} else {
				window.alert("현재 비밀번호를 잘못 입력하였습니다.");
			}
		});
	}
	
		
	function drop_out(){
		var flag = confirm("정말로 탈퇴하시겠습니까?");
		if (flag == true) {
			ajax_drop_out(function callback(json){
				var jsonObj = JSON.parse(JSON.stringify(json));
				var result = jsonObj.result;
				
				if(result){
// 					window.alert("탈퇴되었습니다.")
					location.href="../"
				} else {
					window.alert("운영진이 혼자인 동호회가 존재하여 탈퇴가 불가합니다.");
				}
			});
		}
	}
	
	//새 비밀번호가 현재 비밀번호와 같을때
	function new_password_check(){
		var current_pw = $("#current_pw").val();
		var new_pw = $("#new_pw").val();
		
		if(new_pw == current_pw){
			window.alert("새 비밀번호가 현재 비밀번호와 같습니다.");
			return;
		}
	}
</script>