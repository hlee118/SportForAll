package com.sportsfactory.sportforall.dto;

public class ClubBoardDto {
	private int BOARD_ID;
	private int CLUB_CODE;
	private String TITLE;
	private String CONTENT;
	private String REFINDEDCONTENT;
	private int IS_MORE;
	private int IS_OPEN;
	private int NOTICE_TYPE;
	private int IS_PUSH_NOTICE;
	private int WRITE_USER;
	private String WRITE_DATE;
	private String FORMATED_WRITE_DATE;
	private String WRITE_TIME;
	private String FORMATED_WRITE_TIME;
	private int IS_DELETED;
	private int DELETE_USER;
	private String DELETE_DATE;
	private String DELETE_TIME;
	private String MODIFY_DATE;
	private String MODIFY_TIME;
	private int MODIFY_USER;
	private int FILE_CODE;
	private int POINT;
	
	private int NUM_LOAD;
	private int IS_MODIFY;
	private String KEYWORD;
	private int LAST_BID;
	private int FED_CODE;
	private int USER_LEVEL;
	
	private int COUNT_LIKE;
	private int COUNT_COMMENT;
	
	private String USER_NAME;
	private String PROFILE;

	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public int getBOARD_ID() {
		return BOARD_ID;
	}
	public void setBOARD_ID(int bOARD_ID) {
		BOARD_ID = bOARD_ID;
	}
	public int getCLUB_CODE() {
		return CLUB_CODE;
	}
	public void setCLUB_CODE(int cLUB_CODE) {
		CLUB_CODE = cLUB_CODE;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getREFINDEDCONTENT() {
		return REFINDEDCONTENT;
	}
	public void setREFINDEDCONTENT(String rEFINDEDCONTENT) {
		REFINDEDCONTENT = rEFINDEDCONTENT;
	}
	public int getIS_MORE() {
		return IS_MORE;
	}
	public void setIS_MORE(int iS_MORE) {
		IS_MORE = iS_MORE;
	}
	public int getIS_OPEN() {
		return IS_OPEN;
	}
	public void setIS_OPEN(int iS_OPEN) {
		IS_OPEN = iS_OPEN;
	}
	public int getNOTICE_TYPE() {
		return NOTICE_TYPE;
	}
	public void setNOTICE_TYPE(int nOTICE_TYPE) {
		NOTICE_TYPE = nOTICE_TYPE;
	}
	public int getIS_PUSH_NOTICE() {
		return IS_PUSH_NOTICE;
	}
	public void setIS_PUSH_NOTICE(int iS_PUSH_NOTICE) {
		IS_PUSH_NOTICE = iS_PUSH_NOTICE;
	}
	public int getWRITE_USER() {
		return WRITE_USER;
	}
	public void setWRITE_USER(int wRITE_USER) {
		WRITE_USER = wRITE_USER;
	}
	public String getWRITE_DATE() {
		return WRITE_DATE;
	}
	public void setWRITE_DATE(String wRITE_DATE) {
		WRITE_DATE = wRITE_DATE;
	}
	public String getFORMATED_WRITE_DATE() {
		return FORMATED_WRITE_DATE;
	}
	public void setFORMATED_WRITE_DATE(String fORMATED_WRITE_DATE) {
		FORMATED_WRITE_DATE = fORMATED_WRITE_DATE;
	}
	public String getWRITE_TIME() {
		return WRITE_TIME;
	}
	public void setWRITE_TIME(String wRITE_TIME) {
		WRITE_TIME = wRITE_TIME;
	}
	public String getFORMATED_WRITE_TIME() {
		return FORMATED_WRITE_TIME;
	}
	public void setFORMATED_WRITE_TIME(String fORMATED_WRITE_TIME) {
		FORMATED_WRITE_TIME = fORMATED_WRITE_TIME;
	}
	public int getIS_DELETED() {
		return IS_DELETED;
	}
	public void setIS_DELETED(int iS_DELETED) {
		IS_DELETED = iS_DELETED;
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
	public String getMODIFY_DATE() {
		return MODIFY_DATE;
	}
	public void setMODIFY_DATE(String mODIFY_DATE) {
		MODIFY_DATE = mODIFY_DATE;
	}
	public String getMODIFY_TIME() {
		return MODIFY_TIME;
	}
	public void setMODIFY_TIME(String mODIFY_TIME) {
		MODIFY_TIME = mODIFY_TIME;
	}
	public int getMODIFY_USER() {
		return MODIFY_USER;
	}
	public void setMODIFY_USER(int mODIFY_USER) {
		MODIFY_USER = mODIFY_USER;
	}
	public int getFILE_CODE() {
		return FILE_CODE;
	}
	public void setFILE_CODE(int fILE_CODE) {
		FILE_CODE = fILE_CODE;
	}
	
	public int getNUM_LOAD() {
		return NUM_LOAD;
	}
	public void setNUM_LOAD(int nUM_LOAD) {
		NUM_LOAD = nUM_LOAD;
	}
	public int getIS_MODIFY() {
		return IS_MODIFY;
	}
	public void setIS_MODIFY(int iS_MODIFY) {
		IS_MODIFY = iS_MODIFY;
	}
	public String getKEYWORD() {
		return KEYWORD;
	}
	public void setKEYWORD(String kEYWORD) {
		KEYWORD = kEYWORD;
	}
	
	public String getPROFILE() {
		return PROFILE;
	}
	public void setPROFILE(String pROFILE) {
		PROFILE = pROFILE;
	}
	
	public int getCOUNT_LIKE() {
		return COUNT_LIKE;
	}
	public void setCOUNT_LIKE(int cOUNT_LIKE) {
		COUNT_LIKE = cOUNT_LIKE;
	}
	public int getCOUNT_COMMENT() {
		return COUNT_COMMENT;
	}
	public void setCOUNT_COMMENT(int cOUNT_COMMENT) {
		COUNT_COMMENT = cOUNT_COMMENT;
	}
	public int getPOINT() {
		return POINT;
	}
	public void setPOINT(int pOINT) {
		POINT = pOINT;
	}
	public int getLAST_BID() {
		return LAST_BID;
	}
	public void setLAST_BID(int lAST_BID) {
		LAST_BID = lAST_BID;
	}
	public int getFED_CODE() {
		return FED_CODE;
	}
	public void setFED_CODE(int fED_CODE) {
		FED_CODE = fED_CODE;
	}
	public int getUSER_LEVEL() {
		return USER_LEVEL;
	}
	public void setUSER_LEVEL(int uSER_LEVEL) {
		USER_LEVEL = uSER_LEVEL;
	}
	
}
