package com.sportsfactory.sportforall.dto;

public class UserJoinedClubDto {
	//parameter
	private int USER_ID;
	
	//result
	private String CLUB_NAME;
	private String ICON_NAME;
	private int CLUB_CODE;
	private String EVENTS_TAG;
	private String NAME;
	
	public int getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getCLUB_NAME() {
		return CLUB_NAME;
	}
	public void setCLUB_NAME(String cLUB_NAME) {
		CLUB_NAME = cLUB_NAME;
	}
	public String getICON_NAME() {
		return ICON_NAME;
	}
	public void setICON_NAME(String iCON_NAME) {
		ICON_NAME = iCON_NAME;
	}
	public int getCLUB_CODE() {
		return CLUB_CODE;
	}
	public void setCLUB_CODE(int cLUB_CODE) {
		CLUB_CODE = cLUB_CODE;
	}
	public String getEVENTS_TAG() {
		return EVENTS_TAG;
	}
	public void setEVENTS_TAG(String eVENTS_TAG) {
		EVENTS_TAG = eVENTS_TAG;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
}
