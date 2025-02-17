package com.sportsfactory.sportforall.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.sportsfactory.sportforall.dao.AccountDao;
import com.sportsfactory.sportforall.dao.CertifiDao;
import com.sportsfactory.sportforall.dao.ClubDao;
import com.sportsfactory.sportforall.dao.HomeDao;
import com.sportsfactory.sportforall.dao.InfoDao;
import com.sportsfactory.sportforall.dto.AccountDto;
import com.sportsfactory.sportforall.dto.CertificationDto;
import com.sportsfactory.sportforall.dto.ClubDto;
import com.sportsfactory.sportforall.dto.ClubInviteDto;
import com.sportsfactory.sportforall.dto.ClubUserDto;
import com.sportsfactory.sportforall.dto.HomeAlarmDto;
import com.sportsfactory.sportforall.dto.InfoDto;
import com.sportsfactory.sportforall.dto.InfoEventDto;
import com.sportsfactory.sportforall.dto.InfoNewsDto;
import com.sportsfactory.sportforall.dto.JsonDto;
import com.sportsfactory.sportforall.dto.UserInterestDto;
import com.sportsfactory.sportforall.sms.CertificationKeyGenerator;
import com.sportsfactory.sportforall.sms.SMSFactory;
import com.sportsfactory.sportforall.util.CommonUtil;

public class AccountService {
	
