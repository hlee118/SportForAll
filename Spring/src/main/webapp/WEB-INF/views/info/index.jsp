<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
</head>
<body>
<div class="header">
	<div class="title">생활체육정보</div>
	<div class="right_btn"><img id="search" src="<c:url value="/resources/images/icon_검색.png" />" /></div>
</div>

<script>
	$("#search").click(function() {
		var nextreplace = "";
		if(page_tag == "news"){
			nextreplace = "infolistnews";
		}
		else if(page_tag == "facility"){
			nextreplace = "infolistfacility";
		}
		else if(page_tag == "event"){
			nextreplace = "infolistevent";
		}
		location.replace("./search.do?replace="+nextreplace+"&page_tag="+page_tag);
	});
</script>
<div id="tabButtonsWrapper">
	<div class="tabButtonWrapper" id="news">
		<span class="tabButtonText" id="news">대회소식</span>
		<div class="tabButtonUnderline" id="news"></div>
	</div>
	<div class="tabButtonWrapper" id="facility">
		<span class="tabButtonText" id="facility">체육시설</span>
		<div class="tabButtonUnderline" id="facility"></div>
	</div>
	<div class="tabButtonWrapper" id="event">
		<span class="tabButtonText" id="event">스포츠 컨텐츠</span>
		<div class="tabButtonUnderline" id="event"></div>
	</div>
</div>
<div id="adContainer">
	<img src="<c:url value="" />" />
</div>
<div id="contentsWrapper">
	<div class="contentContainer" id="news">
		<%@ include file="./list_news.jsp" %>
	</div>
	<div class="contentContainer" id="facility">
		<%@ include file="./list_facility.jsp" %>
	</div>
	<div class="contentContainer" id="event">
		<%@ include file="./list_event.jsp" %>
	</div>
</div>
<script>
	var page_tag = "${page_tag}";
	var i = 0;
	$(function(){
		if(page_tag == ""){
			page_tag = "news";
		}
		$(".tabButtonWrapper#"+page_tag).removeClass("other");
		$(".tabButtonWrapper#"+page_tag).siblings().not("#"+page_tag).addClass("other");
		$(".contentContainer#"+page_tag).removeClass("other");
		$(".contentContainer#"+page_tag).siblings().not("#"+page_tag).addClass("other");
		
		// 처음에 시설 요소(버튼,페이지,밑줄)을 눌리지 않았을 때의 속성으로 초기화
		$(".contentContainer.other").css("display","none");
		$(".contentContainer.other > div").css("display","none");
		$(".tabButtonWrapper.other .tabButtonUnderline").css({"color":"#ffffff", "background-color":"#ffffff"});
		$(".tabButtonWrapper#"+page_tag+" .tabButtonText").css({"color":"#008ae8", "font-family":"NanumSquareB"});
		$(".tabButtonWrapper.other .tabButtonText").css({"color":"#000000", "font-family":"NanumSquareR"});

		switch(page_tag){
		case "news":
			$("#adContainer img").attr("src","<c:url value='/resources/images/생활체육시설_배너7.png' />");
			break;
		case "facility":
			$("#adContainer img").attr("src","<c:url value='/resources/images/생활체육시설_배너8.png' />");
			break;
		case "event":
			$("#adContainer img").attr("src","<c:url value='/resources/images/스포츠콘텐츠_배너1.png' />");
			break;
		}
	});
	$(".tabButtonWrapper").click(function () {
		$(window).scrollTop(0);
		i = 0;
		page_tag = $(this).attr("id");
		$(".tabButtonWrapper#"+page_tag).removeClass("other");
		$(".tabButtonWrapper#"+page_tag).siblings().not("#"+page_tag).addClass("other");
		$(".contentContainer#"+page_tag).removeClass("other");
		$(".contentContainer#"+page_tag).siblings().not("#"+page_tag).addClass("other");
		
		$(".tabButtonWrapper#"+page_tag+" .tabButtonUnderline").css({"color":"#008ae8", "background-color":"#008ae8"});
		$(".tabButtonWrapper#"+page_tag+" .tabButtonText").css({"color":"#008ae8", "font-family":"NanumSquareB"});
		$(".contentContainer#"+page_tag).css("display","");
		$(".contentContainer#"+page_tag+" > div").css("display","");
		$(".contentContainer#"+page_tag).css("opacity","0");
		$(".contentContainer#"+page_tag+" > div").css("opacity","0");
		
		$(".tabButtonWrapper.other .tabButtonUnderline").css({"color":"#ffffff", "background-color":"#ffffff"});
		$(".tabButtonWrapper.other .tabButtonText").css({"color":"#000000", "font-family":"NanumSquareR"});
		$(".contentContainer.other").css("display","none");
		$(".contentContainer.other > div").css("display","none");
		var timer = setInterval(function() {
			if(i>1) {
				clearInterval(timer);
			}
			i+=0.01;
			$(".contentContainer#"+page_tag).css("opacity",String(i));
			$(".contentContainer#"+page_tag+" > div").css("opacity",String(i));
		});
		
		switch(page_tag){
		case "news":
			$("#adContainer img").attr("src","<c:url value='/resources/images/생활체육시설_배너7.png' />");
			break;
		case "facility":
			$("#adContainer img").attr("src","<c:url value='/resources/images/생활체육시설_배너8.png' />");
			break;
		case "event":
			$("#adContainer img").attr("src","<c:url value='/resources/images/스포츠콘텐츠_배너1.png' />");
			break;
		}
	});
	$(window).scroll(function() {
		switch($(".tabButtonWrapper").not(".other").attr("id")){
		case "news":
			news_scroll_loading();
			break;
		case "facility":
			facility_scroll_loading();
			break;
		case "event":
			event_scroll_loading();
			break;
		}
	});
	function hasClass(element, cls) {
	    return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
	}
</script>
<%@ include file="../common/backeventjs.jsp" %>
<%@ include file="../common/index_footer.jsp" %>