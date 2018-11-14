package com.being.constant;

import java.util.regex.Pattern;

public class Constant {
	public static final String SESSION_LOGIN_KEY = "loginUser";
	public static final String SESSION_VER_CODE = "verCode";
	public static final String FILE_PATH = "";
	
	
	
	
	public static final String JWT_SECRETKEY = "!Q@W(I*U0oJHSJKHD$R%TQW";
	public static final int COOKIE_MAX_AGE = 7 * 24 * 60 * 60 * 1000;
	public static final String COOKIE_NAME = "userNbr";
	public static final String COOKIE_PWD = "userPwd";
	
	/**
	 * 手机号码验证
	 */
	public static final String MODELPHONE = "1[3-9][0-9]{9}";
	public static final Pattern CELLPHONE_PATTERN = Pattern.compile(MODELPHONE);
	public static final Pattern EMAIL_PATTERN = Pattern
			.compile("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$");

	
	
}
