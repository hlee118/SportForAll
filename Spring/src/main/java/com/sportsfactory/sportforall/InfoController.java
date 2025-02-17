package com.sportsfactory.sportforall;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportsfactory.sportforall.dao.AccountDao;
import com.sportsfactory.sportforall.dto.AccountDto;
import com.sportsfactory.sportforall.dto.InfoDto;
import com.sportsfactory.sportforall.dto.InfoEventDto;
import com.sportsfactory.sportforall.dto.InfoNewsDto;
import com.sportsfactory.sportforall.dto.JsonDto;
import com.sportsfactory.sportforall.dto.LocationDto;
import com.sportsfactory.sportforall.dto.SportsTypeDto;
import com.sportsfactory.sportforall.dto.StateDto;
import com.sportsfactory.sportforall.service.AccountService;
import com.sportsfactory.sportforall.service.InfoService;
import com.sportsfactory.sportforall.util.CommonUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/info")
public class InfoController {
	
	private static Logger log = Logger.getLogger(InfoController.class);

	@Autowired
	private InfoService infoService;
	
	@RequestMapping(value = "/")
	public String root(@ModelAttribute StateDto Sdto, Model model, @CookieValue("user_id") String user_id) {
		infoService.getInfo(Sdto, model, user_id);
		return "info/index";
	}
	
	@RequestMapping(value = "/test.do")
	public String test(@ModelAttribute StateDto Sdto, Model model, @CookieValue("user_id") String user_id) {
		infoService.getInfo(Sdto, model, user_id);
		return "info/test";
	}
	
	@RequestMapping(value = "/index.do")
	public String index(@ModelAttribute StateDto Sdto/*, HttpServletRequest request*/, Model model, @CookieValue("user_id") String user_id) {
		/*HttpSession session = request.getSession();
		log.error("index.sessionID : "+session.getId());
		InfoDto Idto = (InfoDto)session.getAttribute("returnState");
		if(Idto != null){
			Sdto.setPAGE_TAG(Idto.getPAGE_TAG());
			Sdto.setSI(Idto.getSI());
			Sdto.setGU(Idto.getGU());
			Sdto.setDONG(Idto.getDONG());
			Sdto.setCATEGORY(Idto.getCATEGORY());
			Sdto.setEVENT(Idto.getEVENT());
		}*/
		infoService.getInfo(Sdto, model, user_id);
		return "info/index";
	}

	@RequestMapping(value = "/info_get_event_dropdown.do")
	public @ResponseBody Object info_get_event_dropdown(@ModelAttribute StateDto Sdto, Model model) {
		Object vo = infoService.getEventDropdown(Sdto, model);
		return vo;
	}

	@RequestMapping(value = "/info_get_news.do")
	public @ResponseBody Object info_get_news(@ModelAttribute StateDto Sdto, Model model) {
		Object vo = infoService.getNewsContent(Sdto, model);
		return vo;
	}

	@RequestMapping(value = "/info_get_gu.do")
	public @ResponseBody Object info_get_gu(@ModelAttribute StateDto Sdto, Model model) {
		Object vo = infoService.getGu(Sdto, model);
		return vo;
	}

	@RequestMapping(value = "/info_get_dong.do")
	public @ResponseBody Object info_get_dong(@ModelAttribute StateDto Sdto, Model model) {
		Object vo = infoService.getDong(Sdto, model);
		return vo;
	}

	@RequestMapping(value = "/info_get_facility.do")
	public @ResponseBody Object info_get_facility(@ModelAttribute StateDto Sdto, Model model) {
		log.error(Sdto.getPAGE()+Sdto.getPAGE_TAG());
		Object vo = infoService.getFacilityContent(Sdto, model);
		return vo;
	}

	@RequestMapping(value = "/info_mapviewer.do")
	public String info_mapviewer(@ModelAttribute InfoDto Idto/*, HttpServletRequest request*/, Model model, @CookieValue("user_id") String user_id) {
		infoService.getFacilityInfo(Idto, model, user_id);
		/*HttpSession session = request.getSession();
		log.error("info_mapviewer.sessionID : "+session.getId());
		session.setAttribute("returnState", Idto);*/
		return "info/map_viewer";
	}

	@RequestMapping(value = "/info_newsviewer.do")
	public String info_newsviewer(@ModelAttribute InfoNewsDto INdto, Model model, @CookieValue("user_id") String user_id) {
		infoService.getNewsInfo(INdto, model, user_id);
		return "info/news_viewer";
	}
	
	@RequestMapping(value = "/zzim_info_news.do")
	public @ResponseBody Object zzim_info_news(@ModelAttribute InfoNewsDto dto, Model model, @CookieValue("user_id") String user_id) {
		return infoService.zzimInfoNews(dto, model, user_id);
	}
	
	@RequestMapping(value = "/zzim_info_facility.do")
	public @ResponseBody Object zzim_info_facility(@ModelAttribute InfoDto dto, Model model, @CookieValue("user_id") String user_id) {
		return infoService.zzimInfoFacility(dto, model, user_id);
	}
	
	@RequestMapping(value = "/search.do")
	public String search(@ModelAttribute StateDto Sdto, Model model, @CookieValue("user_id") String user_id) {
		return "info/search";
	}

	@RequestMapping(value = "/info_get_event.do")
	public @ResponseBody Object info_get_event(@ModelAttribute StateDto Sdto, Model model) {
		log.error(Sdto.getPAGE()+Sdto.getPAGE_TAG());
		Object vo = infoService.getEventContent(Sdto, model);
		return vo;
	}

	@RequestMapping(value = "/info_contentviewer.do")
	public String info_contentviewer(@ModelAttribute InfoEventDto IEdto, Model model, @CookieValue("user_id") String user_id) {
		infoService.getEventInfo(IEdto, model, user_id);
		return "info/content_viewer";
	}
	
	@RequestMapping(value = "/zzim_info_event.do")
	public @ResponseBody Object zzim_info_event(@ModelAttribute InfoEventDto dto, Model model, @CookieValue("user_id") String user_id) {
		return infoService.zzimInfoEvent(dto, model, user_id);
	}

	@RequestMapping(value = "/info_contenteditor.do")
	public String info_contenteditor(@ModelAttribute InfoEventDto IEdto, Model model, @CookieValue("user_id") String user_id) {
		infoService.getEventEditor(IEdto, model, user_id);
		model.addAttribute("IS_EDIT", 1);
		return "info/content_viewer";
	}

	@RequestMapping(value = "/insert_info_content_link.do")
	public @ResponseBody Object insert_info_content_link(@ModelAttribute InfoEventDto IEdto) {
		infoService.insertInfoContentLink(IEdto);
		return null;
	}
	
	@RequestMapping(value = "/news_wide_viewer.do")
	public String news_wide_viewer() {
		return "info/news_wide_viewer";
	}

}
