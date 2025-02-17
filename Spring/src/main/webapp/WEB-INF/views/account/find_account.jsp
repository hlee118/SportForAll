<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>

<div class="header" style="border:0px;">
	<div class="title">운동생활</div>
	<div class="right_btn">
		<img src="../resources/images/icon_X_white.png" id="cancel_btn" onclick="history.back();">
	</div>
</div>
<div id="find_account" style="background-color: #eeeeee;">
	<div class="top">
		<div id="top_id" class="top_comment">아이디 찾기<div class=bar></div></div>
		<div id="top_password" class="top_comment">비밀번호 찾기<div class=bar></div></div>
	</div>
	<div class="find_id">
		<div class="top_comment">휴대폰 번호로 찾기</div>
		<table style="background-color: white">
			<tr>
				<td>이름
				<td><input id="find_id_input_name" type="text" placeholder="이름">
			<tr>
				<td>휴대폰번호
				<td><input id="find_id_input_phone" type="text" placeholder="(예)01012345678">
		</table>
		<div class="submit_btn" onclick="find_id()">확인</div>
	</div>
	<div class="find_password">
		<div class="top_comment">휴대폰 번호로 찾기</div>
		<table style="background-color: white">
			<tr>
				<td>아이디
				<td><input id="find_pw_input_id" type="text" placeholder="sample@exam.com">
			<tr>
				<td>이름
				<td><input id="find_pw_input_name" type="text" placeholder="이름">
			<tr>
				<td>휴대폰번호
				<td><input id="find_pw_input_phone" type="text" placeholder="(예)01012345678"><button id="send_number_btn" onclick="get_certification_number()">인증번호 전송</button>
			<tr>
				<td>인증번호
				<td><input id="find_pw_input_tempkey" type="text" placeholder="인증번호를 입력하세요"><button id="certify_btn" onclick="certify()">인증하기</button>
		</table>
		<div class="submit_btn" onclick="find_password()">확인</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		if(document.location.hash=="#id"){
			$(".find_id").css("display", "block");
			$("#top_id").addClass("on");
		}
		else if(document.location.hash=="#password"){
			$(".find_password").css("display", "block");
			$("#top_password").addClass("on");
		}
	});
	
	$("#top_id").click(function(){
		$(".find_id").css("display", "block");
		$(".find_password").css("display", "none");
		$("#top_id").addClass("on");
		$("#top_password").removeClass("on");
	});
	
	$("#top_password").click(function(){
		$(".find_id").css("display", "none");
		$(".find_password").css("display", "block");
		$("#top_password").addClass("on");
		$("#top_id").removeClass("on");
	});
	
	function find_id(){
		var name = $("#find_id_input_name").val();
		var phone = $("#find_id_input_phone").val();
		
		ajax_find_id(name, phone, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			var value = jsonObj.value;
			
			if(result){
				location.replace("./found_id.do?replace=findaccountid&USER_ID="+value.user_ID);
			} else {
				window.alert("존재하지 않는 정보입니다.");
			}
		});
	}
	
	function get_certification_number(){
		var phone_number = $("#find_pw_input_phone").val();

		if(!phone_number_check(phone_number)){
			window.alert("휴대폰번호를 정확히 입력하여 주세요.");
			return;
		}
		
		phone_number = phone_number.substring(0,3)+"-"+phone_number.substring(3,7)+"-"+phone_number.substring(7,11);
		ajax_get_find_certification_number(phone_number, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			var value = jsonObj.value;
			
			if(result){
				window.alert("인증번호를 전송하였습니다.");
				$("#certify_btn").css("display", "inline");
			} else {
				window.alert("존재하지 않는 정보입니다.");
			}
		});
	}
	
	var phone_certified_flag = 0;
	function certify(){
		var tempkey = $("#find_pw_input_tempkey").val();
		var phone_number = $("#find_pw_input_phone").val();
		
		phone_number = phone_number.substring(0,3)+"-"+phone_number.substring(3,7)+"-"+phone_number.substring(7,11);
		ajax_certify_number(phone_number, tempkey, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			
			if(result){
				window.alert("인증되었습니다.");
				phone_certified_flag = 1;
			} else {
				window.alert("인증번호가 일치하지 않습니다.");
			}
		});
	}
	
	function find_password(){
		var id = $("#find_pw_input_id").val();
		var name = $("#find_pw_input_name").val();
		var phone = $("#find_pw_input_phone").val();
		
		if(phone_certified_flag==0){
			window.alert("휴대폰 인증을 하여주세요.");
			return;
		}
		
		ajax_find_pw(id, name, phone, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			var value = jsonObj.value;
			
			if(result){
				location.replace("./change_password.do?replace=findaccountpassword&user_id="+value.user_ID);
			} else {
				window.alert("존재하지 않는 정보입니다.");
			}
		});
	}
	
</script>