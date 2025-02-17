<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="modify_interest">
	<div class="header" style="background-color: #008ae8">
		<div class="left_btn"><img src="../resources/images/icon_back_white.png" onclick="history.back(-1);"></div>
		<div class="title" style="color: #ffffff;background-color: #008ae8;">관심종목 선택</div>
		<div class="right_btn" id="save_btn"><span style="color: #ffffff">완료</span></div>
	</div>
	<div class="space1" >
		<table style="font-size: 11.5px; background-color: #eeeeee;">
			<tr height="70px" valign="middle">
				<td align="left">
					<div style="width: 92%; margin: 0 auto">
					관심이 있는 스포츠 종목을 선택해 주세요. (최대 5개까지 선택 가능)</br>
					관심종목은 언제든지 내정보>관심종목 변경하기에서 변경할 수 있습니다.
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="check_interest_div">
		<table class="ball_check">
			<tr class="line">
				<td width="55px" style="padding-left: 15px;"><img src="../resources/images/category_ball.png" style="height: 30px; width: 30px">
				<td align="left" style="font-size: 15px">구기
			<tr class="line_ball">
				<td>
				<td>
					<c:forEach items="${type_ball}" var="list">
						<a><div class="checkbox <c:forEach items='${user_interest}' var='user_i'><c:if test='${user_i.NAME == list.NAME}'>on</c:if></c:forEach>" icon="category_${list.EVENTS_TAG}.png" id="${list.CATEGORY_CODE}">${list.NAME}</div></a>
					</c:forEach>
		</table>
		<table class="racket_check">
			<tr class="line">
				<td width="55px" style="padding-left: 15px;"><img src="../resources/images/category_racket.png" style="height: 30px; width: 30px">
				<td align="left" style="font-size: 15px">라켓
			<tr class="line_racket">
				<td>
				<td>
					<c:forEach items="${type_racket}" var="list">
						<a><div class="checkbox <c:forEach items='${user_interest}' var='user_i'><c:if test='${user_i.NAME == list.NAME}'>on</c:if></c:forEach>" icon="category_${list.EVENTS_TAG}.png" id="${list.CATEGORY_CODE}">${list.NAME}</div></a>
					</c:forEach>
		</table>
		<table class="martial_check">
			<tr class="line">
				<td width="55px" style="padding-left: 15px;"><img src="../resources/images/category_martial.png" style="height: 30px; width: 30px">
				<td align="left" style="font-size: 15px">무술
			<tr class="line_martial">
				<td>
				<td>
					<c:forEach items="${type_martial}" var="list">
						<a><div class="checkbox <c:forEach items='${user_interest}' var='user_i'><c:if test='${user_i.NAME == list.NAME}'>on</c:if></c:forEach>" icon="category_${list.EVENTS_TAG}.png" id="${list.CATEGORY_CODE}">${list.NAME}</div></a>
					</c:forEach>
		</table>
		<table class="fitness_check">
			<tr class="line">
				<td width="55px" style="padding-left: 15px;"><img src="../resources/images/category_fitness.png" style="height: 30px; width: 30px">
				<td align="left" style="font-size: 15px">피트니스
			<tr class="line_fitness">
				<td>
				<td>
					<c:forEach items="${type_fitness}" var="list">
						<a><div class="checkbox <c:forEach items='${user_interest}' var='user_i'><c:if test='${user_i.NAME == list.NAME}'>on</c:if></c:forEach>" icon="category_${list.EVENTS_TAG}.png" id="${list.CATEGORY_CODE}">${list.NAME}</div></a>
					</c:forEach>
		</table>
		<table class="etc_check">
			<tr class="line">
				<td width="55px" style="padding-left: 15px;"><img src="../resources/images/category_etc.png" style="height: 30px; width: 30px">
				<td align="left" style="font-size: 15px">기타
			<tr class="line_etc">
				<td>
				<td>
					<c:forEach items="${type_etc}" var="list">
						<a><div class="checkbox <c:forEach items='${user_interest}' var='user_i'><c:if test='${user_i.NAME == list.NAME}'>on</c:if></c:forEach>" icon="category_${list.EVENTS_TAG}.png" id="${list.CATEGORY_CODE}">${list.NAME}</div></a>
					</c:forEach>
		</table>
	</div>
