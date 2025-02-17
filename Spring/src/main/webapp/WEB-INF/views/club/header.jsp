<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/swiper.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/swiper.club_detail.css?ver=4'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/header.css?ver=1'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/footer.css?v=2'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/club.css?ver=15'/>" rel="stylesheet">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/jquery.v2.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/ajax.js?ver=6'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/swiper.jquery.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/textarearownum.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/refinestring.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/resizefont.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery.cropit.js'/>"></script>
	<script type="text/javascript">
		var getParameter = function (param) {
			var returnValue;
			var url = location.href;
			var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
			for (var i = 0; i < parameters.length; i++) {
				var varName = parameters[i].split('=')[0];
				if (varName.toUpperCase() == param.toUpperCase()) {
					returnValue = parameters[i].split('=')[1];
					return decodeURIComponent(returnValue);
				}
			}
		};
	</script>
	
	<script>
		$(window).bind("pageshow", function(event) {
		    if (event.originalEvent.persisted) {
		        document.location.reload();
		    }
		});
	</script>
</head>