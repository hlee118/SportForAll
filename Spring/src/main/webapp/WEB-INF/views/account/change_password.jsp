<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/sha256.js'/>"></script>

<div class="header" style="border:0px;">
	<div class="title">비밀번호 변경</div>
	<div class="right_btn">
		<img src="../resources/images/icon_X_white.png" id="cancel_btn" onclick="location.href='../index.do'">
	</div>
</div>
<div id="change_password">
	<table>
		<tr>
			<td>새 비밀번호
			<td><input type="password" id="new_pw" placeholder="6-15자의 영문/연속숫자">
		<tr>
			<td>새 비밀번호 확인
			<td><input type="password" id="new_pw_check" placeholder="한번 더 입력하여 주세요.">
	</table>
	<div class="submit_btn" onclick="new_password_check()">확인</div>
</div>

<script>
	function new_password_check(){
		var new_pw = $("#new_pw").val();
		var new_pw_check = $("#new_pw_check").val();
		var user_id = ${param.user_id};
		if(!password_check(new_pw)){
			window.alert("비밀번호 형식에 맞춰서 다시 입력하여 주세요.");
			return;
		} else if(new_pw != new_pw_check){
			window.alert("새 비밀번호가 일치하지 않습니다.");
			return;
		}
		
		var sha256_password = Sha256.hash(new_pw);
		ajax_new_password(user_id, sha256_password, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			
			if(result){
				window.alert("비밀번호가 변경되었습니다. 다시 로그인해 주세요.");
				location.replace("../");
			} else {
				window.alert("현재 비밀번호를 잘못 입력하였습니다.");
			}
		});
	}
	
</script>