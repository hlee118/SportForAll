<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<link href="<c:url value='/resources/css/club_inquiry_response_view.css'/>" rel="stylesheet">

<body>
	<%@ include file="../common/backeventjs.jsp" %>
	<div class="header">
		<div class="title">답변글</div>
		<div class="left_btn"><img src="<c:url value="/resources/images/icon_back.png" />"/></div>
		<div class="line"></div>
	</div>
	<script>
		$(".left_btn").click(function() {
			history.back();
		});
	</script>
	<c:if test="${response.DEPTH eq 2}">
		<div class="closed" id="roll_btn"><span id="roll_btn_span">문의글 펼치기</span></div>
		<div class="content" id="inquiry" style="display:none;">
			<div class="title_container">
				<span class="title">${inquiry.TITLE}</span>
			</div>
			<div class="writer_info_wrapper">
				<div class="writer_picture_container">
					<img class="writer_picture" src="/resources/upload/user/profile/${inquiry.PROFILE}" onerror="this.src='<c:url value="/resources/images/icon_프로필사진(공백).png" />'" />
				</div>
				<div class="writer_info_right_wrapper">
					<div class="writer_name_container">
						<span class="writer_name">${inquiry.USER_NAME}</span>
					</div>
					<div class="write_time_container">
						<span class="write_time">${inquiry.FORMATED_WRITE_DATE}&nbsp;${inquiry.FORMATED_WRITE_TIME}</span>
					</div>
				</div>
			</div>
			<div class="line"></div>
			<div class="main_content_container">
				<span class="main_content">${inquiry.CONTENT}</span>
			</div>
		</div>
		<script>
			$("#roll_btn").click(function() {
				var state = $(this).attr("class");
				if(state == "closed"){
					$(".content#inquiry").css("display","");
					$(this).removeClass("closed");
					$(this).addClass("opened");
					$("#roll_btn_span").html("문의글 접기");
				}
				else if(state == "opened"){
					$(".content#inquiry").css("display","none");
					$(this).removeClass("opened");
					$(this).addClass("closed");
					$("#roll_btn_span").html("문의글 펼치기");
				}
			});
		</script>
	</c:if>
	<div class="content" id="response">
		<div class="title_container">
			<span class="title">${response.TITLE}</span>
		</div>
		<div class="writer_info_wrapper" onclick="location.href='../myprofile/user_info.do?user_id=${response.WRITE_USER}';">
			<div class="writer_picture_container">
				<img class="writer_picture" src="${response.PROFILE}" onerror="this.src='<c:url value="/resources/images/icon_프로필사진(공백).png" />'" />
			</div>
			<div class="writer_info_right_wrapper">
				<div class="writer_name_container">
					<span class="writer_name">${response.USER_NAME}</span>
				</div>
				<div class="write_time_container">
					<span class="write_time">${response.FORMATED_WRITE_DATE}&nbsp;${response.FORMATED_WRITE_TIME}</span>
				</div>
			</div>
		</div>
		<div class="line"></div>
		<div class="main_content_container">
			<span class="main_content">${response.CONTENT}</span>
		</div>
	</div>
</body>
</html>