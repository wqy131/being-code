package com.being.controller;

import java.awt.image.RenderedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.being.constant.Constant;
import com.being.constant.ResultBean;
import com.being.exception.Assert;
import com.being.exception.BizException;
import com.being.model.FileInfo;
import com.being.model.UserInfo;
import com.being.service.FileInfoService;
import com.being.service.UserInfoService;
import com.being.util.VerificationCodeUtil;

@Controller
@RequestMapping("en")
public class EnIndexController {
	String languageType = "en";
	
	@Value("${web.upload-path}")
    private String path;
	
	@Autowired
    private UserInfoService userInfoService;
	
	@Autowired
    private FileInfoService fileInfoService;
	
	@RequestMapping({"index"})
    public ModelAndView getIndex() {
        ModelAndView result = new ModelAndView(languageType+"/index");
        return result;
    }
	
	@RequestMapping(value = "user/index")
    public ModelAndView add(HttpServletRequest req,HttpServletResponse res) {
         ModelAndView result = new ModelAndView(languageType+"/userIndex");
         return result;
    }
	
	
	@RequestMapping(value = "register")
    public String register(HttpServletRequest req,Model model) throws IOException {
		if(req.getSession().getAttribute(Constant.SESSION_LOGIN_KEY) != null){
			return "redirect:/"+languageType+"/index";
		}
		String imgPath = "ver-code-"+System.currentTimeMillis()+".jpg";
		OutputStream out = new FileOutputStream(path+imgPath);
	    Map<String,Object> map = VerificationCodeUtil.generateCodeAndPic();
	    ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", out);
	    System.out.println("验证码的值为："+map.get("code"));
	    req.getSession().setAttribute(Constant.SESSION_VER_CODE, map.get("code").toString());
	    
		model.addAttribute("msg", req.getParameter("message"));
		model.addAttribute("imgPath", imgPath);
        return languageType+"/register";
    }
	
	@RequestMapping(value = "register/submit",method=RequestMethod.POST)
    public String submit(HttpServletRequest request,HttpServletResponse response,Model model) {
		Enumeration<String> enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String paraName = (String) enu.nextElement();
			System.out.println(paraName+"::"+request.getParameter(paraName));
		}
		String name = request.getParameter("name");  
		String password = request.getParameter("password");  
//		String password1 = request.getParameter("password1");  
		String cellphone = request.getParameter("cellphone");  
		String email = request.getParameter("email");  
		String verCode = request.getParameter("verCode");  
		String idType = request.getParameter("idType");  
		String idNum = request.getParameter("idNum");  
		String gender = request.getParameter("gender");  
//		String fileName = request.getParameter("fileName");  
//		String[] fileNames = fileName.split(",");
//		if(fileNames.length !=2){
//			Assert.isNull(null, "证件照片上传有误。");
//		}
		String sessionVerCode = (String) request.getSession().getAttribute(Constant.SESSION_VER_CODE);
		if(StringUtils.isBlank(sessionVerCode)||StringUtils.isBlank(verCode)){
			model.addAttribute("message", "操作有误，请重试");
			return "forward:/"+languageType+"/register";
		}else if(!sessionVerCode.toLowerCase().equals(verCode.toLowerCase())){
			model.addAttribute("message", "验证码输入有误，请重试");
			return "forward:/"+languageType+"/register";
		}
		UserInfo userInfo = new UserInfo();
		userInfo.setName(name);
		userInfo.setPassword(DigestUtils.sha256Hex(password));
		userInfo.setCellphone(cellphone);
		userInfo.setEmail(email);
		userInfo.setIdType(idType);
		userInfo.setIdNum(idNum);
		userInfo.setGender(gender);
//		userInfo.setFileName(fileNames);
		userInfo.setCreateTime(new Date());
		
		try {
			Assert.isNull(userInfo, "传入对象为空");
			Assert.isNull(userInfo.getName(), "用户名不能为空");
			Assert.isNull(userInfo.getPassword(), "密码不能为空");
			Assert.isNull(userInfo.getCellphone(), "手机号不能为空");
			Assert.isNull(userInfo.getIdNum(), "证件号码不能为空");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", e.getMessage());
			return "forward:/"+languageType+"/register";
		}
        userInfoService.save(userInfo);
        // 设置cookie  
        Cookie cookieName = new Cookie(Constant.COOKIE_NAME, userInfo.getEmail());  
        cookieName.setMaxAge(Constant.COOKIE_MAX_AGE);  
        response.addCookie(cookieName);  
        Cookie cookiePwd = new Cookie(Constant.COOKIE_PWD, userInfo.getPassword());  
        cookiePwd.setMaxAge(Constant.COOKIE_MAX_AGE);  
        response.addCookie(cookiePwd);  
       
        System.out.println(JSONObject.toJSON(userInfo));
        request.getSession().setAttribute(Constant.SESSION_LOGIN_KEY, userInfo);
        return "redirect:/"+languageType+"/index";
    }

	@RequestMapping(value = "login")
    public String login(HttpServletRequest req) {
		if(req.getSession().getAttribute(Constant.SESSION_LOGIN_KEY) != null){
			return "redirect:/"+languageType+"/index";
		}
        return languageType+"/login";
    }
	
	@RequestMapping(value = "submit",method=RequestMethod.POST)
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
        	map.put("msg", "User name or password is not correct.");
        	return "forward:/"+languageType+"/login";
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
        return "redirect:/"+languageType+"/index";
    }

	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
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
	    return languageType+"/index";
	}
	
	@RequestMapping(value = "user/checkUser",method=RequestMethod.POST)
    public @ResponseBody String checkUser(HttpServletRequest req,UserInfo userInfo) {
    	ResultBean result = new ResultBean();
    	
    	try {
    		Assert.isNull(userInfo, "传入对象为空");
    		Assert.isNull(userInfo.getName(), "用户名不能为空");
    		UserInfo user = userInfoService.getUserInfo(userInfo);
    		if(user != null && user.getName() != null){
    			throw new BizException("7000","用户名已存在");
    		}
    	} catch (Exception e) {
    		result.setMessage(e.getMessage());
    		result.setCode("7000");
    	}
    	return JSONObject.toJSONString(result);
    }
	
	
	@RequestMapping(value = "user/saveIDPhoto",method=RequestMethod.POST)
    public @ResponseBody String userIDPhoto(HttpServletRequest req) {
    	ResultBean result = new ResultBean();
    	try {
    		List<FileInfo> list = new ArrayList<FileInfo>();
    		UserInfo user = (UserInfo) req.getSession().getAttribute(Constant.SESSION_LOGIN_KEY);
    		if(user==null) {
    			result.setMessage("请先登录，再进行此操作");
        		result.setCode("7000");
        		return JSONObject.toJSONString(result);
    		}
    		String fileName = req.getParameter("fileName");
    		String[] fileNames = fileName.split(",");
    		for(String s :fileNames) {
    			FileInfo fileInfo = new FileInfo();
    			fileInfo.setFileName(s);
    			fileInfo.setFileType("1");
    			fileInfo.setStatus("5");
    			fileInfo.setExternalId(Long.valueOf(user.getId()));
    			list.add(fileInfo);
    		}
    		fileInfoService.saveBatch(list);
    		UserInfo userInfo = new UserInfo();
    		userInfo.setId(user.getId());
    		req.getSession().setAttribute(Constant.SESSION_LOGIN_KEY,userInfoService.getUserInfo(userInfo));
    	} catch (Exception e) {
    		result.setMessage(e.getMessage());
    		result.setCode("7000");
    	}
    	return JSONObject.toJSONString(result);
    }
}
