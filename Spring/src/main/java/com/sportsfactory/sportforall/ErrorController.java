package com.sportsfactory.sportforall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportsfactory.sportforall.dto.AccountDto;
import com.sportsfactory.sportforall.service.AccountService;
import com.sportsfactory.sportforall.service.LocationService;
import com.sportsfactory.sportforall.service.SportsTypeService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/error")
public class ErrorController {
	
	private static Logger log = Logger.getLogger(ErrorController.class);
	
	@RequestMapping(value="/throwable")
	public String throwable(HttpServletRequest request, Model model){
		pageErrorLog(request);
		model.addAttribute("msg", "예외가 발생하였습니다.");
		return "/error/index";
	}
	
	@RequestMapping(value="/exception")
	public String exception(HttpServletRequest request, Model model){
		pageErrorLog(request);
		model.addAttribute("msg", "예외가 발생하였습니다.");
		return "/error/index";
	}
	
	@RequestMapping(value="/400")
	public String pageError400(HttpServletRequest request, Model model){
		pageErrorLog(request);
		model.addAttribute("msg", "잘못된 요청입니다.");
		model.addAttribute("request_uri", request.getAttribute("javax.servlet.error.request_uri"));
		return "/error/index";
	}
	
	@RequestMapping(value="/403")
	public String pageError403(HttpServletRequest request, Model model){
		pageErrorLog(request);
		model.addAttribute("msg", "접근이 금지되었습니다.");
		return "/error/index";
	}
	
	@RequestMapping(value="/404")
	public String pageError404(HttpServletRequest request, Model model){
		pageErrorLog(request);
		model.addAttribute("msg", "요청하신 페이지는 존재하지 않습니다.");
		return "/error/index";
	}
	
	@RequestMapping(value="/405")
	public String pageError405(HttpServletRequest request, Model model){
		pageErrorLog(request);
		model.addAttribute("msg", "요청된 메소드가 허용되지 않습니다.");
		return "/error/index";
	}
	
	@RequestMapping(value="/500")
	public String pageError500(HttpServletRequest request, Model model){
		pageErrorLog(request);
		model.addAttribute("msg", "서버에 오류가 발생하였습니다.");
		return "/error/index";
	}
	
	@RequestMapping(value="/503")
	public String pageError503(HttpServletRequest request, Model model){
		pageErrorLog(request);
		model.addAttribute("msg", "서비스를 사용할 수 없습니다.");
		return "/error/index";
	}
	
	private void pageErrorLog(HttpServletRequest request){
		log.info("status_code : " + request.getAttribute("javax.servlet.error.status_code"));
		log.info("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
		log.info("message : " + request.getAttribute("javax.servlet.error.message"));
		log.info("request_uri : " + request.getAttribute("javax.servlet.error.request_uri"));
		log.info("exception : " + request.getAttribute("javax.servlet.error.exception"));
		log.info("servlet_name : " + request.getAttribute("javax.servlet.error.servlet_name"));
	}
}
