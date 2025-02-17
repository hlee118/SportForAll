<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="dropdownButtonsWrapper" id="news">
	<div class="dropdownWrapper one second" id="news">
		<div class="dropdownButtonContainer one" id="news">
			<span class="dropdownSelected one" id="news">${news_state.SI}</span>
			<div class="caret one"></div>
		</div>
		<div class="dropdownListContainer one second closed leftAlign" id="news">
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit one">
					<input class="dropdownUnitValue" type="hidden" value="전국">
					<span class="dropdownUnitText">전국</span>
				</div>
			</div>
			<c:forEach items="${si}" var="list_si_news">
				<div class="dropdownUnitOuter">
					<div class="dropdownUnit one">
						<input class="dropdownUnitValue" type="hidden" value="${list_si_news.SI}">
						<span class="dropdownUnitText">${list_si_news.SI}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="dropdownWrapper two second" id="news">
		<div class="dropdownButtonContainer two" id="news">
			<span class="dropdownSelected two" id="news">${news_state.EVENT}</span>
			<div class="caret two"></div>
		</div>
		<div class="dropdownListContainer two second closed rightAlign" id="news">
			<div class="dropdownUnitOuter">
				<div class="dropdownUnit two">
					<input class="dropdownUnitValue" type="hidden" value="-1">
					<span class="dropdownUnitText">모든 종목</span>
				</div>
			</div>
			<c:forEach items="${event_news}" var="list_event_news">
				<div class="dropdownUnitOuter">
					<div class="dropdownUnit two">
						<input class="dropdownUnitValue" type="hidden" value="${list_event_news.EVENT_CODE}">
						<span class="dropdownUnitText">${list_event_news.EVENT}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div id="resultContentsWrapper">
	<c:forEach items="${result_news}" var="list_result_news">
		<div class="resultContent">
			<div class="resultImageContainer">
				<img class="resultImage" src="<c:url value="/resources/images/Info/news/${list_result_news.FRONT_PIC}" />" onerror="this.src='<c:url value="/resources/images/Info/news/default/${list_result_news.NAME}.jpg" />';" />
			</div>
			<div class="resultInfoContainer" id="resultTextWrapper">
				<div class="resultInfo" id="resultTitle_div">
					<span class="resultTitle">${list_result_news.NEWS_NAME}</span>
				</div>
				<div class="resultInfo" id="resultDateTime_div">
					<span class="resultDateTime">대회날짜:&nbsp;${list_result_news.FORMATTED_PLAN_DATE}</span>
				</div>
				<div class="resultInfo" id="resultAddress_div">
					<img id="addressImage" src="../resources/images/icon_location_gray.png"></img>
					<span class="resultAddress" id="resultAddress_span">${list_result_news.ADDRESS}</span>
				</div>
			</div>
			<div class="resultPictoContainer">
				<div class="pictoWrapper"><img src="../resources/images/pictogram/${list_result_news.NAME}.png" onerror="this.src='../resources/images/pictogram/축구.png'"></div>
				<div class="typeWrapper"><span class="type_span">${list_result_news.NAME}</span></div>
			</div>
			<input type="hidden" class="id" value="${list_result_news.NEWS_CODE}">
		</div>
	</c:forEach>
