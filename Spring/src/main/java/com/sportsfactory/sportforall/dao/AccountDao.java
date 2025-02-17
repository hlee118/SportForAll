package com.sportsfactory.sportforall.dao;

import java.util.ArrayList;

import com.sportsfactory.sportforall.dto.AccountDto;
import com.sportsfactory.sportforall.dto.ClubUserDto;
import com.sportsfactory.sportforall.dto.LocationDto;
import com.sportsfactory.sportforall.dto.SportsTypeDto;
import com.sportsfactory.sportforall.dto.UserInterestDto;
import com.sportsfactory.sportforall.dto.UserJoinedClubDto;
import com.sportsfactory.sportforall.dto.UserPhotoDto;
import com.sportsfactory.sportforall.dto.ZzimDto;

public interface AccountDao {
	public ArrayList<AccountDto> getUserList();
	public AccountDto getUserInfo(AccountDto dto);
	public AccountDto getUserInfoByInt(int USER_ID);
	public void insertUserInfo(AccountDto dto);
	public AccountDto login(AccountDto dto);
	public void updateUserLoc(AccountDto dto);
	public void insertUserInterest(UserInterestDto dto);
	public AccountDto idCheck(AccountDto dto);
	public ArrayList<AccountDto> getUserSearch(AccountDto dto);
	public UserInterestDto getOneUserInterest(UserInterestDto dto);
	public ArrayList<UserInterestDto> getUserInterest(UserInterestDto dto);
	public ArrayList<UserJoinedClubDto> getUserClub(UserJoinedClubDto dto);
	public void updatePushAlram(AccountDto dto);
	public void updatePassword(AccountDto dto);
	public void dropOut(AccountDto dto);
	public void updateUserProfile(AccountDto dto);
	public void updateUserProfileBackground(AccountDto dto);
	public void updateProfile(AccountDto dto);
	public void deleteUserInterest(AccountDto dto);
	public ArrayList<UserPhotoDto> getUserPhoto(UserPhotoDto dto);
	public UserPhotoDto getUserPhotoBySeq(UserPhotoDto dto);
	public void deleteUserPhotoBySeq(UserPhotoDto dto);
	public void insertUserPhoto(UserPhotoDto dto);
	public ArrayList<ZzimDto> getUserAlbumZzim(AccountDto dto);
	public ArrayList<ZzimDto> getUserBoardZzim(AccountDto dto);
	public ArrayList<ZzimDto> getUserClubZzim(AccountDto dto);
	public ArrayList<ZzimDto> getUserInfoEventZzim(AccountDto dto);
	public ArrayList<ZzimDto> getUserInfoFacilityZzim(AccountDto dto);
	public ArrayList<ZzimDto> getUserInfoNewsZzim(AccountDto dto);
	public AccountDto findId(AccountDto dto);
	public AccountDto findPassword(AccountDto dto);
	public void newPassword(AccountDto dto);
	public AccountDto phoneCheck(AccountDto dto);
	public AccountDto passwordCheck(AccountDto dto);
	public void getoutFromClub(ClubUserDto dto);
	public ArrayList<UserJoinedClubDto> getUserFed(UserJoinedClubDto dto);
}