<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="dropdownButtonsWrapper" id="facility">
	<div class="dropdownWrapper one forth" id="facility">
		<div class="dropdownButtonContainer one" id="facility">
			<span class="dropdownSelected one" id="facility">${facility_state.SI}</span>
			<div class="caret one"></div>
		</div>
		<div class="dropdownListContainer one forth leftAlign closed" id="facility">
			<c:forEach items="${si}" var="list_si_facility">
				<div class="dropdownUnitOuter">
					<div class="dropdownUnit one">
						<input class="dropdownUnitValue" type="hidden" value="${list_si_facility.SI}">
						<span class="dropdownUnitText">${list_si_facility.SI}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="dropdownWrapper two forth" id="facility">
		<div class="dropdownButtonContainer two" id="facility">
			<span class="dropdownSelected two" id="facility">${facility_state.GU}</span>
			<div class="caret two"></div>
		</div>
		<div class="dropdownListContainer two forth leftAlign closed" id="facility">
			<c:forEach items="${gu}" var="list_gu_facility">
				<div class="dropdownUnitOuter">
					<div class="dropdownUnit two">
						<input class="dropdownUnitValue" type="hidden" value="${list_gu_facility.LOCATION_CODE}">
						<span class="dropdownUnitText">${list_gu_facility.GU}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="dropdownWrapper three forth" id="facility">
		<div class="dropdownButtonContainer three" id="facility">
			<span class="dropdownSelected three" id="facility">${facility_state.DONG}</span>
			<div class="caret three"></div>
		</div>
		<div class="dropdownListContainer three forth leftAlign closed" id="facility">
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit three">
					<input class="dropdownUnitValue" type="hidden" value="-1">
					<span class="dropdownUnitText">전체</span>
				</div>
			</div>
			<!--<c:if test="${dong_facility eq null}">
				<div class="dropdownUnit three disabled"></div>
			</c:if>-->
			<c:forEach items="${dong_facility}" var="list_dong_facility">
				<div class="dropdownUnitOuter">
					<div class="dropdownUnit three">
						<input class="dropdownUnitValue" type="hidden" value="">
						<span class="dropdownUnitText">${list_dong_facility.DONG}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="dropdownWrapper four forth" id="facility">
		<div class="dropdownButtonContainer four" id="facility">
			<span class="dropdownSelected four" id="facility">${facility_state.EVENT}</span>
			<div class="caret four"></div>
		</div>
		<div class="dropdownListContainer four forth rightAlign closed" id="facility">
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="-1">
					<span class="dropdownUnitText">모든 종목</span>
				</div>
			</div>
				<!--<c:forEach items="${event_facility}" var="list_event_facility">
					<div class="dropdownUnit four">
						<input class="dropdownUnitValue" type="hidden" value="${list_event_facility.CATEGORY_CODE}">
						<span class="dropdownUnitText">${list_event_facility.NAME}</span>
					</div>
				</c:forEach>-->
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="1">
					<span class="dropdownUnitText">축구</span>
				</div>
			</div>
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="3">
					<span class="dropdownUnitText">풋살</span>
				</div>
			</div>
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="5">
					<span class="dropdownUnitText">농구</span>
				</div>
			</div>
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="4">
					<span class="dropdownUnitText">야구</span>
				</div>
			</div>
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="2">
					<span class="dropdownUnitText">족구</span>
				</div>
			</div>
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="8">
					<span class="dropdownUnitText">테니스</span>
				</div>
			</div>
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="7">
					<span class="dropdownUnitText">배드민턴</span>
				</div>
			</div>
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="24">
					<span class="dropdownUnitText">수영</span>
				</div>
			</div>
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit four">
					<input class="dropdownUnitValue" type="hidden" value="28">
					<span class="dropdownUnitText">게이트볼</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="facilityResultContentsWrapper">
	<c:forEach items="${result_facility}" var="list_result_facility">
		<div class="facilityResultContent">
			<div class="facilityResultImageContainer" style="background: #cccccc url('<c:url value="/resources/images/Info/facility/${list_result_facility.NAME}.jpg" />') no-repeat; background-size: cover;"></div>
			<div class="facilityResultTitleContainer"><span class="facilityResultTitle">${list_result_facility.FACILITY_NAME}</span></div>
			<input type="hidden" class="id" value="${list_result_facility.FACILITY_CODE}">
		</div>
	</c:forEach>
