package com.sportsfactory.sportforall.dto;

import java.sql.Timestamp;

public class SportsTypeDto {

	private int CATEGORY_CODE;
	private String CATEGORY;
	private String NAME;
	private int PARENT_CODE;
	private String ICON_NAME;
	
	private int EVENTS_CODE;
	private String EVENTS_NAME;
	private String EVENTS_TAG;
	
	public int getCATEGORY_CODE() {
		return CATEGORY_CODE;
	}
	public void setCATEGORY_CODE(int cATEGORY_CODE) {
		CATEGORY_CODE = cATEGORY_CODE;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getPARENT_CODE() {
		return PARENT_CODE;
	}
	public void setPARENT_CODE(int pARENT_CODE) {
		PARENT_CODE = pARENT_CODE;
	}
	public int getEVENTS_CODE() {
		return EVENTS_CODE;
	}
	public void setEVENTS_CODE(int eVENTS_CODE) {
		EVENTS_CODE = eVENTS_CODE;
	}
	public String getEVENTS_NAME() {
		return EVENTS_NAME;
	}
	public void setEVENTS_NAME(String eVENTS_NAME) {
		EVENTS_NAME = eVENTS_NAME;
	}
	public String getEVENTS_TAG() {
		return EVENTS_TAG;
	}
	public void setEVENTS_TAG(String eVENTS_TAG) {
		EVENTS_TAG = eVENTS_TAG;
	}
	public String getICON_NAME() {
		return ICON_NAME;
	}
	public void setICON_NAME(String iCON_NAME) {
		ICON_NAME = iCON_NAME;
	}
	
}