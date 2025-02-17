package com.sportsfactory.sportforall.dto;

import java.sql.Timestamp;

public class ClubDto {

	//club_info 테이블
	private int CLUB_CODE;
	private String CLUB_NAME;
	private String LOGO_FILE;
	private String MAIN_PIC;
	private int RANKING;
	private int MEMBER_NUM;
	private int POINTS;
	private String EXERCISE_PLACE;
	private String EXERCISE_TIME;
	private String AGES;
	private int SKILL_POINT;
	private String MATCH_DATE;
	private String INTRODUCTION;
	private int IS_DELETED;
	private int DELETE_USER;
	private String DELETE_DATE;
	private String DELETE_TIME;
	private int LOCATION_CODE;
	private int SPORTS_TYPE_CODE;
	private String ESTABLISHMENT_YEAR;
	private int CLUB_TYPE_CODE;
	private int CLUB_TARGET_CODE;
	private int MEMBERSHIP_FEE;
	private int ACTIVE_POINTS;
	
	private int PAGE_NUM;
	private String KEYWORD;
	private int NUM_LOAD;
	private int LAST_BID;
	private int COUNT;
	
	//location_info, sports_type_info, club_type, club_zzim 테이블
	private String SI;
	private String GU;
	private String CATEGORY;
	private String SPORTS_NAME;
	private String CLUB_TYPE_NAME;
	private String CLUB_TYPE_TAG;
	private String CLUB_TARGET_NAME;
	private String CLUB_TARGET_TAG;
	private int IS_ZZIMED;
	private int WRITE_USER;
	
	private int FED_CODE;
	private String FED_NAME;
	private int MEMBER_STATUS;
	private int USER_LEVEL;
	
