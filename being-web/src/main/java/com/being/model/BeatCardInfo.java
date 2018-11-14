package com.being.model;

import java.io.Serializable;
import java.util.Date;

public class BeatCardInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7289303050252618087L;
	private Integer id;
	private Integer userId;
	private Date createTime;
	private Integer createId;
	private Date updateTime;
	private Integer updateId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getCreateId() {
		return createId;
	}
	public void setCreateId(Integer createId) {
		this.createId = createId;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getUpdateId() {
		return updateId;
	}
	public void setUpdateId(Integer updateId) {
		this.updateId = updateId;
	}
	
	
	
}
