package com.sportsfactory.sportforall.dto;

import java.sql.Timestamp;

public class InfoNewsDto {
	private int NEWS_CODE;
	private String NEWS_NAME;
	private String CONTENTS;
	private int CATEGORY_CODE;
	private int FILE_ID;
	private int LOCATION_CODE;
	private String WRITE_DATE;
	private String WRITE_TIME;
	private String PLAN_DATE;
	private String PLAN_TIME;
	private String PLAN_DATETIME_STR;
	private String ADDRESS;
	private String TARGET;
	private String HOST;
	private String MNGHOST;
	private String MAIN_PIC;
	private String FRONT_PIC;
	private String LINK;
	
	private String PICTURE;
	
	// 드롭박스용 변수
	private String SI;
	private String CATEGORY;
	private String EVENT;
	
	// ZZIM용 변수
	private int IS_ZZIMED;
	private int WRITE_USER;
	
	private int PAGE;
	private String KEYWORD;

	private String FORMATTED_PLAN_DATE;
	private int WEEKDAY;
	private String FORMATTED_PLAN_TIME;
	
	private int USER_ID;
	
	private String NAME;
	
	public int getNEWS_CODE() {
		return NEWS_CODE;
	}
	public void setNEWS_CODE(int nEWS_CODE) {
		NEWS_CODE = nEWS_CODE;
	}
	public String getNEWS_NAME() {
		return NEWS_NAME;
	}
	public void setNEWS_NAME(String nEWS_NAME) {
		NEWS_NAME = nEWS_NAME;
	}
	public String getCONTENTS() {
		return CONTENTS;
	}
	public void setCONTENTS(String cONTENTS) {
		CONTENTS = cONTENTS;
	}
	public int getCATEGORY_CODE() {
		return CATEGORY_CODE;
	}
	public void setCATEGORY_CODE(int cATEGORY_CODE) {
		CATEGORY_CODE = cATEGORY_CODE;
	}
	public int getFILE_ID() {
		return FILE_ID;
	}
	public void setFILE_ID(int fILE_ID) {
		FILE_ID = fILE_ID;
	}
	public int getLOCATION_CODE() {
		return LOCATION_CODE;
	}
	public void setLOCATION_CODE(int lOCATION_CODE) {
		LOCATION_CODE = lOCATION_CODE;
	}
	public String getWRITE_DATE() {
		return WRITE_DATE;
	}
	public void setWRITE_DATE(String wRITE_DATE) {
		WRITE_DATE = wRITE_DATE;
	}
	public String getWRITE_TIME() {
		return WRITE_TIME;
	}
	public void setWRITE_TIME(String wRITE_TIME) {
		WRITE_TIME = wRITE_TIME;
	}
	public String getPLAN_DATE() {
		return PLAN_DATE;
	}
	public void setPLAN_DATE(String pLAN_DATE) {
		PLAN_DATE = pLAN_DATE;
	}
	public String getPLAN_TIME() {
		return PLAN_TIME;
	}
	public void setPLAN_TIME(String pLAN_TIME) {
		PLAN_TIME = pLAN_TIME;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getTARGET() {
		return TARGET;
	}
	public void setTARGET(String tARGET) {
		TARGET = tARGET;
	}
	public String getHOST() {
		return HOST;
	}
	public void setHOST(String hOST) {
		HOST = hOST;
	}
	public String getMNGHOST() {
		return MNGHOST;
	}
	public void setMNGHOST(String mNGHOST) {
		MNGHOST = mNGHOST;
	}
	
	public String getSI() {
		return SI;
	}
	public void setSI(String sI) {
		SI = sI;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public String getEVENT() {
		return EVENT;
	}
	public void setEVENT(String eVENT) {
		EVENT = eVENT;
	}
	public int getPAGE() {
		return PAGE;
	}
	public void setPAGE(int pAGE) {
		PAGE = pAGE;
	}
	public String getFORMATTED_PLAN_DATE() {
		return FORMATTED_PLAN_DATE;
	}
	public void setFORMATTED_PLAN_DATE(String fORMATTED_PLAN_DATE) {
		FORMATTED_PLAN_DATE = fORMATTED_PLAN_DATE;
	}
	public int getIS_ZZIMED() {
		return IS_ZZIMED;
	}
	public void setIS_ZZIMED(int iS_ZZIMED) {
		IS_ZZIMED = iS_ZZIMED;
	}
	public String getFORMATTED_PLAN_TIME() {
		return FORMATTED_PLAN_TIME;
	}
	public void setFORMATTED_PLAN_TIME(String fORMATTED_PLAN_TIME) {
		FORMATTED_PLAN_TIME = fORMATTED_PLAN_TIME;
	}
	public int getWRITE_USER() {
		return WRITE_USER;
	}
	public void setWRITE_USER(int wRITE_USER) {
		WRITE_USER = wRITE_USER;
	}
	public int getWEEKDAY() {
		return WEEKDAY;
	}
	public void setWEEKDAY(int wEEKDAY) {
		WEEKDAY = wEEKDAY;
	}
	public String getPICTURE() {
		return PICTURE;
	}
	public void setPICTURE(String pICTURE) {
		PICTURE = pICTURE;
	}
	public String getKEYWORD() {
		return KEYWORD;
	}
	public void setKEYWORD(String kEYWORD) {
		KEYWORD = kEYWORD;
	}
	public int getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPLAN_DATETIME_STR() {
		return PLAN_DATETIME_STR;
	}
	public void setPLAN_DATETIME_STR(String pLAN_DATETIME_STR) {
		PLAN_DATETIME_STR = pLAN_DATETIME_STR;
	}
	public String getMAIN_PIC() {
		return MAIN_PIC;
	}
	public void setMAIN_PIC(String mAIN_PIC) {
		MAIN_PIC = mAIN_PIC;
	}
	public String getFRONT_PIC() {
		return FRONT_PIC;
	}
	public void setFRONT_PIC(String fRONT_PIC) {
		FRONT_PIC = fRONT_PIC;
	}
	public String getLINK() {
		return LINK;
	}
	public void setLINK(String lINK) {
		LINK = lINK;
	}
}