</div>
	<script>
		var nameArr = new Array();
		var iconArr = new Array();
		var codeArr = new Array();
		$(document).ready(function(){
			var div_arr = $(".on");
			for(var i=0;i<div_arr.length;i++){
				var div = $(div_arr[i]);
				var icon = div.attr('icon');
				var name = div.html();
				var code = div.attr('id');
				
				nameArr.push(name);
				iconArr.push(icon);
				codeArr.push(code);
			}
		});
		
		
		
		
		$(".checkbox").click(function(){
			var div = $(".checkbox").eq($(".checkbox").index($(this)));
			var icon = div.attr('icon');
			var name = div.html();
			var code = div.attr('id');
				
			if(div.hasClass('on')){
				nameArr = nameArr.filter(function(x){
					if(x!=name){
						return x;
					}
				});
				codeArr = codeArr.filter(function(x){
					if(x!=code){
						return x;
					}
				});
				
				div.removeClass("on");
			}
			else{
				if(nameArr.length>=5){
					window.alert("최대 5개까지만 선택하여 주세요");
					return;
				}
				nameArr.push(name);
				iconArr.push(icon);
				codeArr.push(code);
				div.addClass("on");
			}
		});
		
		$("#save_btn").click(function(){
			console.log(codeArr);
			console.log(nameArr.length==0);
			if(nameArr.length<1){
				window.alert("1개 이상 선택하여 주세요.");
				return;
			}
		
			$(".interest_table").html("");
			for(var i=0;i<nameArr.length;i++){
				var option_html = "";
				
				if(nameArr[i]!="배드민턴"){
					option_html = 
							'<div class="level_div" onclick="open_select_level_dialog('+codeArr[i]+')">'
						+	'<span class="level_value">'
						+	'<img class="img_levelStar" src="../resources/images/icon_half_star.png">'
						+	'</span>'
						+	'<img class="img_select_arrow" src="../resources/images/icon_selectbox_arrow.png">'
						+	'<input type="hidden" class="level" value="1" />'
				}else{
					option_html = 
								'<div class="demo">'
						+			'<form action="#">'
						+			  	'<fieldset>'
						+					'<select name="spec" id="spec" class="level" style="font-size: 13px; width:100%;">'
						+						' <option value="6">선수 출신</option>'
						+						' <option value="5">A조</option>'
						+						' <option value="4">B조</option>'
						+						' <option value="3">C조</option>'
						+						' <option value="2">D조</option>'
						+						' <option value="1" selected="selected">초심</option>'
						+				    '</select>'
						+			   ' </fieldset>'
						+		   ' </form>'
						+	   ' </div>'
				}
				var ori = $(".interest_table").html();
				$(".interest_table").html(ori
					+	'<tr height="50px" class="category_tr" id="'+ codeArr[i] +'">'
					+	'<td style="width:14%; border-radius: 10px">'
					+		'<image class="swimming_img" src="../resources/images/pictogram/'+nameArr[i]+'.png" onerror="this.src=\'../resources/images/pictogram/picto_default.png\'" style="height: 30px; width: 30px; float: right;">'
					+	'</td>'
					+	'<td style="width:25%; text-align: left">'
					+		'<font size="2.5px">&nbsp;&nbsp;&nbsp;'+nameArr[i]+'</font>'
					+	'</td>'
					+	'<td style="width:29%; text-align: center;">'
					+		'<div class="demo">'
					+			'<form action="#">'
					+			 	' <fieldset>'
					+				   ' <select name="spec" id="spec" class="career" style="font-size: 13px; width:100%;">'
					+						'  <option selected="selected" value="0">경력 없음</option>'
					+						' <option value="1">1년 미만</option>'
					+						' <option value="3">1년 ~ 3년</option>'
					+						' <option value="5">3년 ~ 5년</option>'
					+						'  <option value="10">5년 ~ 10년</option>'
					+				   		'  <option value="11">10년 이상</option>'
					+				    '</select>'
					+			   ' </fieldset>'
					+		   ' </form>'
					+	   ' </div>'
					+	'</td>'
					+	'<td id="level_td">'
					+	option_html
					+	'</td>'
					+'</tr>	'
				);
			}
			
			$("#profile_modify").css("display", "block");
			$("#modify_interest").css("display", "none");
		});
		
	</script>
