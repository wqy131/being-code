package com.being.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
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

/**
 * @author liuzh
 * @since 2015-12-19 11:10
 */
@RestController
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private FileInfoService fileInfoService;
    

    
    @RequestMapping(value = "ajax/checkUser",method=RequestMethod.POST)
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
