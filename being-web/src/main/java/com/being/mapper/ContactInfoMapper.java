package com.being.mapper;

import com.being.model.ContactInfo;

public interface ContactInfoMapper{

	void insert(ContactInfo info);

	void updateById(ContactInfo info);
}