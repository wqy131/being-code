package com.being.service.impl;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.being.mapper.WalletInfoMapper;
import com.being.model.WalletInfo;
import com.being.service.WalletInfoService;

@Service
public class WalletInfoServiceImpl implements WalletInfoService{

    
    @Autowired
    private  WalletInfoMapper WalletInfoMapper;

	@Override
	public Integer save(WalletInfo wallet) {
		wallet.setCreateId(Long.valueOf(wallet.getUserId()));
		wallet.setCreateTime(new Date());
		Integer result = WalletInfoMapper.insert(wallet);
		return result;
	}

   
	@Override
	public Integer updateByUserId(WalletInfo wallet) {
		wallet.setUpdateTime(new Date());
		Integer result = WalletInfoMapper.updateByUserId(wallet);
		return result;
	}
	
	@Override
	@Transactional
	public WalletInfo selectByUserId(Integer userId) {
		if(Objects.nonNull(userId)) {
			WalletInfo info = WalletInfoMapper.selectByUserId(userId);
			WalletInfo wallet = new WalletInfo();
			if(info==null) {
				wallet.setUserId(userId);
				wallet.setActivityBalance(new Double(0));
				wallet.setAvailableBalance(new Double(0));
				wallet.setCreateId(Long.valueOf(userId));
				wallet.setCreateTime(new Date());
				WalletInfoMapper.insert(wallet);
			}else {
				wallet = info;
			}
			return wallet ;
		}
		return null;
	}
	
	
}
