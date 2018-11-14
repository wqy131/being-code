package com.being.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.being.exception.Assert;
import com.being.model.ContactInfo;
import com.being.service.ContactInfoService;

@Controller
public class IndexController {
	
	@Autowired
	private ContactInfoService contactInfoService;
	
	@RequestMapping({"/","index"})
    public ModelAndView getIndex() {
        ModelAndView result = new ModelAndView("en/index");
        return result;
    }
	@RequestMapping({"/indexEnglish"})
	public ModelAndView getIndexEnglish() {
		ModelAndView result = new ModelAndView("indexEnglish");
		return result;
	}
	@RequestMapping(value="/public/saveContact",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public @ResponseBody String contactInfo(ContactInfo contactInfo,Map<String, Object> map) {
		try {
			Assert.isNull(contactInfo, "参数不能为空");
			Assert.isNull(contactInfo.getName(), "姓名不能为空");
			Assert.isNull(contactInfo.getEmail(), "邮箱不能为空");
			Assert.isNull(contactInfo.getTel(), "手机号不能为空");
			Assert.isNull(contactInfo.getSubject(), "标题不能为空");
			Assert.isNull(contactInfo.getMessage(), "说明不能为空");
			contactInfoService.save(contactInfo);
		} catch (Exception e) {
//			e.printStackTrace();
			return e.getMessage();
		}
		return "提交成功，我们会尽快与您沟通，期待与您的合作";
	}
}
