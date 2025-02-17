package com.sportsfactory.sportforall.dto;

import java.sql.Timestamp;

public class ClubInviteDto {

	//club_invite 테이블
	private int INVITE_ID;
	private int USER_ID;
	private int CLUB_CODE;
	private int INVITE_USER;
	private String INVITE_DATE;
	private String INVITE_TIME;
	private int INVITE_STATE;
	private int STACK;
	
	//user_info 테이블
	private String USER_NAME;
	private String PROFILE;
	
	private int ALARM_ID;
	
	public int getINVITE_ID() {
		return INVITE_ID;
	}
	public void setINVITE_ID(int iNVITE_ID) {
		INVITE_ID = iNVITE_ID;
	}
	public int getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}
	public int getCLUB_CODE() {
		return CLUB_CODE;
	}
	public void setCLUB_CODE(int cLUB_CODE) {
		CLUB_CODE = cLUB_CODE;
	}
	public int getINVITE_USER() {
		return INVITE_USER;
	}
	public void setINVITE_USER(int iNVITE_USER) {
		INVITE_USER = iNVITE_USER;
	}
	public String getINVITE_DATE() {
		return INVITE_DATE;
	}
	public void setINVITE_DATE(String iNVITE_DATE) {
		INVITE_DATE = iNVITE_DATE;
	}
	public String getINVITE_TIME() {
		return INVITE_TIME;
	}
	public void setINVITE_TIME(String iNVITE_TIME) {
		INVITE_TIME = iNVITE_TIME;
	}
	public int getSTACK() {
		return STACK;
	}
	public void setSTACK(int sTACK) {
		STACK = sTACK;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getPROFILE() {
		return PROFILE;
	}
	public void setPROFILE(String pROFILE) {
		PROFILE = pROFILE;
	}
	public int getINVITE_STATE() {
		return INVITE_STATE;
	}
	public void setINVITE_STATE(int iNVITE_STATE) {
		INVITE_STATE = iNVITE_STATE;
	}
	public int getALARM_ID() {
		return ALARM_ID;
	}
	public void setALARM_ID(int aLARM_ID) {
		ALARM_ID = aLARM_ID;
	}
}