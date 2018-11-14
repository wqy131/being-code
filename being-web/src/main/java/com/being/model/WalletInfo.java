package com.being.model;

import java.io.Serializable;
import java.util.Date;

public class WalletInfo implements Serializable{
	private Integer id;
	private Integer userId;
	private Double availableBalance;
	private Double lockBalance;
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
	public Double getAvailableBalance() {
		return availableBalance;
	}
	public void setAvailableBalance(Double availableBalance) {
		this.availableBalance = availableBalance;
	}
	public Double getLockBalance() {
		return lockBalance;
	}
	public void setLockBalance(Double lockBalance) {
		this.lockBalance = lockBalance;
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
