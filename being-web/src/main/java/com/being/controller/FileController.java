package com.being.controller;

import java.awt.image.RenderedImage;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.being.constant.Constant;
import com.being.constant.ResultBean;
import com.being.model.FileInfo;
import com.being.model.UserInfo;
import com.being.service.FileInfoService;
import com.being.util.FileNameUtils;
import com.being.util.FileUtils;
import com.being.util.VerificationCodeUtil;

@Controller
public class FileController {

    private final ResourceLoader resourceLoader;
    
    @Autowired
    public FileController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }
    
    @Autowired
    private FileInfoService fileService;

    @Value("${web.upload-path}")
    private String path;
    
    @Value("${web.default-avater-path}")
    private String defaultAvaterPath;

    /**
     * 跳转到文件上传页面
     * @return
     */
    @RequestMapping("file")
    public String toUpload(){
        return "file";
    }

    /**
     *
     * @param file 要上传的文件
     * @return
     */
    @RequestMapping("ajax/fileUpload")
    public @ResponseBody String upload(@RequestParam("file") MultipartFile file, ResultBean result){

        // 上传成功或者失败的提示
        
    	String code = "0000";
    	String msg = "上传成功！";
        
        String filename = FileNameUtils.getFileName(file.getOriginalFilename());
        FileInfo fileInfo = new FileInfo();
        fileInfo.setFileName(filename);
        if (!FileUtils.upload(file, path, filename)){
            msg = "上传失败！";
            code = "6000";
        }else{
//        	fileInfo.setCreateTime(new );
        	fileService.save(fileInfo);
        }
        result.setCode(code);
        result.setMessage(msg);
        result.setData(fileInfo);
        
        return JSONObject.toJSONString(result);
    }
    
    //多文件上传
    @RequestMapping(value = "batch/upload", method = RequestMethod.POST)
    public String handleFileUpload(HttpServletRequest request,Map<String, Object> mapResult) {
        List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
        MultipartFile file = null;
        String succFlag = "0000";
        String erroMsg = "";
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        for (int i = 0; i < files.size(); ++i) {
            file = files.get(i);
            if (!file.isEmpty()) {
            	Map<String, String> map = new HashMap<String,String>();
                    try {
						String filename = FileNameUtils.getFileName(file.getOriginalFilename());
						if (FileUtils.upload(file, path, filename)){
							map.put("code", "0000");
							map.put("msg", "上传成功");
						    map.put("fileName", filename);
						}else{
							succFlag = "9999";
							map.put("code", "9999");
							map.put("msg", "上传失败");
						}
					} catch (Exception e) {
						succFlag = "9999";
						map.put("code", "9999");
						map.put("msg", e.getMessage());
					}
                    list.add(map);
            } else {
            	succFlag = "9999";
            	erroMsg = "文件上传有空值";
            }
        }
        mapResult.put("list", list);
        mapResult.put("code", succFlag);
        mapResult.put("erroMsg", erroMsg);
//        return JSONObject.toJSONString(mapResult);
        return "forward:/file";
    }

    /**
     * 显示单张图片
     * @return
     */
    @RequestMapping("ajax/show")
    public ResponseEntity showPhotos(String fileName,HttpServletRequest req){

        try {
        	String filePath = path + "default.png";
        	if(StringUtils.isNotBlank(fileName)){
        		// 由于是读取本机的文件，file是一定要加上的， path是在application配置文件中的路径,后期如果有图片服务器，再做优化
        		filePath = path + fileName;
        		return ResponseEntity.ok(resourceLoader.getResource("file:" + filePath));
        	}
        	String url = "http://" + req.getServerName() //服务器地址  
                    + ":"   
                    + req.getServerPort()           //端口号  
                    + req.getContextPath();      //项目名称
        	return ResponseEntity.ok(resourceLoader.getResource(url+defaultAvaterPath));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    /**
     * 显示单张图片
     * @return
     */
    @RequestMapping("app/ajax/show")
    public ResponseEntity appShowPhotos(String fileName,HttpServletRequest req){

        try {
        	String filePath = path + "default.png";
        	if(StringUtils.isNotBlank(fileName)){
        		// 由于是读取本机的文件，file是一定要加上的， path是在application配置文件中的路径,后期如果有图片服务器，再做优化
        		filePath = path + fileName;
        		return ResponseEntity.ok(resourceLoader.getResource("file:" + filePath));
        	}
        	String url = "http://" + req.getServerName() //服务器地址  
                    + ":"   
                    + req.getServerPort()           //端口号  
                    + req.getContextPath();      //项目名称
        	return ResponseEntity.ok(resourceLoader.getResource(url+defaultAvaterPath));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @RequestMapping(value = "ajax/getVerCode",method=RequestMethod.GET)
    public @ResponseBody String getVerCode(HttpServletRequest req) {
    	ResultBean result = new ResultBean();
    	try {
    		String imgPath = "ver-code-"+System.currentTimeMillis()+".jpg";
    		OutputStream out = new FileOutputStream(path+imgPath);
    	    Map<String,Object> map = VerificationCodeUtil.generateCodeAndPic();
    	    ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", out);
    	    System.out.println("验证码的值为："+map.get("code"));
    	    req.getSession().setAttribute(Constant.SESSION_VER_CODE, map.get("code"));
    	    
    	    result.setData(imgPath);
    	} catch (Exception e) {
    		result.setMessage(e.getMessage());
    		result.setCode("7000");
    	}
    	return JSONObject.toJSONString(result);
    }
    
   

}
