<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/club_dialog.css?ver=1'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/resources/js/dialog.js'/>"></script>

<body>
<div id="dialog_is_closed" class="dialog">
	<div id="popupTitleWrapper" align="center"><span id="popupTitleSpan">공개 여부를 설정해주세요</span></div>
	<div class="popupBodyContainer">
		<div class="popupOpt" id="btnOpened">
			<div class="popupOptSpanFirstWrapper">공개글</div>
			<div class="popupOptImage"></div>
			<div class="popupOptSecond">공개로 설정 시, 비회원도 볼 수 있습니다.</div>
		</div>
		<div class="popupOpt" id="btnClosed">
			<div class="popupOptSpanFirstWrapper"><span class="popupOptSpanFirst">비공개글</span></div>
			<div class="popupOptImage"></div>
			<div class="popupOptSecond">비공개 설정 시, 회원만 볼 수 있습니다.</div>
		</div>
	</div>
	<div id="popupFooterContainer">
		<span id="btnCancel">취소</span>
		<span id="btnSubmit">확인</span>
	</div>
	<input type="hidden" name="isOpened" id="isOpened" value="0">
</div>

<script>
	//게시판과 사진첩에서 호출가능
	//Default : 게시판
	var category = "board";
	
	//첫번째 옵션을 선택하였을경우
	$("#dialog_is_closed #btnOpened").click(function() {
		$("#dialog_is_closed #btnOpened .popupOptImage").addClass("selected");
		$("#dialog_is_closed #btnClosed .popupOptImage").removeClass("selected");
	});
	
	//두번째 옵션을 선택하였을경우
	$("#dialog_is_closed #btnClosed").click(function() {
		$("#dialog_is_closed #btnOpened .popupOptImage").removeClass("selected");
		$("#dialog_is_closed #btnClosed .popupOptImage").addClass("selected");
	});
	
	//취소버튼
	$("#dialog_is_closed #btnCancel").click(function() {
		$("#blurAll").css("display","none");
		$("#dialog_is_closed").css("display","none");
	});
	
	//확인버튼
	$("#dialog_is_closed #btnSubmit").click(function() {
		$("#blurAll").css("display","none");
		$("#dialog_is_closed").css("display","none");
		
		var isOpened = "0";
		var img = $("#dialog_is_closed #btnOpened .popupOptImage");
		if(img.hasClass("selected"))
			isOpened = "1";
		var parameterString;
		switch(category){
			case "board":
				parameterString = "";
				if("${param.si}" != ""){
					parameterString += "&si=${param.si}";
				}
				if("${param.gu}" != ""){
					parameterString += "&gu=${param.gu}";
				}
				if("${param.category}" != ""){
					parameterString += "&category=${param.category}";
				}
				if("${param.sportsName}" != ""){
					parameterString += "&sportsName=${param.sportsName}";
				}
				location.href="./club_detail_board_write.do?replace=clubdetailboard&club_code="+$("#ClubCode").val()+"&isOpened="+isOpened+"&mode=board"+"&scrollTop="+$(window).scrollTop()+"&keyword="+$("#InitialKeyword").val()+parameterString;
				break;
				
			case "board_fed":
				parameterString = "";
				if("${param.si}" != ""){
					parameterString += "&si=${param.si}";
				}
				if("${param.gu}" != ""){
					parameterString += "&gu=${param.gu}";
				}
				if("${param.category}" != ""){
					parameterString += "&category=${param.category}";
				}
				if("${param.sportsName}" != ""){
					parameterString += "&sportsName=${param.sportsName}";
				}
				location.href="./fed_detail_board_write.do?replace=feddetailboard&FED_CODE=${param.FED_CODE}&IS_OPEN="+isOpened+parameterString;
				break;
				
			case "album":
				android_album(isOpened);
				break;
		}
			
	});
	
	//초기화
	function open_is_closed_dialog(flag){
		category = flag;
		
		$("#blurAll").css("display","block");
		$("#dialog_is_closed").css("display","block");
		
		$("#dialog_is_closed").css("width", $(window).width()*21/25);
		$("#dialog_is_closed").css("height", "270px");
		$("#dialog_is_closed").css("left", $(window).width()*2/25);
		$("#dialog_is_closed").css("top", $(window).scrollTop() + $(window).height()*3/20);
		
		$("#blurAll").css("width", $(document).width());
		$("#blurAll").css("height", $(document).height());
		
		$("#dialog_is_closed #btnOpened .popupOptImage").addClass("selected");
		$("#dialog_is_closed #btnClosed .popupOptImage").removeClass("selected");
		
		if(category == "board_fed"){
			$("#dialog_is_closed *").addClass("fed");
		}
	}
	
</script>
