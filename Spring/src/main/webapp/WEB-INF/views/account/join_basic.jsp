<%@page import="java.util.logging.ConsoleHandler"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<c:url value='../resources/css/jquery-ui.min.css'/>" rel="stylesheet">
<link href="<c:url value='../resources/css/bootstrap.css'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/sha256.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>

<div class="header">
	<div class="left_btn"><img src="../resources/images/icon_back.png" onclick="history.back();"></div>
	<div class="title">회원가입</div>
	<div class="right_btn"></div>
</div>

<div class="line"></div>
<div id="join_basic">
	<div class="join_user_info_wrapper" >
		<div class="blank_wrapper">
			<span id="join_user_info_blank">회원정보(필수)</span>
		</div>
		<div class="join_user_info_contents_wrapper">
			<div class="contents_container">
				<div class="contents_title">이름</div>
				<div class="contents_info">
					<input type="text" name="USER_NAME" id="name" placeholder="이름">
				</div>
			</div>
			<div class=contents_container>
				<div class="contents_title">성별</div>
				<div class="contents_info_sex">
						<input type="radio" id="boy" name="SEX" value=0 class="sex" checked="checked"><label for="boy">남성</label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="girl" name="SEX" value=1 class="sex"><label for="girl">여성</label>
				</div>
			</div>
			<div class="contents_container">
				<div class="contents_title">생년월일</div>
				<div class="contents_info">
					<div class="birthday_div" align="left">
						<select id="selYear" name="bsnsYear" class="birth_sel">
						  <c:set var="now" value="<%=new java.util.Date()%>" />
				          <fmt:formatDate value="${now}" pattern="yyyy" var="yearStart"/>
				          <option value="${yearStart}"><c:out value="${yearStart}" /></option>
				          <c:forEach begin="0" end="80" var="result" step="1">
				           <option value="<c:out value="${yearStart - result}" />" ><c:out value="${yearStart - result}" /></option>
				          </c:forEach>                      
				         </select>년
			         <div class="vertical_line"></div>

			         <select id="selMonth" name="bsnsMonth" class="birth_sel" style="width: 20px;">
			          <c:forEach begin="1" end="12" var="result" step="1">
			           <option value="<c:if test="${result lt 10}">0</c:if><c:out value="${result}" />"><c:out value="${result}" /></option>
			          </c:forEach>
			         </select>월
			        <div class="vertical_line"></div>
			        
			         <select id="selDay" name="bsnsDay" class="birth_sel" style="width: 20px;">
			          <c:forEach begin="1" end="31" var="result" step="1">
			           <option value="<c:if test="${result lt 10}">0</c:if><c:out value="${result}" />"><c:out value="${result}" /></option>
			          </c:forEach>
			         </select>일&nbsp;&nbsp;&nbsp;
					</div>
				</div>
			</div>
			<div class="contents_container">
				<div class="contents_title">휴대폰번호</div>
				<div class="contents_info">
					<input type="text" name="PHONE_NUMBER" id="phone_number" placeholder="(예)01012345678" maxlength="11px">
					<button class="contents_button" onclick="get_number()">번호받기</button>
				</div>
			</div>
			<div class="contents_container">
				<div class="contents_title">인증번호</div>
				<div class="contents_info">
					<input type="text" name="PHONE_NUMBER" id="tempkey" maxlength="11px">
					<button class="contents_button invisible" onclick="certify()">인증하기</button>
				</div>
			</div>
			<div class="contents_container">
				<div class="contents_title">이메일주소</div>
				<div class="contents_info">
					<input type="email" name="EMAIL" id="email" placeholder="아이디@이메일">
				</div>
			</div>
			<div class="contents_container">
				<div class="contents_title">비밀번호</div>
				<div class="contents_info">
					<input type="password" name="PASSWORD" id="password" placeholder="6-15자의 영문/연속숫자 및 특수문자 제한" maxlength="15px" >
				</div>
			</div>
			<div class="contents_container">
				<div class="contents_title">비밀번호확인</div>
				<div class="contents_info">
					<input type="password" name="confirm_password" id="confirm_password" placeholder="한번 더 입력해 주세요" maxlength="15px" >
				</div>
			</div>
		</div>
	</div>
	<div class="permission_wrapper">
		<div class="blank_wrapper">
			<span id="permission_blank">약관동의</span>
		</div>
		<div class="permission_container">
			<div class="contents_container">
				<div class="contents_title">운동생활 서비스 이용약관</div>
				<div class="permission_contents_info_arrow" id="rule1_div">
					내용보기 
					<span class="arrow_span" id="rule1_span"><img class="arrow_image" src="../resources/images/icon_arrow_down.png"></span>
				</div>
				<div class="permission_sub" style="display: none; font-size: 5px;">
<textarea readonly="readonly" style="overflow: scroll;">
<%@ include file="./assess_service.jsp" %>
</textarea>
				</div>
			</div>
			<div class="contents_container">
				<div class="contents_title">개인정보 수집 및 이용 동의</div>
				<div class="permission_contents_info_arrow" id="rule2_div">
					내용보기 <span class="arrow_span" id="rule2_span"><img class="arrow_image" src="../resources/images/icon_arrow_down.png"></span>
				</div>
				<div class="permission_sub" style="display: none; font-size: 5px;">
