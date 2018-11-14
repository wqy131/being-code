/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014-2016 abel533@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.being.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.being.exception.Assert;
import com.being.mapper.FileInfoMapper;
import com.being.mapper.UserInfoMapper;
import com.being.model.FileInfo;
import com.being.model.UserInfo;
import com.being.service.FileInfoService;
import com.being.service.UserInfoService;

/**
 * @author liuzh
 * @since 2016-01-31 21:42
 */
@Service
public class UserInfoServiceImpl implements UserInfoService{

    @Autowired
    private UserInfoMapper userInfoMapper;
    
    @Autowired
    private FileInfoMapper fileInfoMapper;
    
    
    @Autowired
    private FileInfoService fileInfoService;

    public UserInfo getUserInfo(UserInfo userInfo) {
    	UserInfo ui =  userInfoMapper.selectObj(userInfo);
    	if(ui==null) {
    		return ui;
    	}
    	ui.setPassword(null);
    	FileInfo fileInfo = new FileInfo();
    	fileInfo.setExternalId(Long.valueOf(ui.getId()));
    	fileInfo.setStatus("5");
    	List<FileInfo> list = fileInfoMapper.getListByFileInfo(fileInfo);
    	ui.setFileList(list);
    	return ui;
    }
   
    @Override
    @Transactional
    public void save(UserInfo user) {
    	Assert.isNull(user, "参数为空");
        if (user.getId() != null) {
            userInfoMapper.updateById(user);
        } else {
        	user.setStatus("1");
        	user.setIdType("1");
            userInfoMapper.insert(user);
            if(user.getFileName() != null && user.getFileName().length>0){
            	//处理身份证照片
            	System.out.println(user.getFileName());
                fileInfoService.update(user.getFileName(), "5", user.getId(), new Date());
            }
        }
    }
    @Override
    public UserInfo updateByIdBlock(UserInfo user) {
      Assert.isNull(user, "参数为空");
      userInfoMapper.updateByIdBlock(user);
      UserInfo userInfo = new UserInfo();
      userInfo.setId(user.getId());
      return userInfoMapper.selectObj(userInfo);
    }

}
