package com.sportsfactory.sportforall.dto;

import java.sql.Timestamp;

public class InfoDto {

	private int FACILITY_CODE;
	private String FACILITY_NAME;
	private int LOCATION_CODE;
	private String FACILITY_IMG;
	private String PHONE_NUMBER;
	private String DESCRIPTION;
	private double LATITUDE;
	private double LONGITUDE;
	
	private String SI;
	private String GU;
	private String DONG;
	private String CATEGORY;
	private String EVENT;
	private String PICTURE;
	private String PAGE_TAG;
	private String KEYWORD;
	
	private String NAME;
	private String PHRASE;
	
	private int IS_ZZIMED;
	private int WRITE_USER;

	private int PAGE;
	
	public InfoDto() {
	}

	public InfoDto(int fACILITY_CODE, String fACILITY_NAME, int lOCATION_CODE, String fACILITY_IMG, String pHONE_NUMBER, String dESCRIPTION) {
		FACILITY_CODE = fACILITY_CODE;
		FACILITY_NAME = fACILITY_NAME;
		LOCATION_CODE = lOCATION_CODE;
		FACILITY_IMG = fACILITY_IMG;
		PHONE_NUMBER = pHONE_NUMBER;
		DESCRIPTION = dESCRIPTION;
	}

	public int getFACILITY_CODE() {
		return FACILITY_CODE;
	}

	public void setFACILITY_CODE(int fACILITY_CODE) {
		FACILITY_CODE = fACILITY_CODE;
	}

	public String getFACILITY_NAME() {
		return FACILITY_NAME;
	}

	public void setFACILITY_NAME(String fACILITY_NAME) {
		FACILITY_NAME = fACILITY_NAME;
	}

	public int getLOCATION_CODE() {
		return LOCATION_CODE;
	}

	public void setLOCATION_CODE(int lOCATION_CODE) {
		LOCATION_CODE = lOCATION_CODE;
	}

	public String getFACILITY_IMG() {
		return FACILITY_IMG;
	}

	public void setFACILITY_IMG(String fACILITY_IMG) {
		FACILITY_IMG = fACILITY_IMG;
	}

	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}

	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}

	public String getDESCRIPTION() {
		return DESCRIPTION;
	}

	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}

	public double getLATITUDE() {
		return LATITUDE;
	}

	public void setLATITUDE(double lATITUDE) {
		LATITUDE = lATITUDE;
	}

	public double getLONGITUDE() {
		return LONGITUDE;
	}

	public void setLONGITUDE(double lONGITUDE) {
		LONGITUDE = lONGITUDE;
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

	public String getDONG() {
		return DONG;
	}

	public void setDONG(String dONG) {
		DONG = dONG;
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

	public String getPICTURE() {
		return PICTURE;
	}

	public void setPICTURE(String pICTURE) {
		PICTURE = pICTURE;
	}

	public String getCATEGORY() {
		return CATEGORY;
	}

	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}

	public String getPAGE_TAG() {
		return PAGE_TAG;
	}

	public void setPAGE_TAG(String pAGE_TAG) {
		PAGE_TAG = pAGE_TAG;
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

	public String getKEYWORD() {
		return KEYWORD;
	}

	public void setKEYWORD(String kEYWORD) {
		KEYWORD = kEYWORD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getPHRASE() {
		return PHRASE;
	}

	public void setPHRASE(String pHRASE) {
		PHRASE = pHRASE;
	}

}