</div>
<div id="tail"></div>
<script>
	var click_flag_news = 0;
	var order_news = "";
	var page_news = 0;
	var load_flag_news = 0;
	var news_page = ".contentContainer#news ";
	$(function() {
		$(news_page+".dropdownUnit.one:contains('${news_state.SI}')").addClass("selected");
		$(news_page+".dropdownUnit.two:contains('${news_state.EVENT}')").addClass("selected");
		$(window).click(function(event) {
			var isDropdownButton = hasClass(event.target, "dropdownSelected") || hasClass(event.target, "caret") || hasClass(event.target, "dropdownButtonContainer");
			if(!isDropdownButton){
				$(news_page+".dropdownListContainer.opened").removeClass("opened").addClass("closed");
				$(news_page+".dropdownButtonContainer").css("border","0");
				$(news_page+".caret").css("background-image","url(../resources/images/arrow_down_gray.png)");
			}
		});
		$(news_page+".dropdownWrapper").click(function () {
			order_news = $(this).attr("class").split(" ")[1];
			if($(news_page+".dropdownListContainer."+order_news).hasClass("opened")){
				$(news_page+".dropdownListContainer."+order_news).removeClass("opened").addClass("closed");
				$(news_page+".dropdownButtonContainer").css("border","0");
				$(news_page+".caret."+order_news).css("background-image","url(../resources/images/arrow_down_gray.png)");
			}
			else{
				$(news_page+".dropdownListContainer."+order_news).removeClass("closed").addClass("opened");
				$(news_page+".dropdownButtonContainer."+order_news).css("border","solid 1px #008ae8");
				$(news_page+".dropdownButtonContainer."+order_news).css("border-bottom","0");
				$(news_page+".caret."+order_news).css("background-image","url(../resources/images/arrow_up.png)");
				$(news_page+".dropdownListContainer").not("."+order_news).removeClass("opened").addClass("closed");
				$(news_page+".dropdownButtonContainer").not("."+order_news).css("border","0");
				$(news_page+".dropdownButtonContainer").not("."+order_news).css("border-bottom","solid 1px #008ae8");
				$(news_page+".caret").not("."+order_news).css("background-image","url(../resources/images/arrow_down_gray.png)");
			}
		});
		$(news_page+".dropdownUnit").click(function () {
			clickDropdownUnitNews($(this));
		});
		$(news_page+".resultContent").click(function () {
			clickResultContentNews($(this));
		});
	});
	function clickResultContentNews(target){
		var si = "";
		var event = "";
		si = $(news_page+".dropdownSelected.one").html();
		event = $(news_page+".dropdownSelected.two").html();
		location.replace("./info_newsviewer.do?replace=infolistnews&NEWS_CODE="+target.children("input").val()+"&SI="+si+"&EVENT="+event);
	}
	function clickDropdownUnitNews(target){
		var si = "";
		var gu = "";
		var dong = "";
		var category = "";
		var event = "";
		var target_order = target.attr("class").split(" ")[1];
		page_news = 0;
		load_flag_news = 1;
		
		/*if(target.hasClass("one") && target.find(".dropdownUnitText").html() != "서울특별시"){
			alert("현재 서비스 준비중입니다.");
			return;
		}*/
		
		if(!target.hasClass("selected")){
			target.parent().parent().find(".selected").removeClass("selected");
			target.addClass("selected");
		}
		
		$(news_page+".dropdownSelected."+target_order).html(target.children(".dropdownUnitText").html());
		/*if(target_order == "two"){
			$(news_page+".dropdownSelected.three").html("종목");
		}*/
		
		si = $(news_page+".dropdownSelected.one").html();
		//category = $(news_page+".dropdownSelected.two").html();
		event = $(news_page+".dropdownSelected.two").html();
		
		/*if(target_order == "two"){
			ajax_info_get_event_dropdown("news", category, function(json) {
				var jsonObj = JSON.parse(JSON.stringify(json));
				$(news_page+".dropdownListContainer.three").empty();
				var format =	"<div class='dropdownUnit three'>"
							+		"<input class='dropdownUnitValue' type='hidden' value='-1'>"
							+		"<span class='dropdownUnitText'>모든 종목</span>"
							+	"</div>";
				$(news_page+".dropdownListContainer.three").append(format);
				jsonObj.forEach(function(element) {
					format =	"<div class='dropdownUnit three'>"
							+		"<input class='dropdownUnitValue' type='hidden' value='"+element.category_CODE+"'>"
							+		"<span class='dropdownUnitText'>"+element.name+"</span>"
							+	"</div>";
					$(news_page+".dropdownListContainer.three").append(format);
				});
				$(news_page+".dropdownUnit.three").off("click");
				$(news_page+".dropdownUnit.three").on("click", function() {
					clickDropdownUnitNews($(this));
				});
			});
		}*/
		
		ajax_info_get_news(si, gu, dong, category, event, 0, "news", "", function(json) {
			var jsonObj = JSON.parse(JSON.stringify(json));
			var format = "";
			$(news_page+"#resultContentsWrapper").empty();
			jsonObj.forEach(function(element) {
				format = makeContentFormat(element);
				$(news_page+"#resultContentsWrapper").append(format);
			});
			load_flag_news = 0;
			$(news_page+".resultContent").off("click");
			$(news_page+".resultContent").on("click", function() {
				clickResultContentNews($(this));
			});
		});
	}
	function news_scroll_loading(){
		if(load_flag_news == 0 && $(news_page+"#tail").offset().top-200 < $(window).scrollTop() + $(window).height()){
			load_flag_news = 1;
			page_news += 1;
			var si = $(news_page+".dropdownSelected.one").html();
			var gu = "";
			var dong = "";
			var category = "";
			var event = $(news_page+".dropdownSelected.two").html();
			console.log(page_news);
			ajax_info_get_news(si, gu, dong, category, event, page_news, "news", "", function(json) {
				var jsonObj = JSON.parse(JSON.stringify(json));
				var format = "";
				jsonObj.forEach(function(element) {
					format = makeContentFormat(element);
					$(news_page+"#resultContentsWrapper").append(format);
				});
				load_flag_news = 0;
				$(news_page+".resultContent").off("click");
				$(news_page+".resultContent").on("click", function() {
					clickResultContentNews($(this));
				});
			});
		}
	}
	function makeContentFormat(element){
		var format =	"<div class='resultContent'>"
					+		"<div class='resultImageContainer'>"
					+			"<img class='resultImage' src='<c:url value="/resources/images/Info/news/" />"+element.front_PIC+"' onerror='this.src=\"<c:url value="/resources/images/Info/news/default/" />"+element.name+".jpg\";' />"
					+		"</div>"
					+		"<div class='resultInfoContainer' id='resultTextWrapper'>"
					+			"<div class='resultInfo' id='resultTitle_div'>"
					+				"<span class='resultTitle'>"+element.news_NAME+"</span>"
					+			"</div>"
					+			"<div class='resultInfo' id='resultDateTime_div'>"
					+				"<span class='resultDateTime'>대회날짜:&nbsp;"+element.formatted_PLAN_DATE+"</span>"
					+			"</div>"
					+			"<div class='resultInfo' id='resultAddress_div'>"
					+				"<image id='addressImage' src='../resources/images/icon_location_gray.png'>&nbsp;"
					+				"<span class='resultAddress' id='resultAddress_span'>"+element.address+"</span>"
					+			"</div>"
					+		"</div>"
					+		"<div class='resultPictoContainer'>"
					+			"<div class='pictoWrapper'><image src='../resources/images/pictogram/"+element.name+".png' onerror='../resources/images/pictogram/축구.png'></div>"
					+			"<div class='typeWrapper'><span class='type_span'>"+element.name+"</span></div>"
					+		"</div>"						
					+		"<input type='hidden' class='id' value='"+element.news_CODE+"'>"
					+	"</div>";
		return format;
	}
</script>