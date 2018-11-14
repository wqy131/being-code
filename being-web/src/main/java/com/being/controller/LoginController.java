package com.being.controller;

import java.math.BigInteger;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.protocol.http.HttpService;

import com.alibaba.fastjson.JSONObject;
import com.being.constant.Constant;
import com.being.model.UserInfo;
import com.being.service.UserInfoService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
    private UserInfoService userInfoService;
	
	@RequestMapping(value = "/login")
    public String login(HttpServletRequest req) {
		if(req.getSession().getAttribute(Constant.SESSION_LOGIN_KEY) != null){
			return "redirect:/index";
		}
        return "login/login";
    }
	
	@RequestMapping(value = "/submit",method=RequestMethod.POST)
    public String submit(HttpServletRequest request,HttpServletResponse response,Map<String, Object> map) {
		Enumeration<String> enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String paraName = (String) enu.nextElement();
			System.out.println(paraName+"::"+request.getParameter(paraName));
		}
		String username = request.getParameter("name");  
		String password = request.getParameter("password");  
		UserInfo userInfo = new UserInfo();
		if (Constant.CELLPHONE_PATTERN.matcher(username).matches()) {// 传入参数是手机号码类型，则用手机号码查询用户
			userInfo.setCellphone(username);
		} else if (Constant.EMAIL_PATTERN.matcher(username).matches()) {// 传入参数是email类型，则用email查询用户
			userInfo.setEmail(username);
		} else {// 默认传入参数是用户名类型，用用户名查询用户
			userInfo.setName(username);
		}
		userInfo.setPassword(DigestUtils.sha256Hex(password));
		UserInfo user = userInfoService.getUserInfo(userInfo);
        if(user==null){
        	System.out.println("根据登录信息未找到相应的用户:"+JSONObject.toJSON(userInfo));
        	map.put("msg", "用户名或密码不正确");
        	return "forward:/login";
        }
		
		String setCookie = request.getParameter("SAVE_PWD");  
        if ("_YES".equals(setCookie)) {  
        	// 设置cookie  
            Cookie cookieName = new Cookie(Constant.COOKIE_NAME, userInfo.getEmail());  
            cookieName.setMaxAge(Constant.COOKIE_MAX_AGE);  
            response.addCookie(cookieName);  
            Cookie cookiePwd = new Cookie(Constant.COOKIE_PWD, userInfo.getPassword());  
            cookiePwd.setMaxAge(Constant.COOKIE_MAX_AGE);  
            response.addCookie(cookiePwd);  
        }else {  
            Cookie[] cookies = request.getCookies();  
            for (int i = 0; i < cookies.length; i++) {  
                if ("userNbr".equals(cookies[i].getName()) || "userPwd".equals(cookies[i].getName())) {  
                    cookies[i].setMaxAge(0);  
                    response.addCookie(cookies[i]);  
                }  
            }  
        }  
       
        System.out.println(JSONObject.toJSON(user));
        request.getSession().setAttribute(Constant.SESSION_LOGIN_KEY, user);
        return "redirect:/index";
    }
	
//	private void gitAccountInfo() {
//		// connect to node
//		Web3j web3 = Web3j.build(new HttpService());  // defaults to http://localhost:8545/
//
//		// send asynchronous requests to get balance
//		EthGetBalance ethGetBalance = web3
//		  .ethGetBalance("0xAccountAddress", DefaultBlockParameterName.LATEST)
//		  .sendAsync()
//		  .get();
//
//		BigInteger wei = ethGetBalance.getBalance();
//	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req,HttpServletResponse res) {
		//销毁session：
		req.getSession().invalidate();
	    //清除cookie：
	    Cookie cookieName = new Cookie(Constant.COOKIE_NAME, null);
	    cookieName.setMaxAge(-1);
	    Cookie cookiePwd = new Cookie(Constant.COOKIE_PWD, null);
	    cookiePwd.setMaxAge(-1);
	    res.addCookie(cookieName);
	    res.addCookie(cookiePwd);
	    
	    return "index";
	}

}
