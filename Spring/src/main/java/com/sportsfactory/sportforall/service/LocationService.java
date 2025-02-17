package com.sportsfactory.sportforall.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.sportsfactory.sportforall.AccountController;
import com.sportsfactory.sportforall.dao.AccountDao;
import com.sportsfactory.sportforall.dao.LocationDao;
import com.sportsfactory.sportforall.dto.AccountDto;
import com.sportsfactory.sportforall.dto.JsonDto;
import com.sportsfactory.sportforall.dto.LocationDto;
import com.sportsfactory.sportforall.dto.SportsTypeDto;
import com.sportsfactory.sportforall.util.CommonUtil;

public class LocationService {
	
	private static Logger log = Logger.getLogger(LocationService.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	public void getSi(Model model){
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		model.addAttribute("LocationSI", dao.getSi());
	}
	
	public void getGu(LocationDto dto, Model model){
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		model.addAttribute("LocationGU", dao.getGu(dto));
	}
	
	public void getAllGu(HttpServletRequest request, Model model){
		LocationDao dao = sqlSession.getMapper(LocationDao.class);
		model.addAttribute("LocationAllGU", dao.getAllGu());
	}
}
