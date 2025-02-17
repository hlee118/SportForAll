package com.sportsfactory.sportforall.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class AccountDto {

	// require parameters
	private int USER_ID;
	private String PASSWORD;
	private String USER_NAME;
	private String BIRTHDAY;
	private int SEX;
	private int USER_LEVEL;
	private int USER_POINT;
	private String PHONE_NUMBER;
	private String EMAIL;
	private String IS_DELETED;
	private String DATE_CREATE;
	private String PROFILE;
	private String PROFILE_BACKGROUND;
	private String DATE_DELETE;
	private int SNS_MARKETING;
	private int EMAIL_MARKETING;
	private int LOCATION_CODE;
	private String SPORTS_TYPE_CODE;
	private int PUSH_ALRAM;
	
	private String LOCATION_SI;
	private String LOCATION_GU;
	private String SPORTS_NAME;
	private String SPORTS_CATEGORY;
	
	private String KEYWORD;
	
	private int FED_CODE;
	
	private String AGE;
	
	public int getLOCATION_CODE() {
		return LOCATION_CODE;
	}

	public void setLOCATION_CODE(int lOCATION_CODE) {
		LOCATION_CODE = lOCATION_CODE;
	}

	public String getSPORTS_TYPE_CODE() {
		return SPORTS_TYPE_CODE;
	}

	public void setSPORTS_TYPE_CODE(String sPORTS_TYPE_CODE) {
		SPORTS_TYPE_CODE = sPORTS_TYPE_CODE;
	}
	
	
	public String getSPORTS_NAME() {
		return SPORTS_NAME;
	}

	public void setSPORTS_NAME(String sPORTS_NAME) {
		SPORTS_NAME = sPORTS_NAME;
	}

	public String getSPORTS_CATEGORY() {
		return SPORTS_CATEGORY;
	}

	public void setSPORTS_CATEGORY(String sPORTS_CATEGORY) {
		SPORTS_CATEGORY = sPORTS_CATEGORY;
	}

	public String getLOCATION_SI() {
		return LOCATION_SI;
	}

	public void setLOCATION_SI(String lOCATION_SI) {
		LOCATION_SI = lOCATION_SI;
	}

	public String getLOCATION_GU() {
		return LOCATION_GU;
	}

	public void setLOCATION_GU(String lOCATION_GU) {
		LOCATION_GU = lOCATION_GU;
	}

	public AccountDto() {
		// TODO Auto-generated constructor stub
	}

	public int getSNS_MARKETING() {
		return SNS_MARKETING;
	}

	public void setSNS_MARKETING(int sNS_MARKETING) {
		SNS_MARKETING = sNS_MARKETING;
	}

	public int getEMAIL_MARKETING() {
		return EMAIL_MARKETING;
	}

	public void setEMAIL_MARKETING(int eMAIL_MARKETING) {
		EMAIL_MARKETING = eMAIL_MARKETING;
	}

	public int getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public String getBIRTHDAY() {
		return BIRTHDAY;
	}

	public void setBIRTHDAY(String bIRTHDAY) {
		BIRTHDAY = bIRTHDAY;
	}

	public int getSEX() {
		return SEX;
	}

	public void setSEX(int sEX) {
		SEX = sEX;
	}

	public int getUSER_LEVEL() {
		return USER_LEVEL;
	}

	public void setUSER_LEVEL(int uSER_LEVEL) {
		USER_LEVEL = uSER_LEVEL;
	}

	public int getUSER_POINT() {
		return USER_POINT;
	}

	public void setUSER_POINT(int uSER_POINT) {
		USER_POINT = uSER_POINT;
	}

	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}

	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getIS_DELETED() {
		return IS_DELETED;
	}

	public void setIS_DELETED(String iS_DELETED) {
		IS_DELETED = iS_DELETED;
	}

	public String getDATE_CREATE() {
		return DATE_CREATE;
	}

	public void setDATE_CREATE(String dATE_CREATE) {
		DATE_CREATE = dATE_CREATE;
	}

	public String getPROFILE() {
		return PROFILE;
	}

	public void setPROFILE(String pROFILE) {
		PROFILE = pROFILE;
	}
	
	public String getPROFILE_BACKGROUND() {
		return PROFILE_BACKGROUND;
	}

	public void setPROFILE_BACKGROUND(String pROFILE_BACKGROUND) {
		PROFILE_BACKGROUND = pROFILE_BACKGROUND;
	}

	public String getDATE_DELETE() {
		return DATE_DELETE;
	}
	
	public void setDATE_DELETE(String dATE_DELETE) {
		DATE_DELETE = dATE_DELETE;
	}
	
	public int getPUSH_ALRAM() {
		return PUSH_ALRAM;
	}
	
	public void setPUSH_ALRAM(int pUSH_ALRAM) {
		PUSH_ALRAM = pUSH_ALRAM;
	}

	public String getKEYWORD() {
		return KEYWORD;
	}
	
	public void setKEYWORD(String kEYWORD) {
		KEYWORD = kEYWORD;
	}

	public int getFED_CODE() {
		return FED_CODE;
	}

	public void setFED_CODE(int fED_CODE) {
		FED_CODE = fED_CODE;
	}

	public String getAGE() {
		return AGE;
	}

	public void setAGE(String aGE) {
		AGE = aGE;
	}
	
}