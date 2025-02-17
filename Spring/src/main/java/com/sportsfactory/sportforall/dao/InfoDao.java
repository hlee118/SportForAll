package com.sportsfactory.sportforall.dao;

import java.util.ArrayList;

import com.sportsfactory.sportforall.dto.AccountDto;
import com.sportsfactory.sportforall.dto.LocationDto;
import com.sportsfactory.sportforall.dto.SportsTypeDto;
import com.sportsfactory.sportforall.dto.StateDto;
import com.sportsfactory.sportforall.dto.InfoDto;
import com.sportsfactory.sportforall.dto.InfoEventDto;
import com.sportsfactory.sportforall.dto.InfoNewsDto;

public interface InfoDao {
	ArrayList<InfoNewsDto> getNewsList(InfoNewsDto idto);
	AccountDto getUserSetting(AccountDto adto);
	ArrayList<InfoDto> getFacilityList(InfoDto idto);
	InfoDto getFacilityInfo(InfoDto idto);
	InfoNewsDto getNewsInfo(InfoNewsDto iNdto);
	int newsIsZzimed(InfoNewsDto iNdto);
	void zzimThisNews(InfoNewsDto iNdto);
	void diszzimThisNews(InfoNewsDto iNdto);
	int facilityIsZzimed(InfoDto idto);
	void zzimThisFacility(InfoDto idto);
	void diszzimThisFacility(InfoDto idto);
	ArrayList<InfoNewsDto> getNewsPicture(InfoNewsDto iNdto);
	ArrayList<InfoDto> getFacilityPicture(InfoDto idto);
	ArrayList<InfoEventDto> getEventList(InfoEventDto iEdto);
	InfoEventDto getEventInfo(InfoEventDto iEdto);
	int eventIsZzimed(InfoEventDto idto);
	void zzimThisEvent(InfoEventDto iEdto);
	void diszzimThisEvent(InfoEventDto iEdto);
	ArrayList<InfoNewsDto> getNewsListForUser(AccountDto adto);
	ArrayList<InfoDto> getRecommendedFacilityForUser(AccountDto adto);
	InfoEventDto getRecommendedEventForUser();
	void insertInfoContentLink(InfoEventDto iEdto);
	ArrayList<InfoEventDto> getEventLink(InfoEventDto iEdto);
	ArrayList<StateDto> getAllUserEventMatchNews(AccountDto adto);
	ArrayList<StateDto> getNewsEvent();
	InfoEventDto getRandomEventForUser();
}