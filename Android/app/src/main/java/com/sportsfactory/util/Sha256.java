package com.sportsfactory.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Sha256 {
	
//	public static void main(String []args) throws NoSuchAlgorithmException {
//		String t = testSHA256("password");
//		System.out.println(t);
//	}
	
	public static String testSHA256(String str) throws NoSuchAlgorithmException {
		
		MessageDigest sh = MessageDigest.getInstance("SHA-256");
		
		sh.update(str.getBytes());
		byte byteData[] = sh.digest();
		
		StringBuffer sb = new StringBuffer();
		for( int i=0; i<byteData.length; i++ ) {
			sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
		}
		
		return sb.toString();
	}

}