	public int getCLUB_CODE() {
		return CLUB_CODE;
	}
	public void setCLUB_CODE(int cLUB_CODE) {
		CLUB_CODE = cLUB_CODE;
	}
	public String getCLUB_NAME() {
		return CLUB_NAME;
	}
	public void setCLUB_NAME(String cLUB_NAME) {
		CLUB_NAME = cLUB_NAME;
	}
	public String getLOGO_FILE() {
		return LOGO_FILE;
	}
	public void setLOGO_FILE(String lOGO_FILE) {
		LOGO_FILE = lOGO_FILE;
	}
	public String getMAIN_PIC() {
		return MAIN_PIC;
	}
	public void setMAIN_PIC(String mAIN_PIC) {
		MAIN_PIC = mAIN_PIC;
	}
	public int getRANKING() {
		return RANKING;
	}
	public void setRANKING(int rANKING) {
		RANKING = rANKING;
	}
	public int getMEMBER_NUM() {
		return MEMBER_NUM;
	}
	public void setMEMBER_NUM(int mEMBER_NUM) {
		MEMBER_NUM = mEMBER_NUM;
	}
	public int getPOINTS() {
		return POINTS;
	}
	public void setPOINTS(int pOINTS) {
		POINTS = pOINTS;
	}
	public String getEXERCISE_PLACE() {
		return EXERCISE_PLACE;
	}
	public void setEXERCISE_PLACE(String eXERCISE_PLACE) {
		EXERCISE_PLACE = eXERCISE_PLACE;
	}
	public String getEXERCISE_TIME() {
		return EXERCISE_TIME;
	}
	public void setEXERCISE_TIME(String eXERCISE_TIME) {
		EXERCISE_TIME = eXERCISE_TIME;
	}
	public String getAGES() {
		return AGES;
	}
	public void setAGES(String aGES) {
		AGES = aGES;
	}
	public int getSKILL_POINT() {
		return SKILL_POINT;
	}
	public void setSKILL_POINT(int sKILL_POINT) {
		SKILL_POINT = sKILL_POINT;
	}
	public String getMATCH_DATE() {
		return MATCH_DATE;
	}
	public void setMATCH_DATE(String mATCH_DATE) {
		MATCH_DATE = mATCH_DATE;
	}
	public String getINTRODUCTION() {
		return INTRODUCTION;
	}
	public void setINTRODUCTION(String iNTRODUCTION) {
		INTRODUCTION = iNTRODUCTION;
	}
	public int getIS_DELETED() {
		return IS_DELETED;
	}
	public void setIS_DELETED(int iS_DELETED) {
		IS_DELETED = iS_DELETED;
	}
	public int getLOCATION_CODE() {
		return LOCATION_CODE;
	}
	public void setLOCATION_CODE(int lOCATION_CODE) {
		LOCATION_CODE = lOCATION_CODE;
	}
	public int getSPORTS_TYPE_CODE() {
		return SPORTS_TYPE_CODE;
	}
	public void setSPORTS_TYPE_CODE(int sPORTS_TYPE_CODE) {
		SPORTS_TYPE_CODE = sPORTS_TYPE_CODE;
	}
	public String getESTABLISHMENT_YEAR() {
		return ESTABLISHMENT_YEAR;
	}
	public void setESTABLISHMENT_YEAR(String eSTABLISHMENT_YEAR) {
		ESTABLISHMENT_YEAR = eSTABLISHMENT_YEAR;
	}
	public String getSI() {
		return SI;
	}
	public void setSI(String sI) {
		SI = sI;
	}
	public String getGU() {
		return GU;
	}
	public void setGU(String gU) {
		GU = gU;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public String getSPORTS_NAME() {
		return SPORTS_NAME;
	}
	public void setSPORTS_NAME(String sPORTS_NAME) {
		SPORTS_NAME = sPORTS_NAME;
	}
	public int getCLUB_TYPE_CODE() {
		return CLUB_TYPE_CODE;
	}
	public void setCLUB_TYPE_CODE(int cLUB_TYPE_CODE) {
		CLUB_TYPE_CODE = cLUB_TYPE_CODE;
	}
	public String getCLUB_TYPE_NAME() {
		return CLUB_TYPE_NAME;
	}
	public void setCLUB_TYPE_NAME(String cLUB_TYPE_NAME) {
		CLUB_TYPE_NAME = cLUB_TYPE_NAME;
	}
	public int getCLUB_TARGET_CODE() {
		return CLUB_TARGET_CODE;
	}
	public void setCLUB_TARGET_CODE(int cLUB_TARGET_CODE) {
		CLUB_TARGET_CODE = cLUB_TARGET_CODE;
	}
	public String getCLUB_TYPE_TAG() {
		return CLUB_TYPE_TAG;
	}
	public void setCLUB_TYPE_TAG(String cLUB_TYPE_TAG) {
		CLUB_TYPE_TAG = cLUB_TYPE_TAG;
	}
	public String getCLUB_TARGET_NAME() {
		return CLUB_TARGET_NAME;
	}
	public void setCLUB_TARGET_NAME(String cLUB_TARGET_NAME) {
		CLUB_TARGET_NAME = cLUB_TARGET_NAME;
	}
	public String getCLUB_TARGET_TAG() {
		return CLUB_TARGET_TAG;
	}
	public void setCLUB_TARGET_TAG(String cLUB_TARGET_TAG) {
		CLUB_TARGET_TAG = cLUB_TARGET_TAG;
	}
	public int getMEMBERSHIP_FEE() {
		return MEMBERSHIP_FEE;
	}
	public void setMEMBERSHIP_FEE(int mEMBERSHIP_FEE) {
		MEMBERSHIP_FEE = mEMBERSHIP_FEE;
	}
	public int getDELETE_USER() {
		return DELETE_USER;
	}
	public void setDELETE_USER(int dELETE_USER) {
		DELETE_USER = dELETE_USER;
	}
	public String getDELETE_DATE() {
		return DELETE_DATE;
	}
	public void setDELETE_DATE(String dELETE_DATE) {
		DELETE_DATE = dELETE_DATE;
	}
	public String getDELETE_TIME() {
		return DELETE_TIME;
	}
	public void setDELETE_TIME(String dELETE_TIME) {
		DELETE_TIME = dELETE_TIME;
	}
	public int getPAGE_NUM() {
		return PAGE_NUM;
	}
	public void setPAGE_NUM(int pAGE_NUM) {
		PAGE_NUM = pAGE_NUM;
	}
	public int getACTIVE_POINTS() {
		return ACTIVE_POINTS;
	}
	public void setACTIVE_POINTS(int aCTIVE_POINTS) {
		ACTIVE_POINTS = aCTIVE_POINTS;
	}
	public int getIS_ZZIMED() {
		return IS_ZZIMED;
	}
	public void setIS_ZZIMED(int iS_ZZIMED) {
		IS_ZZIMED = iS_ZZIMED;
	}
	public int getWRITE_USER() {
		return WRITE_USER;
	}
	public void setWRITE_USER(int wRITE_USER) {
		WRITE_USER = wRITE_USER;
	}
	public int getFED_CODE() {
		return FED_CODE;
	}
	public void setFED_CODE(int fED_CODE) {
		FED_CODE = fED_CODE;
	}
	public String getFED_NAME() {
		return FED_NAME;
	}
	public void setFED_NAME(String fED_NAME) {
		FED_NAME = fED_NAME;
	}
	public int getMEMBER_STATUS() {
		return MEMBER_STATUS;
	}
	public void setMEMBER_STATUS(int mEMBER_STATUS) {
		MEMBER_STATUS = mEMBER_STATUS;
	}
	public String getKEYWORD() {
		return KEYWORD;
	}
	public void setKEYWORD(String kEYWORD) {
		KEYWORD = kEYWORD;
	}
	public int getUSER_LEVEL() {
		return USER_LEVEL;
	}
	public void setUSER_LEVEL(int uSER_LEVEL) {
		USER_LEVEL = uSER_LEVEL;
	}
	public int getNUM_LOAD() {
		return NUM_LOAD;
	}
	public void setNUM_LOAD(int nUM_LOAD) {
		NUM_LOAD = nUM_LOAD;
	}
	public int getLAST_BID() {
		return LAST_BID;
	}
	public void setLAST_BID(int lAST_BID) {
		LAST_BID = lAST_BID;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	
}