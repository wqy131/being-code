package com.being.mapper;

import com.being.model.BeatCardInfo;

public interface BeatCardInfoMapper {
	Integer insert(BeatCardInfo info);

	BeatCardInfo selectBeatCard(BeatCardInfo info);
}
