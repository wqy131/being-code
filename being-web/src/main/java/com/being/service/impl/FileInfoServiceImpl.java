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

import com.being.mapper.FileInfoMapper;
import com.being.model.FileInfo;
import com.being.service.FileInfoService;

/**
 * @author liuzh
 * @since 2016-01-31 21:42
 */
@Service
public class FileInfoServiceImpl implements FileInfoService{

    @Autowired
    private FileInfoMapper fileInfoMapper;

	@Override
	public List<FileInfo> getListByFileInfo(FileInfo fileInfo) {
        return fileInfoMapper.getListByFileInfo(fileInfo);
	}
	
	@Override
	public Integer save(FileInfo fileInfo) {
		Integer id=fileInfo.getId();
        if ( id != null) {
        	fileInfo.setUpdateTime(new Date());
        	fileInfoMapper.updateById(fileInfo);
        } else {
        	fileInfo.setCreateTime(new Date());
        	id = fileInfoMapper.insert(fileInfo);
        }
        return id;
	}
	
	@Override
	public void update(String[] fileNames,String status,Integer createId,Date createTime) {
		fileInfoMapper.updateByFileName(fileNames,status,createId,createTime);
	}

	@Override
	public void saveBatch(List<FileInfo> list) {
		if(list!=null && list.size()>0) {
			for(FileInfo file : list) {
				file.setCreateTime(new Date());
				fileInfoMapper.insert(file);
			}
		}
	}
	 
}
