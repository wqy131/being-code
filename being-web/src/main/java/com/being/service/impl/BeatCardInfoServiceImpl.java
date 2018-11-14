package com.being.service.impl;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.being.mapper.BeatCardInfoMapper;
import com.being.model.BeatCardInfo;
import com.being.model.WalletInfo;
import com.being.service.BeatCardInfoService;
import com.being.service.WalletInfoService;
@Service
public class BeatCardInfoServiceImpl implements BeatCardInfoService{
	@Autowired
	private BeatCardInfoMapper beatCardInfoMapper;
	@Autowired
	private WalletInfoService walletInfoService;
	
	
	@Transactional
	public Integer insert(BeatCardInfo info){
		BeatCardInfo param = new BeatCardInfo();
		param.setUserId(info.getUserId());
		param.setCreateTime(info.getCreateTime());
		BeatCardInfo obj = beatCardInfoMapper.selectBeatCard(param);
		if(Objects.isNull(obj)){
			Integer result = beatCardInfoMapper.insert(info);
			if(result !=null && result>0) {
				WalletInfo wallet = new WalletInfo();
				wallet.setUserId(info.getUserId());
				
				WalletInfo walletInfo = walletInfoService.selectByUserId(info.getUserId());
				if(walletInfo==null) {
					wallet.setActivityBalance(new Double(200));
					walletInfoService.save(wallet);
				}else {
					wallet.setActivityBalance((walletInfo.getActivityBalance()==null?new Double(0):walletInfo.getActivityBalance())+new Double(200));
					wallet.setAvailableBalance(walletInfo.getAvailableBalance()+new Double(200));
					walletInfoService.updateByUserId(wallet);
				}
				//TODO 添加一笔流水
			}
			return beatCardInfoMapper.insert(info);
		}
		return 0;
	}

	public  BeatCardInfo selectBeatCard(BeatCardInfo info){
		BeatCardInfo result = beatCardInfoMapper.selectBeatCard(info);
		return result;
	}
}
