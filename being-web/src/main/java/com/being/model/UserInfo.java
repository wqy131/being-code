package com.being.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

public class UserInfo extends BaseEntity implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 5608026980071772208L;

    private String name;

    private String password;

    private String gender;

    private String email;

    private String cellphone;

    private String fullName;

    private String idType;

    private String idNum;

    private String status;

    private String source;

    private String avaterPath;

    private String regChannel;

    private Date createTime;

    private Long createId;

    private Date updateTime;

    private Long updateId;
    
    private String numAuthFlog;
    
    private String userAddress;
    private String balance;
    
    private String[] fileName;
    private List<FileInfo> fileList;
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getIdType() {
        return idType;
    }

    public void setIdType(String idType) {
        this.idType = idType;
    }

    public String getIdNum() {
        return idNum;
    }

    public void setIdNum(String idNum) {
        this.idNum = idNum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getAvaterPath() {
        return avaterPath;
    }

    public void setAvaterPath(String avaterPath) {
        this.avaterPath = avaterPath;
    }

    public String getRegChannel() {
        return regChannel;
    }

    public void setRegChannel(String regChannel) {
        this.regChannel = regChannel;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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
    
	public String getNumAuthFlog() {
		return numAuthFlog;
	}

	public void setNumAuthFlog(String numAuthFlog) {
		this.numAuthFlog = numAuthFlog;
	}

	public String[] getFileName() {
		return fileName;
	}

	public void setFileName(String[] fileName) {
		this.fileName = fileName;
	}

	public Long getCreateId() {
		return createId;
	}

	public void setCreateId(Long createId) {
		this.createId = createId;
	}


  public String getUserAddress() {
      return userAddress;
    }

    public void setUserAddress(String userAddress) {
      this.userAddress = userAddress;
    }

    public String getBalance() {
      return balance;
    }

    public void setBalance(String balance) {
      this.balance = balance;
    }
    

  public List<FileInfo> getFileList() {
		return fileList;
	}

	public void setFileList(List<FileInfo> fileList) {
		this.fileList = fileList;
	}

@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
    
    
}
