package com.sportsfactory.sportforall.dto;

public class StateDto {
	private String SI;
	private String GU;
	private String DONG;
	private String CATEGORY;
	private String EVENT;
	
	private String EVENT_CODE;
	
	private String PAGE_TAG;
	private int FLAG;
	private int PAGE;
	private String KEYWORD;
	
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
	public String getDONG() {
		return DONG;
	}
	public void setDONG(String dONG) {
		DONG = dONG;
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
	
	public String getPAGE_TAG() {
		return PAGE_TAG;
	}
	public void setPAGE_TAG(String pAGE_TAG) {
		PAGE_TAG = pAGE_TAG;
	}
	public int getFLAG() {
		return FLAG;
	}
	public void setFLAG(int fLAG) {
		this.FLAG = fLAG;
	}
	public int getPAGE() {
		return PAGE;
	}
	public void setPAGE(int pAGE) {
		PAGE = pAGE;
	}
	public String getKEYWORD() {
		return KEYWORD;
	}
	public void setKEYWORD(String kEYWORD) {
		KEYWORD = kEYWORD;
	}
	public String getEVENT_CODE() {
		return EVENT_CODE;
	}
	public void setEVENT_CODE(String eVENT_CODE) {
		EVENT_CODE = eVENT_CODE;
	}
}
