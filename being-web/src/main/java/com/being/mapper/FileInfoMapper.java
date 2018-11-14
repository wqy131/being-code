package com.being.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.being.model.FileInfo;

public interface FileInfoMapper {

    int insert(FileInfo record);

    FileInfo selectById(Long id);

    List<FileInfo> selectAll();

    int updateById(FileInfo record);

	List<FileInfo> getListByFileInfo(FileInfo fileInfo);


	void updateByFileName(@Param("filenames")String[] fileNames, 
		@Param("status")String status, @Param("createId")Integer createId, 
		@Param("createTime")Date createTime);
}