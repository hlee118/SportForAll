<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="date" value="<%=new java.util.Date()%>" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/footer.css?v=2'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/header.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/club.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/club_fee.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/club_dialog.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/jquery.mobile.css'/>" rel="stylesheet">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/ajax.js?v=1'/>"></script>
</head>
<body>
<div class="header">
	<div class="left_btn">
		<img class="top_button" id="back_btn" src="<c:url value="/resources/images/icon_back.png" />" onclick="history.back();">
	</div>
	<div class="title"><span id="page_name">설정</span></div>
	<div class="right_btn">
		<span class="save" onclick="save()" style="color: #008ae8;">저장</span>
	</div>
</div>

<div id="club_fee">
	<div id="blurAll"></div>
	<div class="date">
		<div class="back" onclick="month_back()"></div>
		<div class="date_fmt"><fmt:formatDate value="${date}" pattern="yyyy년 MM월" /></div>
		<div class="next" onclick="month_next()"></div>
	</div>
	<div class="cost">
		<div class="cost_title">총 금액</div>
		<div class="cost_value">0</div>
	</div>
	<div class="basic_cost" onclick="open_basic_cost_dialog()">
		기본금액 설정하기
	</div>
	<div class="line"></div>
	<div class="add_from_address" onclick="call_address()">
		<div class="address_image"><img src="../resources/images/icon_address.png">
		</div>
		<span class="address_add">주소록으로 추가하기</span>
		<div class="address_next"><img src="../resources/images/icon_detail.png"></div>
	</div>
		<div class="line"></div>
	<div class="members">
	</div>
</div>
<!-- dialog -->
<%@ include file="./dialog/dialog_basic_cost.jsp" %>