	private static Logger log = Logger.getLogger(AccountService.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	public void getUserInfo(AccountDto dto, Model model){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		
		//TODO user_id없을때 예외처리
		AccountDto info = dao.getUserInfo(dto);
		model.addAttribute("user_info", info);
	}
	
	public void inserUserInfo(AccountDto dto){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		dao.insertUserInfo(dto);
	}
	
	public Object login(AccountDto dto, boolean auto_login, HttpServletResponse response){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		AccountDto user = dao.login(dto);
		
		JsonDto vo = new JsonDto();
		if(user!=null){
			vo.setRESULT(1);
			
			//이미 존재하는 user_id 는 초기화
		    Cookie oc = new Cookie("user_id", null) ;
		    oc.setComment("user_id");
		    oc.setPath("/");
		    oc.setMaxAge(0) ;
		    response.addCookie(oc) ;
			
			int user_id = user.getUSER_ID();
			Cookie c = new Cookie("user_id", String.valueOf(user_id)) ;
			c.setComment("user_id");
			c.setPath("/");
			if(auto_login)
				c.setMaxAge(365*60*60*24);	//1년
			else
				c.setMaxAge(60*30);			//30분
			response.addCookie(c);
		} else {
			vo.setRESULT(0);
		}
		
		return vo;
	}
	
	public void updateUserLoc(AccountDto dto, String user_id){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		
		dto.setUSER_ID(Integer.parseInt(user_id));
		dao.updateUserLoc(dto);
	}
	
	public Object updateUserInterest(String arr, int user_id){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		
		UserInterestDto dto = new UserInterestDto();
		dto.setUSER_ID(user_id);
		dto.setCAREER(1);
		dto.setLEVEL(1);
		
		String[] categorys = arr.split(",");
		for(int i=0;i<categorys.length;i++){
			dto.setCATEGORY_CODE(Integer.parseInt(categorys[i]));
			dao.insertUserInterest(dto);
		}
		
		JsonDto vo = new JsonDto();
		vo.setRESULT(1);
		return vo;
	}
	
	public Object idCheck(AccountDto dto){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		
		AccountDto user = dao.idCheck(dto);
		JsonDto vo = new JsonDto();
		
		if(user!=null){
			//같은 이메일의 유저가 존재하는 것
			vo.setRESULT(1);
		} else {
			vo.setRESULT(0);
		}
		
		return vo;
	}
	
	public void searchUserInvite(AccountDto Adto, HttpServletRequest request, Model model, String user_id){
		model.addAttribute("IS_FED", 0);
		String key = request.getParameter("USER_NAME");
		if(key != null && !key.equals("")){
			searchUser(Adto, request, model);
			checkIfInvited(request, user_id, model);
		}
	}

	public void searchUser(AccountDto Adto, HttpServletRequest request, Model model) {
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		String input_value = Adto.getUSER_NAME();
		if(input_value != null && !input_value.equals("")){
			Adto.setEMAIL(input_value);
			Adto.setPHONE_NUMBER(input_value);
			ArrayList<AccountDto> Adtos = dao.getUserSearch(Adto);
			request.setAttribute("userList", Adtos);
		}
	}

	public void checkIfInvited(HttpServletRequest request, String user_id, Model model) {
		ArrayList<AccountDto> Adtos = (ArrayList<AccountDto>)request.getAttribute("userList");
		AccountDto Adto = null;
		int club_code = Integer.parseInt(request.getParameter("club_code")); 
		int invite_user = Integer.parseInt(user_id);
		ClubInviteDto CIdto = null;
		//ArrayList<ClubInviteDto> CIdtos = null;
		ArrayList<ClubInviteDto> result = new ArrayList<ClubInviteDto>();
		ClubUserDto CUdto = new ClubUserDto();
		ClubDao Cdao = sqlSession.getMapper(ClubDao.class);
		
		for(int i = 0; i < Adtos.size(); i++){
			Adto = Adtos.get(i);
			CUdto.setCLUB_CODE(club_code);
			CUdto.setUSER_ID(Adto.getUSER_ID());
			//여기서 이미 회원인지 확인 후 회원이 아니면 다음 멤버 조사
			if(Cdao.isClubMember(CUdto) == 0){
				CIdto = new ClubInviteDto();
				CIdto.setCLUB_CODE(club_code);
				CIdto.setUSER_ID(Adto.getUSER_ID());
				CIdto.setINVITE_USER(invite_user);
				/*CIdtos = Cdao.getSameInvite(CIdto);
				//여기서 이미 초대됬는지 확인하고 플래그 부여
				if(CIdtos.size() != 0){	// 초대된 적은 있을 때
					CIdto.setINVITE_STATE(CIdtos.get(0).getINVITE_STATE());
				}
				else{	// 초대된 적이 없을 때
					CIdto.setINVITE_STATE(-1);
				}*/
				CIdto.setUSER_NAME(Adto.getUSER_NAME());
				CIdto.setPROFILE(Adto.getPROFILE());
				result.add(CIdto);
			}
		}
		if(result.size() != 0){
			model.addAttribute("userListInvite", result);
		}
	}

	public void getHomeInfo(Model model, String user_id) {
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		
		AccountDto Adto = dao.getUserInfoByInt(Integer.parseInt(user_id));
		model.addAttribute("USER_INFO",Adto);
		model.addAttribute("USER_NAME", Adto.getUSER_NAME());
		
		/* 관심 종목 중 랜덤 선택하고 그중에서 랜덤 동호회(없으면 나머지 다 확인) -> 나중에 쓸모 있을지도...
		UserInterestDto UIdto = new UserInterestDto();
		UIdto.setUSER_ID(Adto.getUSER_ID());
		ArrayList<UserInterestDto> UIdtos = dao.getUserInterest(UIdto);
		*/
		
		getAlarmCount(model, Adto);
		getRecommendedClub(model, Adto/*, UIdtos*/);
		//getBestClub(model, Adto);
		getInterestingNews(model, Adto);
		getRecommendedFacility(model, Adto);
		getRecommendedEvent(model);
	}

	private void getRecommendedEvent(Model model) {
		InfoDao dao = sqlSession.getMapper(InfoDao.class);
		/*InfoEventDto IEdto = new InfoEventDto();
		IEdto.setKEYWORD("");
		IEdto.setPAGE(0);
		ArrayList<InfoEventDto> IEdtos = dao.getEventList(IEdto);
		model.addAttribute("event_list", IEdtos);*/
		
		// 이건 지정한 컨텐츠 나오게 하는 코드(DAILY_EVENT 테이블)
		// InfoEventDto IEdto = dao.getRecommendedEventForUser();
		
		// 이건 랜덤으로 나오게 하는 코드
		InfoEventDto IEdto = dao.getRandomEventForUser();
		model.addAttribute("recommended_event", IEdto);
	}

	private void getRecommendedClub(Model model, AccountDto Adto/*, ArrayList<UserInterestDto> UIdtos*/){
		/* 관심 종목 중 랜덤 선택하고 그중에서 랜덤 동호회(없으면 나머지 다 확인) -> 나중에 쓸모 있을지도...
		ClubDao dao = sqlSession.getMapper(ClubDao.class);
		Random random = new Random();
		if(UIdtos.size() < 1){
			model.addAttribute("recommended_club_flag", 1);
			return;
		}
		int rnd = random.nextInt(UIdtos.size());
		ArrayList<ClubDto> Cdtos = new ArrayList<ClubDto>();

		UserInterestDto UIdto = UIdtos.get(rnd);
		ClubDto Cdto = new ClubDto();
		Cdto.setSPORTS_TYPE_CODE(UIdto.getCATEGORY_CODE());
		Cdto.setLOCATION_CODE(Adto.getLOCATION_CODE());
		Cdtos = dao.getClubListForUser(Cdto);
		int idx = 1;
		while(Cdtos.size() < 1 && idx < UIdtos.size()){
			UIdto = UIdtos.get((rnd+idx)%UIdtos.size());
			Cdto.setSPORTS_TYPE_CODE(UIdto.getCATEGORY_CODE());
			Cdtos = dao.getClubListForUser(Cdto);
			idx++;
		}
		if(Cdtos.size() < 1){
			model.addAttribute("recommended_club_flag", 2);
			return;
		}
		rnd = random.nextInt(Cdtos.size());
		Cdto = Cdtos.get(rnd);
		model.addAttribute("recommended_club_flag", 0);
		model.addAttribute("recommended_club", Cdto);
		*/
		ClubDao dao = sqlSession.getMapper(ClubDao.class);
		Random random = new Random();
		ClubDto Cdto = new ClubDto();
		Cdto.setLOCATION_CODE(Adto.getLOCATION_CODE());
		ArrayList<ClubDto> Cdtos = dao.getClubListForUser(Cdto);
		if(Cdtos.size() < 1){
			model.addAttribute("recommended_club_flag", 2);
			return;
		}
		int rnd = random.nextInt(Cdtos.size());
		Cdto = Cdtos.get(rnd);
		model.addAttribute("recommended_club_flag", 0);
		model.addAttribute("recommended_club", Cdto);
	}
	
	private void getBestClub(Model model, AccountDto Adto){
		ClubDao dao = sqlSession.getMapper(ClubDao.class);
		ClubDto Cdto = new ClubDto();
		Cdto.setLOCATION_CODE(Adto.getLOCATION_CODE());
		ArrayList<ClubDto> Cdtos = dao.getClubListForUser(Cdto);
		if(Cdtos.size() < 1){
			model.addAttribute("best_club_flag", 1);
			return;
		}
		Cdto = Cdtos.get(0);
		model.addAttribute("best_club_flag", 0);
		model.addAttribute("best_club", Cdto);
	}
	
	private void getInterestingNews(Model model, AccountDto Adto) {
		InfoDao dao = sqlSession.getMapper(InfoDao.class);
		ArrayList<InfoNewsDto> INdtos = dao.getNewsListForUser(Adto);
		model.addAttribute("news_list", INdtos);
	}

	public Object getAlarmList(HomeAlarmDto HAdto, Model model, String user_id) {
		HomeDao dao = sqlSession.getMapper(HomeDao.class);
		HAdto.setUSER_ID(Integer.parseInt(user_id));
		ArrayList<HomeAlarmDto> HAdtos = null;
		HAdto.setPAGE(HAdto.getPAGE()*20);
		if(HAdto.getPAGE() == 0){
			HAdtos = dao.getResponseAlarmListWeek(HAdto);
			model.addAttribute("top_alarm_list",HAdtos);
			log.error("getTopAlarmList!");
		}
		HAdtos = dao.getAlarmList(HAdto);
		model.addAttribute("alarm_list", HAdtos);
		return HAdtos;
	}

	public void readAlarm(HomeAlarmDto HAdto, Model model, String user_id) {
		HomeDao dao = sqlSession.getMapper(HomeDao.class);
		HAdto.setUSER_ID(Integer.parseInt(user_id));
		dao.readAlarm(HAdto);
	}

	private void getAlarmCount(Model model, AccountDto Adto) {
		HomeDao dao = sqlSession.getMapper(HomeDao.class);
		HomeAlarmDto HAdto = dao.getAlarmCount(Adto);
		model.addAttribute("alarm_count",HAdto.getALARM_COUNT());
	}
	
	public Object setCertificationKey(CertificationDto dto){
		CertifiDao dao = sqlSession.getMapper(CertifiDao.class);
		AccountDao Adao = sqlSession.getMapper(AccountDao.class);
		String phone = dto.getPHONE();
		
		AccountDto Adto = new AccountDto();
		Adto.setPHONE_NUMBER(phone.replaceAll("-", ""));
		AccountDto reDto = Adao.phoneCheck(Adto);
		if(reDto!=null){
			JsonDto vo = new JsonDto();
			vo.setRESULT(0);
			return vo;
		}
		
		try {
			//인증키 생성
			String tempKey = CertificationKeyGenerator.newInstance().tempKeyGenarator(phone);
			log.error("암호화키 : "+tempKey);

			//이전 인증키 삭제
			dto.setTEMPKEY(tempKey);
			dto.setPHONE(phone);
			dao.deleteTempKey(dto);
			
			//SMS를 보내기위해 작업
			SMSFactory smsFactory = new SMSFactory(tempKey, phone);
			if(smsFactory.Send()){
				//sms로 발송한 신규 인증키를 db에 삽입
				log.error("sms 전송 완료");
				dao.insertCertificationKey(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JsonDto vo = new JsonDto();
		vo.setRESULT(1);
		return vo;
	}
	
	public Object setFindCertificationKey(CertificationDto dto){
		CertifiDao dao = sqlSession.getMapper(CertifiDao.class);
		AccountDao Adao = sqlSession.getMapper(AccountDao.class);
		String phone = dto.getPHONE();
		
		AccountDto Adto = new AccountDto();
		Adto.setPHONE_NUMBER(phone.replaceAll("-", ""));
		AccountDto reDto = Adao.phoneCheck(Adto);
		if(reDto==null){
			JsonDto vo = new JsonDto();
			vo.setRESULT(0);
			return vo;
		}
		
		try {
			//인증키 생성
			String tempKey = CertificationKeyGenerator.newInstance().tempKeyGenarator(phone);
			log.error("암호화키 : "+tempKey);

			//이전 인증키 삭제
			dto.setTEMPKEY(tempKey);
			dto.setPHONE(phone);
			dao.deleteTempKey(dto);
			
			//SMS를 보내기위해 작업
			SMSFactory smsFactory = new SMSFactory(tempKey, phone);
			if(smsFactory.Send()){
				//sms로 발송한 신규 인증키를 db에 삽입
				log.error("sms 전송 완료");
				dao.insertCertificationKey(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JsonDto vo = new JsonDto();
		vo.setRESULT(1);
		return vo;
	}
	
	public Object certifyNumber(CertificationDto dto){
		CertifiDao dao = sqlSession.getMapper(CertifiDao.class);
		String tempkey = dto.getTEMPKEY();
		String dbkey = dao.getTempKey(dto);
		
		//임시키와 인풋키 공백제거
		tempkey = tempkey.trim();
		if(dbkey!=null)
			dbkey = dbkey.trim();
		
		JsonDto vo = new JsonDto();
		if(tempkey.equalsIgnoreCase(dbkey)){
			vo.setRESULT(1);
			//디비에 누적된 임시키 삭제
			dao.deleteTempKey(dto);
		} else {
			vo.setRESULT(0);
		}
		
		return vo;
	}
	
	public Object findId(AccountDto dto){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		AccountDto user_info = dao.findId(dto);
		
		JsonDto vo = new JsonDto();
		if(user_info!=null){
			vo.setRESULT(1);
			vo.setVALUE(user_info);
		} else {
			vo.setRESULT(0);
		}
		return vo;
	}
	
	public Object findPassword(AccountDto dto){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		AccountDto user_info = dao.findPassword(dto);
		
		log.error(dto.getEMAIL());
		log.error(dto.getUSER_NAME());
		log.error(dto.getPHONE_NUMBER());
		
		JsonDto vo = new JsonDto();
		if(user_info!=null){
			vo.setRESULT(1);
			vo.setVALUE(user_info);
		} else {
			vo.setRESULT(0);
		}
		return vo;
	}
	
	public Object newPassword(AccountDto dto){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		dao.newPassword(dto);
		
		JsonDto vo = new JsonDto();
		vo.setRESULT(1);
		return vo;
	}

	private void getRecommendedFacility(Model model, AccountDto Adto) {
		InfoDao dao = sqlSession.getMapper(InfoDao.class);
		ArrayList<InfoDto> Idtos = dao.getRecommendedFacilityForUser(Adto);
		ArrayList<InfoDto> RIdtos = new ArrayList<InfoDto>();
		if(Idtos.size() < 6){
			model.addAttribute("facility_list", Idtos);
		}
		else{
			Random random = new Random();
			int rnd = 0;
			InfoDto Idto = null;
			for(int i = 0; i < 5; i++){
				rnd = random.nextInt(Idtos.size());
				while(Idtos.get(rnd).getIS_ZZIMED() == 0){
					rnd++;
				}
				RIdtos.add(Idtos.get(rnd));
				Idto = Idtos.get(rnd);
				Idto.setIS_ZZIMED(0);
				Idtos.set(rnd, Idto);
			}
			model.addAttribute("facility_list", RIdtos);
		}
	}
	
	public Object passwordCheck(AccountDto dto, int user_id){
		AccountDao dao = sqlSession.getMapper(AccountDao.class);
		dto.setUSER_ID(user_id);
		AccountDto reDto = dao.passwordCheck(dto);
		
		JsonDto vo = new JsonDto();
		if(reDto==null)
			vo.setRESULT(0);
		else
			vo.setRESULT(1);
		
		return vo;
	}

	public Object acceptClubInvite(ClubInviteDto CIdto) {
		JsonDto Jdto = new JsonDto();
		ClubDao dao = sqlSession.getMapper(ClubDao.class);
		ClubUserDto CUdto = new ClubUserDto();
		
		Jdto.setRESULT(1);
		
		CUdto.setCLUB_CODE(CIdto.getCLUB_CODE());
		CUdto.setUSER_ID(CIdto.getUSER_ID());
		CUdto.setUSER_LEVEL(1);
		CUdto.setPOINT(500);
		dao.insertClubUser(CUdto);
		
		CIdto.setINVITE_USER(-1);
		CIdto.setINVITE_STATE(2);
		dao.setInviteState(CIdto);
		
		HomeDao Hdao = sqlSession.getMapper(HomeDao.class);
		HomeAlarmDto HAdto = new HomeAlarmDto();
		HAdto.setALARM_ID(CIdto.getALARM_ID());
		HAdto.setUSER_ID(CIdto.getUSER_ID());
		Hdao.readAlarm(HAdto);
		
		HAdto.setSUB_TYPE(2);
		Hdao.updateSubType(HAdto);
		
		return Jdto;
	}

	public Object rejectClubInvite(ClubInviteDto CIdto) {
		JsonDto Jdto = new JsonDto();
		ClubDao dao = sqlSession.getMapper(ClubDao.class);
		
		Jdto.setRESULT(1);
		
		CIdto.setINVITE_USER(-1);
		CIdto.setINVITE_STATE(1);
		dao.setInviteState(CIdto);
		
		HomeDao Hdao = sqlSession.getMapper(HomeDao.class);
		HomeAlarmDto HAdto = new HomeAlarmDto();
		HAdto.setALARM_ID(CIdto.getALARM_ID());
		HAdto.setUSER_ID(CIdto.getUSER_ID());
		Hdao.readAlarm(HAdto);
		
		HAdto.setSUB_TYPE(3);
		Hdao.updateSubType(HAdto);
		
		return Jdto;
	}
	
}
