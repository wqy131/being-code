package com.being.model;

import java.io.Serializable;
import java.util.Date;

public class ActivityInfoLog implements Serializable{
	private Integer id;
	private Integer userId;
	private Integer activityType;
	private Integer activityMode;
	private Double activityBalance;
    private Date createTime;
    private Long createId;
    private Date updateTime;
    private Long updateId;
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
	public Integer getActivityType() {
		return activityType;
	}
	public void setActivityType(Integer activityType) {
		this.activityType = activityType;
	}
	public Integer getActivityMode() {
		return activityMode;
	}
	public void setActivityMode(Integer activityMode) {
		this.activityMode = activityMode;
	}
	public Double getActivityBalance() {
		return activityBalance;
	}
	public void setActivityBalance(Double activityBalance) {
		this.activityBalance = activityBalance;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Long getCreateId() {
		return createId;
	}
	public void setCreateId(Long createId) {
		this.createId = createId;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Long getUpdateId() {
		return updateId;
	}
	public void setUpdateId(Long updateId) {
		this.updateId = updateId;
	}
	
}