</div>
<div id="tail"></div>
<script>
	var click_flag_facility = 0;
	var order_facility = "";
	var page_facility = 0;
	var load_flag_facility = 0;
	var facility_page = ".contentContainer#facility ";
	$(function() {
		$(facility_page+".dropdownUnit.one:contains('${facility_state.SI}')").addClass("selected");
		$(facility_page+".dropdownUnit.two:contains('${facility_state.GU}')").addClass("selected");
		$(facility_page+".dropdownUnit.three:contains('${facility_state.DONG}')").addClass("selected");
		$(facility_page+".dropdownUnit.four:contains('${facility_state.EVENT}')").addClass("selected");
		$(window).click(function(event) {
			var isDropdownButton = hasClass(event.target, "dropdownSelected") || hasClass(event.target, "caret") || hasClass(event.target, "dropdownButtonContainer");
			if(!isDropdownButton){
				$(facility_page+".dropdownListContainer.opened").removeClass("opened").addClass("closed");
				$(facility_page+".dropdownButtonContainer").css("border","0");
				$(facility_page+".caret").css("background-image","url(../resources/images/arrow_down_gray.png)");
			}
			facility_resize();
		});
		$(facility_page+".dropdownWrapper").click(function () {
			order_facility = $(this).attr("class").split(" ")[1];
			if($(facility_page+".dropdownListContainer."+order_facility).hasClass("opened")){
				$(facility_page+".dropdownListContainer."+order_facility).removeClass("opened").addClass("closed");
				$(facility_page+".dropdownButtonContainer").css("border","0");
				$(facility_page+".caret."+order_facility).css("background-image","url(../resources/images/arrow_down_gray.png)");
			}
			else{
				$(facility_page+".dropdownListContainer."+order_facility).removeClass("closed").addClass("opened");
				$(facility_page+".dropdownButtonContainer."+order_facility).css("border","solid 1px #008ae8");
				$(facility_page+".dropdownButtonContainer."+order_facility).css("border-bottom","0");
				$(facility_page+".caret."+order_facility).css("background-image","url(../resources/images/arrow_up.png)");
				$(facility_page+".dropdownListContainer").not("."+order_facility).removeClass("opened").addClass("closed");
				$(facility_page+".dropdownButtonContainer").not("."+order_facility).css("border","0");
				$(facility_page+".dropdownButtonContainer").not("."+order_facility).css("border-bottom","solid 1px #008ae8");
				$(facility_page+".caret").not("."+order_facility).css("background-image","url(../resources/images/arrow_down_gray.png)");
			}
		});
		$(facility_page+".dropdownUnit").click(function () {
			clickDropdownUnitFacility($(this));
		});
		$(facility_page+".facilityResultContent").click(function () {
			clickResultContentFacility($(this));
		});
		facility_resize();
	});
	function clickResultContentFacility(target){
		var si = $(facility_page+".dropdownSelected.one").html();
		var gu = $(facility_page+".dropdownSelected.two").html();
		var dong = $(facility_page+".dropdownSelected.three").html();
		var category = "";
		var event = $(facility_page+".dropdownSelected.four").html();
		var page_tag = "facility";
		location.replace("info_mapviewer.do?replace=infolistfacility&FACILITY_CODE="+target.children("input").val()+"&PAGE_TAG="+page_tag+"&SI="+si+"&GU="+gu+"&DONG="+dong+"&EVENT="+event);
	}
	function clickDropdownUnitFacility(target){
		if(target.hasClass("disabled")){
			return;
		}
		var si = "";
		var gu = "";
		var dong = "";
		var category = "";
		var event = "";
		var target_order = target.attr("class").split(" ")[1];
		page_facility = 0;
		load_flag_facility = 1;
		
		if(target.hasClass("one") && target.find(".dropdownUnitText").html() != "서울특별시"){
			alert("현재 서비스 준비중입니다.");
			return;
		}
		
		if(!target.hasClass("selected")){
			target.parent().parent().find(".selected").removeClass("selected");
			target.addClass("selected");
		}
		
		$(facility_page+".dropdownSelected."+target_order).html(target.children(".dropdownUnitText").html());
		if(target_order == "one"){
			$(facility_page+".dropdownSelected.two").html("시군구");
		}
		else if(target_order == "two"){
			$(facility_page+".dropdownSelected.three").html("전체");
		}
		
		si = $(facility_page+".dropdownSelected.one").html();
		gu = $(facility_page+".dropdownSelected.two").html();
		dong = $(facility_page+".dropdownSelected.three").html();
		event = $(facility_page+".dropdownSelected.four").html();
		
		if(target_order == "one"){
			ajax_info_get_gu("facility", si, function(json) {
				var jsonObj = JSON.parse(JSON.stringify(json));
				$(facility_page+".dropdownListContainer.two").empty();
				var format = "";
				jsonObj.forEach(function(element) {
					format =	"<div class='dropdownUnitOuter'>"
							+		"<div class='dropdownUnit two'>"
							+			"<input class='dropdownUnitValue' type='hidden' value='"+element.location_CODE+"'>"
							+			"<span class='dropdownUnitText'>"+element.gu+"</span>"
							+		"</div>"
							+	"</div>";
					$(facility_page+".dropdownListContainer.two").append(format);
				});
				$(facility_page+".dropdownUnit.two").off("click");
				$(facility_page+".dropdownUnit.two").on("click", function() {
					clickDropdownUnitFacility($(this));
				});
			});
			facility_resize();
		}
		else if(target_order == "two"){
			ajax_info_get_dong("facility", gu, function(json) {
				var jsonObj = JSON.parse(JSON.stringify(json));
				$(facility_page+".dropdownListContainer.three").empty();
				var format =	"<div class='dropdownUnitOuter'><div class='dropdownUnit three'>"
							+		"<input class='dropdownUnitValue' type='hidden' value='-1'>"
							+		"<span class='dropdownUnitText'>전체</span>"
							+	"</div></div>";
				$(facility_page+".dropdownListContainer.three").append(format);
				jsonObj.forEach(function(element) {
					format =	"<div class='dropdownUnitOuter'><div class='dropdownUnit three'>"
							+		"<input class='dropdownUnitValue' type='hidden' value='"+element.location_CODE+"'>"
							+		"<span class='dropdownUnitText'>"+element.dong+"</span>"
							+	"</div></div>";
					$(facility_page+".dropdownListContainer.three").append(format);
				});
				$(facility_page+".dropdownUnit.three").off("click");
				$(facility_page+".dropdownUnit.three").on("click", function() {
					clickDropdownUnitFacility($(this));
				});
			});
		}
		
		ajax_info_get_facility(si, gu, dong, category, event, 0, "facility", "", function(json) {
			var jsonObj = JSON.parse(JSON.stringify(json));
			var format = "";
			$(facility_page+"#facilityResultContentsWrapper").empty();
			jsonObj.forEach(function(element) {
				format =	"<div class='facilityResultContent'>"
						+		"<div class='facilityResultImageContainer' style='background: #cccccc url(\"<c:url value='/resources/images/Info/facility/"+element.name+".jpg' />\") no-repeat; background-size: cover;'></div>"
						+		"<div class='facilityResultTitleContainer'>"
						+			"<span class='facilityResultTitle'>"+element.facility_NAME+"</span>"
						+		"</div>"
						+		"<input type='hidden' class='id' value='"+element.facility_CODE+"'>"
						+	"</div>";
				$(facility_page+"#facilityResultContentsWrapper").append(format);
			});
			load_flag_facility = 0;
			$(facility_page+".facilityResultContent").off("click");
			$(facility_page+".facilityResultContent").on("click", function() {
				clickResultContentFacility($(this));
			});
			facility_resize();
		});
	}
	function facility_scroll_loading(){
		if(load_flag_facility == 0 && $(facility_page+"#tail").offset().top-200 < $(window).scrollTop() + $(window).height()){
			load_flag_facility = 1;
			page_facility += 1;
			var si = $(facility_page+".dropdownSelected.one").html();
			var gu = $(facility_page+".dropdownSelected.two").html();
			var dong = $(facility_page+".dropdownSelected.three").html();
			var category = "";
			var event = $(facility_page+".dropdownSelected.four").html();
			ajax_info_get_facility(si, gu, dong, category, event, page_facility, "facility", "", function(json) {
				var jsonObj = JSON.parse(JSON.stringify(json));
				var format = "";
				console.log(jsonObj);
				jsonObj.forEach(function(element) {
					format =	"<div class='facilityResultContent'>"
							+		"<div class='facilityResultImageContainer' style='background: #cccccc url(\"<c:url value='/resources/images/Info/facility/"+element.name+".jpg' />\") no-repeat; background-size: cover;'></div>"
							+		"<div class='facilityResultTitleContainer'>"
							+			"<span class='facilityResultTitle'>"+element.facility_NAME+"</span>"
							+		"</div>"
							+		"<input type='hidden' class='id' value='"+element.facility_CODE+"'>"
							+	"</div>";
					$(facility_page+"#facilityResultContentsWrapper").append(format);
				});
				load_flag_facility = 0;
				$(facility_page+".facilityResultContent").off("click");
				$(facility_page+".facilityResultContent").on("click", function() {
					clickResultContentFacility($(this));
				});
			});
			facility_resize();
		}
	}
	function facility_resize(){
		$(".facilityResultImageContainer").height($(window).width()*33/100);
		$(".facilityResultTitleContainer ").height($(window).width()*11/100);
	}
</script>