<script>

	var club_code = ${param.club_code};
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var basic_cost = -1;
	var cnt = 0;
	
	var next_year = year;
	var next_month = month;
	if(month == 12){
		next_year = year + 1;
		next_month = 1;
	} else {
		next_month = month + 1;
	}
	
	function cost_cal(){
		var cost=0;
		$(".fee").each(function(index){
			cost = cost + parseInt($( this ).val());
		});
		numberWithCommas(cost);
	}
	
	//cost에 3자리수마다 컴마붙이기
	function numberWithCommas(x){
		var commaCost = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(".cost_value").html(commaCost);
	}
	
	//콤마풀기
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	
	//리스트 불러오기
	$(document).ready(function(){
		get_fee_list();
		cost_cal();
	});
	
	//나머지 숫자 0 채워주는 알고리즘
	function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	
	//뒤로가기 효과
	function month_back(){
		var cur_date = $(".date_fmt").html();
		var cur_year = parseInt(cur_date.substring(0, 4));
		var cur_month = parseInt(cur_date.substring(6, 8));
		
		if(cur_month==1){
			year = cur_year - 1;
			month = 12;
		} else {
			year = cur_year;
			month = cur_month - 1;
		}
		
		if(month == 12){
			next_year = year + 1;
			next_month = 1;
		} else {
			next_year = year;
			next_month = month + 1;
		}
		
		$(".date_fmt").html(year+"년 "+ pad(month, 2) + "월");
		$(".cost_value").html("0");
		get_fee_list();
	}
	
	//다음달 넘기기 효과
	function month_next(){
		var cur_date = $(".date_fmt").html();
		var cur_year = parseInt(cur_date.substring(0, 4));
		var cur_month = parseInt(cur_date.substring(6, 8));
		
		if(cur_month==12){
			year = cur_year + 1;
			month = 1;
		} else {
			year = cur_year;
			month = cur_month + 1;
		}
		
		if(month == 12){
			next_year = year + 1;
			next_month = 1;
		} else {
			next_year = year;
			next_month = month + 1;
		}
		
		$(".date_fmt").html(year+"년 "+ pad(month, 2) + "월");
		$(".cost_value").html("0");
		get_fee_list();
	}
	
	//회비 리스트 가져오기
	function get_fee_list(){
		ajax_get_fee_list(club_code, year, month, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			var value = jsonObj.value;
			
			if(result){
				$(".members").html("");
				var real_user = value[0];
				real_user.forEach(function(element){
					cnt++;
					
					var obj = element;
					var ori = $(".members").html();
					$(".members").html(
							ori
							+ '<div class="member common_user">'
							+ 	'<div class="member_image">'
							+		'<img src="../resources/upload/user/profile/'+ obj.profile + '" class="user_profile" onerror="this.src=\'../resources/images/icon_프로필사진(공백).png\'">'
							+ 	'</div>' 
							+ 	'<div class="mamber_name">'
							+ 		obj.user_NAME
							+ 	'</div>' 
							+ 	'<div class="member_fee">'
							+		'<input class="fee real" id="'+ cnt +'" type="text" value="'+ obj.fee +'" user_id="'+ obj.user_ID +'" readonly>'
							+		'<div class="fee_edit" onclick="fee_popup(event, '+ cnt +', 0)">'
							+			'<div class="delete_user" id="'+cnt+'">'
							+				'<div class="fee_edit_btn" onclick="fee_edit()">수정하기</div>'
							+				'<div class="fee_delete_btn" onclick="fee_delete()">삭제하기</div>'
							+			'</div>'
							+		'</div>'
							+ 	'</div>'
							+ '</div>'
					);
					
					var fee = parseInt(obj.fee);
					var ori_cost = parseInt($(".cost_value").html());
					$(".cost_value").html(ori_cost+fee);
					
				});
				
				var address_user = value[1];
				address_user.forEach(function(element){
					cnt++;
					
					var obj = element;
					var ori = $(".members").html();
					$(".members").html(
							ori
							+ '<div class="member address_user" id="'+ obj.user_ADDRESS_CODE +'">'
							+ 	'<div class="member_image">' 
							+		'<img src="" class="user_profile" onerror="this.src=\'../resources/images/icon_프로필사진(공백).png\'">'
							+ 	'</div>' 
							+ 	'<div class="mamber_name">' 
							+ 		obj.user_NAME
							+ 	'</div>' 
							+ 	'<div class="member_fee">'
							+		'<input class="fee address" id="'+ cnt +'" type="text" value="'+ obj.fee +'" user_address_code="'+ obj.user_ADDRESS_CODE +'" input_id="'+ cnt +'" readonly>'
							+		'<div class="fee_edit" onclick="fee_popup(event, '+ cnt +', 1)">'
							+			'<div class="delete_user" id="'+cnt+'">'
							+				'<div class="fee_edit_btn" onclick="fee_edit()">수정하기</div>'
							+				'<div class="fee_delete_btn" onclick="fee_delete()">삭제하기</div>'
							+			'</div>'
							+		'</div>'
							+ 	'</div>'
							+ '</div>'
					);
					
					var fee = parseInt(obj.fee);
					var ori_cost = parseInt(uncomma($(".cost_value").html()));
					var total = fee+ori_cost;
					//$(".cost_value").html(ori+fee);
					numberWithCommas(total);
				});
				mouse_action();
				
			} else {
				window.alert("실패");
			}
		});
	}
	
	var clicked_id;
	function fee_popup(e, input_id, user_flag){
		var box = $($(".delete_user").get(parseInt(input_id)-1));
		clicked_id = input_id;
		
		if(box.css("display")=="none")
			box.css("display", "block");
		else
			box.css("display", "none");
		
		if(user_flag == 0)
			$(".fee_delete_btn").css("display", "none");
		else
			$(".fee_delete_btn").css("display", "block");
	}
	
	function fee_edit(){
		var id = $("#"+clicked_id);
		id.attr("readonly", false);
		id.css("border-style", "solid");
	}
	
	function mouse_action(){
		$(".fee_edit").mouseleave(function(e){
			$(".delete_user").css("display", "none");
		});
	}
	
	//주소록값 지우기
	function fee_delete(){
		var id = $("#"+clicked_id);
		var user_address_code = id.attr("user_address_code");
		var date = ""+ year + "-" + pad(month, 2) + "-" + "01 00:00:00";
		
		ajax_delete_address_user(club_code, user_address_code, date, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			var value = jsonObj.value;
			
			if(result){
				id.parents(".member").css("display", "none");
				$(".delete_user").css("display", "none");
				cost_cal();
			} else {
				window.alert("실패");
			}
		});
	}
	
	
	
	//저장하기 버튼
	function save(){
		var user_arr = new Array();
		var address_user_arr = new Array();
		
		$(".fee.real").each(function(index){
			var info = new Object();
			info.user_id = $(this).attr("user_id");
			info.fee = $(this).val();
			user_arr.push(info);
		});
		
		$(".fee.address").each(function(index){
			var info = new Object();
			info.user_address_code = $(this).attr("user_address_code");
			info.fee = $(this).val();
			address_user_arr.push(info);
		});
		
		var json_user = JSON.stringify(user_arr);
		var json_address_user = JSON.stringify(address_user_arr);
		
		console.log(year);
		console.log(month);
		
		ajax_fee_update(club_code, year, month, basic_cost, json_user, json_address_user, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			var value = jsonObj.value;
			
			if(result){
				var fee = $(".fee");
				fee.attr("readonly", true);
				fee.css("border-style", "none");
				cost_cal();
				window.alert("저장되었습니다");
			} else {
				window.alert("실패");
			}
		});
	}
	
	//기본금액 설정하기
	function set_basic_cost(cost){
		basic_cost = cost;
		$(".fee").each(function(index){
			$( this ).val(cost);
			$( this ).attr("value", cost);
		});
		cost_cal();
	}
	
	//주소록으로 추가하기 버튼
	function call_address(){
		window.Android.call_address();
	}
	
	//안드로이드에서 받아오는 이름값 처리
	function call_address_return(name){
		var date = ""+ year + "-" + pad(month, 2) + "-" + "01 00:00:00";
		ajax_insert_address_user(club_code, name, date, function callback(json){
			var jsonObj = JSON.parse(JSON.stringify(json));
			var result = jsonObj.result;
			var value = jsonObj.value;
			
			if(result){
				cnt++;
				
				var obj = value;
				var ori = $(".members").html();
				$(".members").html(
						ori
						+ '<div class="member address_user" id="'+ obj.user_ADDRESS_CODE +'">'
						+ 	'<div class="member_image">' 
						+		'<img src="" class="user_profile" onerror="this.src=\'../resources/images/icon_프로필사진(공백).png\'">'
						+ 	'</div>' 
						+ 	'<div class="mamber_name">' 
						+ 		name
						+ 	'</div>' 
						+ 	'<div class="member_fee">'
						+		'<input class="fee address" id="'+ cnt +'" type="text" value="'+ obj.fee +'" user_address_code="'+ obj.user_ADDRESS_CODE +'" input_id="'+ cnt +'" readonly>'
						+		'<div class="fee_edit" onclick="fee_popup(event, '+ cnt +', 1)">'
						+			'<div class="delete_user" id="'+cnt+'">'
						+				'<div class="fee_edit_btn" onclick="fee_edit()">수정하기</div>'
						+				'<div class="fee_delete_btn" onclick="fee_delete()">삭제하기</div>'
						+			'</div>'
						+		'</div>'
						+ 	'</div>'
						+ '</div>'
				);
				
				var fee = parseInt(value);
				var ori_cost = parseInt(uncomma($(".cost_value").html()));
				$(".cost_value").html(ori_cost+obj.fee);
				mouse_action();
			} else {
				window.alert("실패");
			}
		});
	}
	
	
</script>

