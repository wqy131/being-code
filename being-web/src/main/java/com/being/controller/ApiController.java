package com.being.controller;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.awt.image.RenderedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.being.constant.Constant;
import com.being.constant.ResultBean;
import com.being.dto.AccountBlockResponse;
import com.being.dto.RemoteResultBean;
import com.being.exception.Assert;
import com.being.model.BeatCardInfo;
import com.being.model.UserInfo;
import com.being.model.WalletInfo;
import com.being.service.BeatCardInfoService;
import com.being.service.RemoteService;
import com.being.service.UserInfoService;
import com.being.service.WalletInfoService;
import com.being.util.VerificationCodeUtil;


@RestController
public class ApiController extends BaseController{
	
	@Value("${web.upload-path}")
    private String path;

	private String blockUrl = "http://54.92.64.161:8080/bewallet/serchbec";
	
	@Autowired
    private UserInfoService userInfoService;
	@Autowired
	private RemoteService remoteService;
	@Autowired
	private BeatCardInfoService beatCardInfoService;
	
	@Autowired
	private WalletInfoService walletInfoService;
	
	/**
	 * app用户登录接口
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "app/login/submit",method=RequestMethod.POST)
    public String loginSubmit(@RequestBody UserInfo user) {
		ResultBean resultBean = new ResultBean();
		if(user==null || StringUtils.isBlank(user.getName())||StringUtils.isBlank(user.getPassword())){
			resultBean.setCode("9999");
	    	resultBean.setMessage("用户名和密码不能为空");
	    	return resultBean.toString();
		}
		UserInfo userInfo = new UserInfo();
		if (Constant.CELLPHONE_PATTERN.matcher(user.getName()).matches()) {// 传入参数是手机号码类型，则用手机号码查询用户
			userInfo.setCellphone(user.getName());
		} else if (Constant.EMAIL_PATTERN.matcher(user.getName()).matches()) {// 传入参数是email类型，则用email查询用户
			userInfo.setEmail(user.getName());
		} else {// 默认传入参数是用户名类型，用用户名查询用户
			userInfo.setName(user.getName());
		}
		userInfo.setPassword(DigestUtils.sha256Hex(user.getPassword()));
		UserInfo user1 = userInfoService.getUserInfo(userInfo);
		
        if(user1==null){
        	System.out.println("根据登录信息未找到相应的用户:"+JSONObject.toJSON(userInfo));
        	resultBean.setCode("9999");
        	resultBean.setMessage("用户名或密码不正确");
        	return resultBean.toString();
        }
        user1.setPassword(null);
     // Create Twt token
        String jwtToken = Jwts.builder().setSubject(user.getName()).claim("userId", user1.getId())
        		.setIssuedAt(new Date()).signWith(SignatureAlgorithm.HS256, Constant.JWT_SECRETKEY).compact();

        resultBean.setCode("0000");
    	resultBean.setMessage("登陆成功");
    	resultBean.setToken(jwtToken);
        resultBean.setData(userInfo);
    	return resultBean.toString();
    }
	
	@RequestMapping(value = "app/register/verCode",method=RequestMethod.GET)
    public String getVerCode() throws IOException {
		ResultBean resultBean = new ResultBean();
		String imgPath = "ver-code-"+System.currentTimeMillis()+".jpg";
		OutputStream out = new FileOutputStream(path+imgPath);
	    Map<String,Object> map = VerificationCodeUtil.generateCodeAndPic();
	    ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", out);
	    System.out.println("验证码的值为："+map.get("code"));
	    
		String jwtToken = Jwts.builder().setSubject(map.get("code").toString())
        		.setIssuedAt(new Date()).signWith(SignatureAlgorithm.HS256, Constant.JWT_SECRETKEY).compact();
		resultBean.setData("/ajax/show?fileName="+imgPath);
		resultBean.setCode("0000");
    	resultBean.setMessage("登陆成功");
    	resultBean.setToken(jwtToken);
    	return resultBean.toString();
	}
//	@RequestMapping(value = "app/register/checkCode",method=RequestMethod.POST)
//	public String checkCode(HttpServletRequest request,HttpServletResponse response) {
//		String verCode = request.getParameter("verCode");
//		Claims claims = (Claims) request.getAttribute("claims");
//		LinkedHashMap map = (LinkedHashMap) claims.get("userId");//此处获取信息有延迟
//	}
	
	@RequestMapping(value = "app/register/submit",method=RequestMethod.POST)
    public String registerSubmit(@RequestBody UserInfo user) {
		String name = user.getName();  
		String password = user.getPassword();  
//		String password1 = request.getParameter("password1");  
		String cellphone = user.getCellphone();  
		String email = user.getEmail();  
		String gender = user.getGender();  
		String userAddress = user.getUserAddress();  
		UserInfo userInfo = new UserInfo();
		userInfo.setName(name);
		userInfo.setPassword(DigestUtils.sha256Hex(password));
		userInfo.setCellphone(cellphone);
		userInfo.setEmail(email);
		userInfo.setGender(gender);
		userInfo.setIdNum(user.getIdNum());
		userInfo.setIdType(user.getIdType());
		userInfo.setUserAddress(userAddress);
		userInfo.setCreateTime(new Date());
		ResultBean resultBean = new ResultBean();
		try {
			Assert.isNull(userInfo, "传入对象为空");
			Assert.isNull(userInfo.getName(), "用户名不能为空");
			Assert.isNull(userInfo.getPassword(), "密码不能为空");
			Assert.isNull(userInfo.getCellphone(), "手机号不能为空");
		} catch (Exception e) {
			e.printStackTrace();
			resultBean.setCode("9999");
        	resultBean.setMessage(e.getMessage());
			return resultBean.toString();
		}
        userInfoService.save(userInfo);
     // Create Twt token
        String jwtToken = Jwts.builder().setSubject(userInfo.getName()).claim("userId", userInfo.getId())
                .setIssuedAt(new Date()).signWith(SignatureAlgorithm.HS256, Constant.JWT_SECRETKEY).compact();

        resultBean.setCode("0000");
        resultBean.setMessage("登陆成功");
        resultBean.setToken(jwtToken);
        //resultBean.setData(userInfo);
        return resultBean.toString();
    }
	
	@RequestMapping(value = "app/secure/getUserInfo",method=RequestMethod.POST)
	public String getUserInfo() {
		System.out.println("app/secure/getUserInfo");
		UserInfo user = getUerInfoByUserId();
		ResultBean resultBean = new ResultBean();
		if(!Objects.isNull(user)){
		 	resultBean.setCode("0000");
		 	resultBean.setMessage("操作成功");
			resultBean.setData(user);
		}else{
		 	resultBean.setCode("9999");
		 	resultBean.setMessage("未获取到用户信息，请重新登录");
		}
        return JSONObject.toJSONString(resultBean);
	}
	
	@RequestMapping(value = "app/secure/beatCard",method=RequestMethod.POST)
	public String saveBeatCard() {
		Integer userId = getUerIdByWjt();
		ResultBean resultBean = new ResultBean();
		if(!Objects.isNull(userId)){
			BeatCardInfo info = new BeatCardInfo();
			info.setUserId(userId);
			info.setCreateTime(new Date());
			info.setCreateId(userId);
			Integer result = beatCardInfoService.insert(info);
			if(result == 0){
				resultBean.setCode("9999");
				resultBean.setMessage("已签到，不可重复操作");
			}else{
				resultBean.setCode("0000");
				resultBean.setMessage("操作成功");
			}
		}else{
			resultBean.setCode("9999");
			resultBean.setMessage("未获取到用户信息，请重新登录");
		}
		return JSONObject.toJSONString(resultBean);
	}
	
	@RequestMapping(value = "app/secure/getCardState",method=RequestMethod.POST)
	public String getCardState() {
		Integer userId = getUerIdByWjt();
		ResultBean resultBean = new ResultBean();
		if(!Objects.isNull(userId)){
			BeatCardInfo info = new BeatCardInfo();
			info.setUserId(userId);
			info.setCreateTime(new Date());
			BeatCardInfo result = beatCardInfoService.selectBeatCard(info);
			resultBean.setCode("0000");
			resultBean.setMessage("操作成功");
			resultBean.setData(Objects.nonNull(result)?true:false);
		}else{
			resultBean.setCode("9999");
			resultBean.setMessage("未获取到用户信息，请重新登录");
		}
		return JSONObject.toJSONString(resultBean);
	}
	
	@RequestMapping(value = "app/secure/getBlockInfo",method=RequestMethod.POST)
	public String getBlockInfo() {
		System.out.println("app/secure/getBlockInfo");
		UserInfo user = getUerInfoByUserId();
		user = setUserBlockInfo(user);
		ResultBean resultBean = new ResultBean();
		if(!Objects.isNull(user)){
		 	resultBean.setCode("0000");
		 	resultBean.setMessage("操作成功");
		 	UserInfo user1 = new UserInfo();
		 	user1.setBalance(user.getBalance());
		 	user1.setUserAddress(user.getUserAddress());
			resultBean.setData(user1);
		}else{
		 	resultBean.setCode("9999");
		 	resultBean.setMessage("未获取到用户信息，请重新登录");
		}
        return JSONObject.toJSONString(resultBean);
	}
	
	@RequestMapping(value = "app/secure/getWalletInfo",method=RequestMethod.POST)
	public String getWalletInfo() {
		Integer userId = getUerIdByWjt();
		ResultBean resultBean = new ResultBean();
		if(!Objects.isNull(userId)){
			WalletInfo wallet = walletInfoService.selectByUserId(userId);
			resultBean.setCode("0000");
			resultBean.setMessage("操作成功");
			resultBean.setData(wallet);
		}else{
			resultBean.setCode("9999");
			resultBean.setMessage("未获取到用户信息，请重新登录");
		}
		return JSONObject.toJSONString(resultBean);
	}
	
	@RequestMapping(value = "app/secure/perfectUser",method=RequestMethod.POST)
	public String perfectUser(@RequestBody UserInfo user,HttpServletRequest request) {
//	  updateByIdBlock
	  String userAddress = user.getUserAddress();
	  UserInfo userInfo = new UserInfo();
	  userInfo.setUserAddress(userAddress);
	  userInfo.setCreateTime(new Date());
	  ResultBean resultBean = new ResultBean();
	  try {
	    Assert.isNull(userInfo, "传入对象为空");
	    Assert.isNull(userInfo.getUserAddress(), "地址信息不能为空");
	  } catch (Exception e) {
	    e.printStackTrace();
	    resultBean.setCode("9999");
	    resultBean.setMessage(e.getMessage());
	    return resultBean.toString();
	  }
	  Integer userId = this.getUerIdByWjt();
	  if(Objects.isNull(userId)) {
		 resultBean.setCode("9999");
		 resultBean.setMessage("未获取到用户信息，请重新登录");
		 return resultBean.toString();
	  }
	  userInfo.setId(userId);
	  userInfo = userInfoService.updateByIdBlock(userInfo);
      userInfo.setPassword(null);
	  // Create Twt token
//	  String jwtToken = Jwts.builder().setSubject(userInfo.getName()).claim("userId", userInfo.getId())
//	      .setIssuedAt(new Date()).signWith(SignatureAlgorithm.HS256, Constant.JWT_SECRETKEY).compact();
	  
	  resultBean.setCode("0000");
	  resultBean.setMessage("操作成功");
//	  resultBean.setToken(jwtToken);
	  return resultBean.toString();
	}
	
	
	private UserInfo setUserBlockInfo(UserInfo userInfo) {
	  if(userInfo!=null && !Objects.isNull(userInfo.getUserAddress())) {
        Map<String, String> requestParam = new HashMap<String,String>();
        requestParam.put("userAddress", userInfo.getUserAddress());
        RemoteResultBean<AccountBlockResponse> result = remoteService.postByEntity(blockUrl, requestParam, AccountBlockResponse.class);
        if(result!=null && result.isSuccess()) {
          AccountBlockResponse accountBlock = result.getData();
//          userInfo.setUserAddress(accountBlock.getUserAddress());
          userInfo.setBalance(accountBlock.getBalance());
        }else {
//          userInfo.setUserAddress("");
          userInfo.setBalance("0.000000000000000000");
        }
        userInfo.setPassword(null);
      }else{
    	  userInfo.setUserAddress("-1");
          userInfo.setBalance("0.000000000000000000");
//    	Assert.isNull(null, "未获取到用户be币信息，请先绑定钱包"); //TODO 异常需要重新处理
      }
	 return userInfo;
	}
	
	private Integer getUerIdByWjt(){
		Claims claims = (Claims) getHttpServletRequest().getAttribute("claims");
		Integer userId = (Integer)claims.get("userId");
//		Assert.isNull(userId, "未获取到用户信息，请重新登录"); //TODO 异常需要重新处理
//		if(Objects.isNull(userId))
		return userId;
	}
	private UserInfo getUerInfoByUserId(){
		Integer userId = getUerIdByWjt();
		if(Objects.isNull(userId)) {
			return null;
		}
		UserInfo userInfo = new UserInfo();
	 	userInfo.setId(userId);
	 	userInfo = userInfoService.getUserInfo(userInfo);
        userInfo.setPassword(null);
		return userInfo;
	}
}
