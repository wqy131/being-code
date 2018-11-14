package com.being.exception;

import org.apache.commons.lang.StringUtils;

public class Assert{

	public static void isNull(Object object){
		isNull(object, "参数异常！");
	}
	
	public static void isNull(Object object, String message) {
		isNull(object, "999", message);
	}
	
	public static void isNull(Object object,String code, String message) {
		Boolean condition = (object == null);
		if(object instanceof String){
			condition = StringUtils.isEmpty(object.toString());
		}
		if (condition) {
			throw new BizException(code, message);
		}
	}
	
//	public static void main(String[] args) {
//		try {
//			Assert.isNull(null);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println(e.getMessage());
//		}
//	}

}