<textarea readonly="readonly" style="overflow: scroll;">
<%@ include file="./assess_private.jsp" %>
 </textarea>
				</div>
			</div>
			<div class="contents_container">
				<div class="contents_title">마케팅 수신동의</div>
				<div class="permission_contents_info" style="color: #9b9b9b;">
					<input id="email_marketing" type="checkbox" name="EMAIL_MARKETING"><label for="email_marketing"></label>이메일
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="sns_marketing" type="checkbox" name="SNS_MARKETING"><label for="sns_marketing"></label>SMS
				</div>
			</div>
		</div>
	</div>
	<center>
	<div class="permission_phrase">
		운동생활 회원 이용약관 및 개인정보 수집/이용 등의 내용을 <br><br>확인하였으며 위 내용에 동의합니다.
	</div>
	</center>
	<center>
	<div class="join_btn" onclick="validation_check()">동의하고 회원가입</div>
	</center>
	<script>
		/*$(function() {
		  $( "#birthday" ).datepicker({
		    dateFormat: 'yy년 mm월 dd일',
		  });
		});
		*/
		var name;
		var sex;
		var age;
		var phone_number;
		var password;
		var confirm_password;
		var birthday;
		var email;
		var email_marketing = 0;
		var sns_marketing = 0;
		
		var phone_certified_flag = 0;
	
		function validation_check(){
			name = $("#name").val();
			sex = $(".sex:checked").val();
			
			var year = $("#selYear option:selected").val();
			var month = $("#selMonth option:selected").val();
			var day = $("#selDay option:selected").val();
			birthday = year+"-"+month+"-"+day;
			if(birthday.match(/^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/)){
				console.log("검증받음" + birthday);
				// 검증
			}
			else{
				console.log(establishment_year);
				alert("정확한 날짜를 입력해주세요.");
				return;
			}
			phone_number = $("#phone_number").val();
			password = $("#password").val();
			confirm_password = $("#confirm_password").val();
			email = $("#email").val();
			if($("#email_marketing").prop("checked"))
				email_marketing = 1;
			if($("#sns_marketing").prop("checked"))
				sns_marketing = 1;
			
			if(!name_check(name)){
				window.alert("이름을 2자이상 정확히  입력하여 주세요.");
				return;
			}else if(sex == undefined){
				window.alert("성별을 선택하여 주세요.");
				return;
			}else if(!phone_number_check(phone_number)){
				window.alert("휴대폰번호를 정확히 입력하여 주세요.");
				return;
			}else if(!email_check(email)){
				window.alert("이메일을 정확히 입력하여 주세요.");
				return;
			}else if(!password_check(password)){
				window.alert("패스워드를 형식에 맞게 정확히 입력하여 주세요.");
				return;
			}else if(password != confirm_password){
				window.alert("패스워드가 일치하지 않습니다.");
				return;
			}else if(phone_certified_flag==0){
				window.alert("휴대폰번호 인증을 해주세요.");
				return;
			}

			idCheck();
		}
				
		
		//전화번호 '-'버튼 막기
		$("#phone_number").keydown(function() {
			if(event.keyCode==109 || event.keyCode==189) {
				return false;
			}
		});
		
		function idCheck(){
			ajax_id_check(email, function callback(json){
				var jsonObj = JSON.parse(JSON.stringify(json));
				var result = jsonObj.result;
				
				if(result){
					window.alert("아이디가 존재합니다.");
					email.focus();
				} else {
					form_submit();
				}
			});
			event.preventDefault();
		}
		
		function form_submit(){
			var sha256_password = Sha256.hash(password);
			
			ajax_join_submit(name, sex, birthday, phone_number, sha256_password, email, email_marketing, sns_marketing, function callback(json){
				var jsonObj = JSON.parse(JSON.stringify(json));
				var result = jsonObj.result;
				
				if(result){
					location.replace("./join_location.do?replace=joinbasic");
				} else {
					window.alert("실패");
				}
			});
		}
		
		
		$("#rule1_div").click(function() {
			var format = "";
			if($(this).next("div").is(":visible")){
				format = "<img class='permission_contents_image' src='../resources/images/icon_arrow_down.png' style='height:10px; width:15px;'>"
				$(this).next("div").slideUp("fast");
				$("#rule1_span").html(format);
			}else{
				format = "<img class='permission_contents_image' src='../resources/images/icon_arrow_up.png' style='height:10px; width:15px;'>"
				$(this).next("div").slideDown("fast");
				$("#rule1_span").html(format);
			}
		});
		$("#rule2_div").click(function() {
			var format = "";
			if($(this).next("div").is(":visible")){
				format = "<img class='permission_contents_image' src='../resources/images/icon_arrow_down.png' style='height:10px; width:15px;'>"
				$(this).next("div").slideUp("fast");
				$("#rule2_span").html(format);
			}else{
				format = "<img class='permission_contents_image' src='../resources/images/icon_arrow_up.png' style='height:10px; width:15px;'>"
				$(this).next("div").slideDown("fast");
				$("#rule2_span").html(format);
			}
		});
		
		function get_number(){
			phone_number = $("#phone_number").val();
			if(!phone_number_check(phone_number)){
				window.alert("휴대폰번호를 정확히 입력하여 주세요.");
				return;
			}
			phone_number = phone_number.substring(0,3)+"-"+phone_number.substring(3,7)+"-"+phone_number.substring(7,11);
			ajax_get_certification_number(phone_number, function callback(json){
				var jsonObj = JSON.parse(JSON.stringify(json));
				var result = jsonObj.result;
				
				if(result){
					window.alert("인증번호를 전송하였습니다.");
					$(".invisible").removeClass("invisible");
				} else {
					window.alert("이미 가입되어있는 번호입니다.");
				}
			});
		}
		
		function certify(){
			var tempkey = $("#tempkey").val();
			phone_number = $("#phone_number").val();
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
	</script>

</div>
