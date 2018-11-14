package com.being.constant;

import java.io.Serializable;

import com.alibaba.fastjson.JSONObject;

public class ResultBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7496738929122293469L;
	private String code = "0000";
	private String message = "操作成功！";
	private Object data;
	private String token;
	public ResultBean() {}
	public ResultBean(Object data, String code, String message) {
		this.data = data;
		this.code = code;
		this.message = message;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Object getData() {
    return data;
  }
  public void setData(Object data) {
    this.data = data;
  }
  public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
	
	
	
}
