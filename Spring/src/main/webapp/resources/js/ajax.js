function ajax_login(email, pw, auto_login, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./account/login_post.do",
	    data : {EMAIL : email, PASSWORD : pw, auto_login:auto_login},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_id_check(email, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./id_check.do",
	    data : {EMAIL : email},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }   
	});
}

function ajax_join_submit(name, sex, birthday, phone_number, password, email, email_marketing, sns_marketing, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./join_ok.do",
	    data : {USER_NAME : name, SEX : sex, BIRTHDAY : birthday, PHONE_NUMBER : phone_number, PASSWORD : password, EMAIL : email, EMAIL_MARKETING : email_marketing, SNS_MARKETING : sns_marketing},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }   
	});
}

function ajax_interest_update(arr, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./update_interest.do",
	    data : {arr : arr.toString()},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_logout(callback){
	
	$.ajax({
	    type:"POST",
	    url:"./logout.do",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_update_title(title, album_code, is_closed, callback){
	
	$.ajax({
		type:"POST",
		url:"./update_title.do",
	    data : {title : title, album_code : album_code, is_closed : is_closed},
	    dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_like_board(board_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./like_this.do",
		data : {board_id : board_id},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_insert_comment(board_id, content, is_reply, parent_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./insert_comment.do",
		data : {board_id : board_id, content : content, is_reply : is_reply, parent_id : parent_id},
		dataType : "json",
        async: false,
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_insert_album_reply(album_code, reply, callback){
	
	$.ajax({
		type:"POST",
		url:"./insert_album_reply.do",
		data : {album_code : album_code, reply : reply},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_album_like(album_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_like.do",
		data : {album_code : album_code},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_album_dislike(album_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_dislike.do",
		data : {album_code : album_code},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_album_update(album_code, title, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_update.do",
		data : {album_code : album_code, title:title},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_auth_check(club_code, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./auth_check.do",
	    data : {club_code : club_code},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_insert_board(is_modify, board_id, club_code, title, content, is_open, notice_type, callback){
	
	$.ajax({
		type:"POST",
		url:"./club_board_insert.do",
		data : {is_modify : is_modify, board_id : board_id, club_code : club_code, title : title, content : content, is_open : is_open, notice_type : notice_type},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_select_board_more(club_code, num_load, last_bid, keyword, callback){
	
	$.ajax({
		type:"POST",
		url:"./club_board_select_more.do",
		data : {club_code : club_code, num_load : num_load, last_bid : last_bid, keyword : keyword},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        //alert(error);
	    }
	});
}

function ajax_delete_board(board_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./club_board_delete.do",
		data : {board_id : board_id},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_album_zzim(album_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_zzim.do",
		data : {album_code : album_code},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_album_zzim_cancel(album_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_zzim_cancel.do",
		data : {album_code : album_code},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_zzim_board(board_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./zzim_this.do",
		data : {board_id : board_id},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_insert_inquiry(is_modify, inquiry_id, club_code, title, content, inquiry_type, depth, parent_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./club_inquiry_insert.do",
		data : {is_modify : is_modify, inquiry_id : inquiry_id, club_code : club_code, title : title, content : content, inquiry_type : inquiry_type, depth : depth, parent_id : parent_id},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_album_search(word, club_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_search.do",
		data : {word:word, club_code:club_code},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_album_more(club_code, page, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_more.do",
		data : {club_code:club_code, page:page},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_album_search_more(word, search_page, club_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_search_more.do",
		data : {word:word, search_page:search_page, club_code:club_code},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_paid_list(club_code, year, month, callback){
	
	$.ajax({
		type:"POST",
		url:"./get_paid_list.do",
		data : {club_code:club_code, year:year, month:month},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_user_paid(user_id, club_code, year, month, callback){
	
	$.ajax({
		type:"POST",
		url:"./user_paid.do",
		data : {user_id:user_id, club_code:club_code, year:year, month:month},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_user_paid_cancel(user_id, club_code, year, month, callback){
	
	$.ajax({
		type:"POST",
		url:"./user_paid_cancel.do",
		data : {user_id:user_id, club_code:club_code, year:year, month:month},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_create_club(club_name,member_num,introduction,location_code,sports_type_code,establishment_year,club_type_code,club_target_code,callback){
	
	$.ajax({
		type:"POST",
		url:"./submit_club_create.do",
		data : {club_name : club_name, member_num : member_num, introduction : introduction, location_code : location_code, sports_type_code : sports_type_code, establishment_year : establishment_year, club_type_code : club_type_code, club_target_code : club_target_code},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_fee_list(club_code, year, month, callback){
	
	$.ajax({
		type:"POST",
		url:"./get_fee_list.do",
		data : {club_code:club_code, year:year, month:month},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_fee_update(club_code, year, month, fee, json_user, json_address_user, callback){
	
	$.ajax({
		type:"POST",
		url:"./fee_update.do",
		data : {club_code:club_code, year:year, month:month, fee:fee, json_user:json_user, json_address_user:json_address_user},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_edit_club_info(dbMapColumn, dbMapType, value, club_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./edit_club_info.do",
		data : {dbMapColumn:dbMapColumn, dbMapType:dbMapType, value:value, club_code:club_code},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_change_club_image(imageData, club_code, file_name, callback){
	
	$.ajax({
		type:"POST",
		url:"./change_club_image.do",
		data : {club_code:club_code, imageData:imageData, file_name:file_name},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_club_agree_delete(club_code, user_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./club_agree_delete.do",
		data : {club_code:club_code, user_id:user_id},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_confirm_delete_club(club_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./confirm_delete_club.do",
		data : {club_code:club_code},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_invite_user(club_code, user_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./invite_user.do",
		data : {CLUB_CODE:club_code, USER_ID:user_id},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_insert_address_user(club_code, name, date, callback){
	
	$.ajax({
		type:"POST",
		url:"./insert_address_user.do",
		data : {CLUB_CODE:club_code, USER_NAME:name, CREATED_DATE:date},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_add_log_search(keyword, callback){
	
	$.ajax({
		type:"POST",
		url:"./add_log_search.do",
		data : {KEYWORD:keyword},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_delete_address_user(club_code, user_address_code, date, callback){
	
	$.ajax({
		type:"POST",
		url:"./delete_address_user.do",
		data : {CLUB_CODE:club_code, USER_ADDRESS_CODE:user_address_code, DELETED_DATE:date},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_user_paid_address(code, club_code, date, callback){
	
	$.ajax({
		type:"POST",
		url:"./paid_address.do",
		data : {CLUB_CODE:club_code, USER_ADDRESS_CODE:code, DATE:date},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_user_paid_cancel_address(code, club_code, date, callback){
	
	$.ajax({
		type:"POST",
		url:"./paid_cancel_address.do",
		data : {CLUB_CODE:club_code, USER_ADDRESS_CODE:code, DATE:date},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_album_reply_edit(reply_code, reply, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_reply_edit.do",
		data : {REPLY_CODE:reply_code, REPLY:reply},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_album_reply_delete(reply_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./album_reply_delete.do",
		data : {REPLY_CODE:reply_code},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_club_list_more(page, si, gu, category, sportsName, callback){
	
	$.ajax({
		type:"POST",
		url:"./club_list_more.do",
		data : {page:page, si:si, gu:gu, category:category, sportsName:sportsName},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_club_list_search_more(page, keyword, callback){
	
	$.ajax({
		type:"POST",
		url:"./club_list_search_more.do",
		data : {PAGE_NUM:page, CLUB_NAME:keyword},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_push_check(callback){
	
	$.ajax({
		type:"POST",
		url:"./push_check.do",
		data : {},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_push_check_cancel(callback){
	
	$.ajax({
		type:"POST",
		url:"./push_check_cancel.do",
		data : {},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_info_get_event_dropdown(page_tag, category, callback){
	
	$.ajax({
		type:"POST",
		url:"./info_get_event_dropdown.do",
		data : {PAGE_TAG : page_tag, CATEGORY : category},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_info_get_news(si, gu, dong, category, event, page, page_tag, keyword, callback){
	
	$.ajax({
		type:"POST",
		url:"./info_get_news.do",
		data : {SI : si, GU : gu, DONG : dong, CATEGORY : category, EVENT : event, PAGE : page, PAGE_TAG : page_tag, KEYWORD : keyword},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_info_get_facility(si, gu, dong, category, event, page, page_tag, keyword, callback){
	
	$.ajax({
		type:"POST",
		url:"./info_get_facility.do",
		data : {SI : si, GU : gu, DONG : dong, CATEGORY : category, EVENT : event, PAGE : page, PAGE_TAG : page_tag, KEYWORD : keyword},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_info_get_gu(page_tag, si, callback){
	
	$.ajax({
		type:"POST",
		url:"./info_get_gu.do",
		data : {PAGE_TAG : page_tag, SI : si},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_info_get_dong(page_tag, gu, callback){
	
	$.ajax({
		type:"POST",
		url:"./info_get_dong.do",
		data : {PAGE_TAG : page_tag, GU : gu},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_password_check(email, pw, callback){
	
	$.ajax({
	    type:"POST",
	    url:"../account/password_check.do",
	    data : {EMAIL : email, PASSWORD : pw},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_password_update(pw, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./password_update.do",
	    data : {PASSWORD : pw},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_drop_out(callback){
	
	$.ajax({
	    type:"POST",
	    url:"./drop_out.do",
	    data : {},
	    dataType : "json",
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_getGU(si, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./getGU.do",
	    data : {SI : si},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}


function ajax_zzim_info_news(news_code, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./zzim_info_news.do",
	    data : {NEWS_CODE : news_code},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_zzim_info_facility(facility_code, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./zzim_info_facility.do",
	    data : {FACILITY_CODE : facility_code},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_info_get_event(page, page_tag, keyword, callback){
	
	$.ajax({
		type:"POST",
		url:"./info_get_event.do",
		data : {PAGE : page, PAGE_TAG : page_tag, KEYWORD : keyword},
		dataType : "json",
        async: false,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_zzim_info_event(event_code, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./zzim_info_event.do",
	    data : {EVENT_CODE : event_code},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_zzim_club(club_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./zzim_club.do",
		data : {club_code : club_code},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_read_alarm(alarm_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./read_alarm.do",
		data : {ALARM_ID : alarm_id},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			//alert(error);
		}
	});
}

function ajax_get_alarm_more(page, callback){
	
	$.ajax({
		type:"POST",
		url:"./get_alarm_more.do",
		data : {PAGE : page},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			//alert(error);
		}
	});
}

function ajax_get_certification_number(phone_number, callback){
	
	$.ajax({
		type:"POST",
		url:"./get_certification_number.do",
		data : {PHONE : phone_number},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_get_find_certification_number(phone_number, callback){
	
	$.ajax({
		type:"POST",
		url:"./get_find_certification_number.do",
		data : {PHONE : phone_number},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_insert_fed_inquiry(is_modify, inquiry_id, fed_code, title, content, inquiry_type, depth, parent_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./fed_inquiry_insert.do",
		data : {IS_MODIFY : is_modify, INQUIRY_ID : inquiry_id, FED_CODE : fed_code, TITLE : title, CONTENT : content, INQUIRY_TYPE : inquiry_type, DEPTH : depth, PARENT_ID : parent_id},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_certify_number(phone_number, tempkey, callback){
	
	$.ajax({
		type:"POST",
		url:"./certify_number.do",
		data : {PHONE:phone_number, TEMPKEY : tempkey},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}


function ajax_change_club_user_level(club_code, user_id, user_level, callback){
	
	$.ajax({
		type:"POST",
		url:"./change_club_user_level.do",
		data : {CLUB_CODE : club_code, USER_ID : user_id, USER_LEVEL : user_level},
		dataType : "json",
		async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_drop_fed_member(fed_code, club_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./drop_fed_member.do",
		data : {FED_CODE : fed_code, CLUB_CODE : club_code},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_invite_manager(fed_code, user_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./invite_manager.do",
		data : {FED_CODE : fed_code, USER_ID : user_id},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_invite_member(fed_code, club_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./invite_member.do",
		data : {FED_CODE : fed_code, CLUB_CODE : club_code},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_club_inquiry_more(club_code, last_iid, num_load, inquiry_type, callback){
	
	$.ajax({
		type:"POST",
		url:"./get_club_inquiry_more.do",
		data : {club_code : club_code, last_iid : last_iid, num_load : num_load, inquiry_type : inquiry_type},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_get_fed_inquiry_more(fed_code, last_iid, num_load, inquiry_type, callback){
	
	$.ajax({
		type:"POST",
		url:"./get_fed_inquiry_more.do",
		data : {FED_CODE : fed_code, INQUIRY_ID : last_iid, NUM_LOAD : num_load, INQUIRY_TYPE : inquiry_type},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_find_id(name, phone, callback){
	
	$.ajax({
		type:"POST",
		url:"./find_id.do",
		data : {USER_NAME : name, PHONE_NUMBER : phone},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_find_pw(id, name, phone, callback){
	
	$.ajax({
		type:"POST",
		url:"./find_pw.do",
		data : {EMAIL:id, USER_NAME : name, PHONE_NUMBER : phone},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_new_password(id, pw, callback){
	
	$.ajax({
	    type:"POST",
	    url:"./new_password.do",
	    data : {USER_ID:id, PASSWORD : pw},
	    dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_select_fed_board_more(fed_code, num_load, last_bid, keyword, callback){
	
	$.ajax({
		type:"POST",
		url:"./fed_board_select_more.do",
		data : {FED_CODE : fed_code, NUM_LOAD : num_load, LAST_BID : last_bid, KEYWORD : keyword},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	    	//alert(error);
	    }
	});
}

function ajax_zzim_fed_board(board_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./zzim_fed_board.do",
		data : {BOARD_ID : board_id},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_like_fed_board(board_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./like_fed_board.do",
		data : {BOARD_ID : board_id},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_modify_comment(comment_id, content, callback){
	
	$.ajax({
		type:"POST",
		url:"./modify_comment.do",
		data : {COMMENT_ID : comment_id, CONTENT : content},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_modify_fed_comment(comment_id, content, callback){
	
	$.ajax({
		type:"POST",
		url:"./modify_fed_comment.do",
		data : {COMMENT_ID : comment_id, CONTENT : content},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_delete_comment(comment_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./delete_comment.do",
		data : {COMMENT_ID : comment_id},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_delete_fed_comment(comment_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./delete_fed_comment.do",
		data : {COMMENT_ID : comment_id},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_insert_fed_comment(board_id, content, is_reply, parent_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./insert_fed_comment.do",
		data : {BOARD_ID : board_id, CONTENT : content, IS_REPLY : is_reply, PARENT_ID : parent_id},
		dataType : "json",
		success: function(json){
			
			callback(json);
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}

function ajax_insert_fed_board(is_modify, board_id, fed_code, title, content, is_open, notice_type, callback){
	
	$.ajax({
		type:"POST",
		url:"./fed_board_insert.do",
		data : {IS_MODIFY : is_modify, BOARD_ID : board_id, FED_CODE : fed_code, TITLE : title, CONTENT : content, IS_OPEN : is_open, NOTICE_TYPE : notice_type},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_delete_club_board(board_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./delete_club_board.do",
		data : {BOARD_ID : board_id},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_delete_fed_board(board_id, callback){
	
	$.ajax({
		type:"POST",
		url:"./delete_fed_board.do",
		data : {BOARD_ID : board_id},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_insert_info_content_link(event_code, href, top_p, left_p, width_s, height_s, callback){
	
	$.ajax({
		type:"POST",
		url:"./insert_info_content_link.do",
		data : {EVENT_CODE : event_code, HREF : href, TOP_P : top_p, LEFT_P : left_p, WIDTH_S : width_s, HEIGHT_S : height_s},
		dataType : "json",
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_club_name_overlap_check(club_name, callback){
	
	$.ajax({
		type:"POST",
		url:"./club_name_overlap_check.do",
		data : {CLUB_NAME : club_name},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_version(callback){
	
	$.ajax({
		type:"POST",
		url:"./get_version.do",
		data : {},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_get_user_photo_by_seq(user_id, photo_seq, callback){
	
	$.ajax({
		type:"POST",
		url:"./get_user_photo_by_seq.do",
		data : {USER_ID : user_id, PHOTO_SEQ : photo_seq},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_delete_user_photo_by_seq(user_id, photo_seq, callback){
	
	$.ajax({
		type:"POST",
		url:"./user_photo_delete.do",
		data : {USER_ID : user_id, PHOTO_SEQ : photo_seq},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_default_main_picture(club_code, callback){
	
	$.ajax({
		type:"POST",
		url:"./default_main_picture.do",
		data : {CLUB_CODE : club_code},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_drop_club_manager(club_code, user_id, callback){
	$.ajax({
		type:"POST",
		url:"./drop_club_manager.do",
		data : {CLUB_CODE : club_code, USER_ID:user_id},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_getout_from_club(club_code, callback){
	$.ajax({
		type:"POST",
		url:"./getout_from_club.do",
		data : {CLUB_CODE : club_code},
		dataType : "json",
        async: false,
	    success: function(json){
	    	
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_accept_club_invite(club_code, invite_id, alarm_id, callback){
	$.ajax({
		type:"POST",
		url:"./accept_club_invite.do",
		data : {CLUB_CODE : club_code, INVITE_ID : invite_id, ALARM_ID : alarm_id},
		dataType : "json",
        async: false,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}

function ajax_reject_club_invite(club_code, invite_id, alarm_id, callback){
	$.ajax({
		type:"POST",
		url:"./reject_club_invite.do",
		data : {CLUB_CODE : club_code, INVITE_ID : invite_id, ALARM_ID : alarm_id},
		dataType : "json",
        async: false,
	    success: function(json){
	    	callback(json);
	    },
	    error: function(xhr, status, error) {
	        alert(error);
	    }
	});
}


