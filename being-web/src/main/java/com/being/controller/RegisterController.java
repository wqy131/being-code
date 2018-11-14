package com.being.controller;

import java.awt.image.RenderedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Enumeration;
import java.util.Map;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.being.constant.Constant;
import com.being.exception.Assert;
import com.being.model.UserInfo;
import com.being.service.UserInfoService;
import com.being.util.VerificationCodeUtil;

@Controller
public class RegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	/**
	 * 手机号码验证
	 */
	public static final String MODELPHONE = "1[3-9][0-9]{9}";
	public static final Pattern CELLPHONE_PATTERN = Pattern.compile(MODELPHONE);
	public static final Pattern EMAIL_PATTERN = Pattern
			.compile("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$");
	
	@Value("${web.upload-path}")
    private String path;
	
	@Autowired
    private UserInfoService userInfoService;
	
	@RequestMapping(value = "/register")
    public String register(HttpServletRequest req,Model model) throws IOException {
		if(req.getSession().getAttribute(Constant.SESSION_LOGIN_KEY) != null){
			return "redirect:index";
		}
		String imgPath = "ver-code-"+System.currentTimeMillis()+".jpg";
		OutputStream out = new FileOutputStream(path+imgPath);
	    Map<String,Object> map = VerificationCodeUtil.generateCodeAndPic();
	    ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", out);
	    System.out.println("验证码的值为："+map.get("code"));
	    req.getSession().setAttribute(Constant.SESSION_VER_CODE, map.get("code").toString());
	    
		model.addAttribute("msg", req.getParameter("message"));
		model.addAttribute("imgPath", imgPath);
        return "register/register";
    }
	
	
	@RequestMapping(value = "/register/submit",method=RequestMethod.POST)
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
			return "forward:/register";
		}else if(!sessionVerCode.toLowerCase().equals(verCode.toLowerCase())){
			model.addAttribute("message", "验证码输入有误，请重试");
			return "forward:/register";
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
			return "forward:/register";
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
        return "redirect:/index";
    }


}
