package com.being.exception;

public class BizException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2062949794814997118L;
	
	private String code;  //错误码
	private String message;   //错误信息

	public BizException(String code,String message){
		super(message);
    	this.code = code;
    	this.message = message;
    }
	
	public BizException(String code,String message,Throwable cause){
		super(message,cause);
    	this.code = code;
    	this.message = message;
    }
	
	/**
	 * @return the code
	 */
	public String getcode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setcode(String code) {
		this.code = code;
	}

	/**
	 * @return the message
	 */
	public String getmessage() {
		return message;
	}

	/**
	 * @param message the message to set
	 */
	public void setmessage(String message) {
		this.message = message;
	}
}
