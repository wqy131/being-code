package com.being.mapper;

import org.apache.ibatis.annotations.Param;

import com.being.model.WalletInfo;


public interface WalletInfoMapper{

	WalletInfo selectByUserId(@Param("userId") Integer userId);
	
	Integer updateByUserId(WalletInfo wallet);

	Integer insert(WalletInfo wallet);

}
