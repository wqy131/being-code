package com.being.service;

import com.being.model.WalletInfo;

public interface WalletInfoService {
	Integer save(WalletInfo walletInfo);

	Integer updateByUserId(WalletInfo wallet);

	WalletInfo selectByUserId(Integer userId);
}
