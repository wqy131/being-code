package com.being.conf;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.being.model.UserInfo;

@Configuration
@ConfigurationProperties(prefix = "system")
public class SystemConfig {

	public static String filePath;
	public static String aaa;
	public static String aa_bb;
	
	private SystemConfig systemConfig;

	public static String getFilePath() {
		return filePath;
	}

	public SystemConfig getSystemConfig() {
		return systemConfig;
	}

	public void setSystemConfig(SystemConfig systemConfig) {
		this.systemConfig = systemConfig;
	}
	
	public static void main(String[] args) {
		UserInfo user = new UserInfo();
		user.setBalance("123423424");
		String text = JSON.toJSONString(user, SerializerFeature.WriteMapNullValue);
		System.out.println(text);
	}
}
