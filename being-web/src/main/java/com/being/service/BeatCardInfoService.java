package com.being.service;

import com.being.model.BeatCardInfo;

public interface BeatCardInfoService {
	Integer insert(BeatCardInfo info);

	BeatCardInfo selectBeatCard(BeatCardInfo info);
}
