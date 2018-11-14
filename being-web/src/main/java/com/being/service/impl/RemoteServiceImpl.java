package com.being.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.being.conf.RestTemplateConfig;
import com.being.dto.RemoteResultBean;
import com.being.service.RemoteService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * PublicClassActivityattentionServiceImpl服务实现方法
 */
@Service
@ConfigurationProperties
@Import({RestTemplateConfig.class})
public class RemoteServiceImpl implements RemoteService {

  @Resource
  private RestTemplate restTemplate;

  private Logger logger = LoggerFactory.getLogger(RemoteServiceImpl.class);

 
  @Override
  public <T> RemoteResultBean<T> sendWithHeader(String url, Map<String, Object> requestParam,
      Map<String, String> requestHeader, HttpMethod httpMethod, Class<?> clazz) {
    RemoteResultBean<T> resultBean = new RemoteResultBean<T>();
    ObjectMapper objectMapper = new ObjectMapper();
    try {
      JSONObject jsonObject = sendRequest(url, requestParam, requestHeader, httpMethod);
      resultBean = convertFromJSONObjectToObject(jsonObject, clazz);
    } catch (JsonProcessingException e) {
      logger.error("远程调用异常转换异常 err:" + e.getMessage());
      resultBean.setCode("9998");
      resultBean.setMessage("远程调用异常");
    } catch (IOException e) {
      logger.error("远程调用异常转换异常 err:" + e.getMessage());
      resultBean.setCode("9998");
      resultBean.setMessage("远程调用异常转换异常");
    }
    return resultBean;
  }

  @Override
  public <T> RemoteResultBean<List<T>> sendWithHeader4List(String url,
      Map<String, Object> requestParam, Map<String, String> requestHeader, HttpMethod httpMethod,
      Class<?> clazz) {
    RemoteResultBean<List<T>> resultBean = new RemoteResultBean<List<T>>();
    try {
      JSONObject jsonObject = sendRequest(url, requestParam, requestHeader, httpMethod);
      resultBean = convertFromJSONObjectToList(jsonObject, clazz);
    } catch (JsonProcessingException e) {
      logger.error("远程调用异常转换异常 err:" + e.getMessage());
      resultBean.setCode("9998");
      resultBean.setMessage("远程调用异常");
    } catch (IOException e) {
      logger.error("远程调用异常转换异常 err:" + e.getMessage());
      resultBean.setCode("9998");
      resultBean.setMessage("远程调用异常转换异常");
    }
    return resultBean;
  }

  @Override
  public <T> RemoteResultBean<List<T>> sendObjectWithHeader4List(String url,
      Object requestParam, Map<String, String> requestHeader, HttpMethod httpMethod,
      Class<?> clazz) {
    RemoteResultBean<List<T>> resultBean = new RemoteResultBean<List<T>>();
    try {
      JSONObject jsonObject = sendObjectRequest(url, requestParam, requestHeader, httpMethod);
      resultBean = convertFromJSONObjectToList(jsonObject, clazz);
    } catch (JsonProcessingException e) {
      logger.error("远程调用异常转换异常 err:" + e.getMessage());
      resultBean.setCode("9998");
      resultBean.setMessage("远程调用异常");
    } catch (IOException e) {
      logger.error("远程调用异常转换异常 err:" + e.getMessage());
      resultBean.setCode("9998");
      resultBean.setMessage("远程调用异常转换异常");
    }
    return resultBean;
  }

  @Override
  public <T> RemoteResultBean<T> sendWithoutHeader(String url, Map<String, Object> requestParam,
      HttpMethod httpMethod, Class<?> clazz) {
    return sendWithHeader(url, requestParam, null, httpMethod, clazz);
  }

  @Override
  public <T> RemoteResultBean<List<T>> sendWithoutHeader4List(String url,
      Map<String, Object> requestParam, HttpMethod httpMethod, Class<?> clazz) {
    return sendWithHeader4List(url, requestParam, null, httpMethod, clazz);
  }

  @Override
  public <T> RemoteResultBean<T> postByEntity(String url,
      Map<String, String> requestParam, Class<?> clazz) {
    ResponseEntity<String> response = restTemplate.postForEntity(url, requestParam, String.class);
    return convertFromJSONObjectToObject(JSONObject.parseObject(response.getBody()), clazz);
  }

  private JSONObject sendRequest(String url, Map<String, Object> requestParam,
      Map<String, String> requestHeader, HttpMethod httpMethod) throws IOException {
    //headers
    HttpHeaders requestHeaders = new HttpHeaders();
    if (null != requestHeader) {
      for (Map.Entry<String, String> entry : requestHeader.entrySet()) {
        requestHeaders.add(entry.getKey(), entry.getValue());
      }
    }

    //body
    MultiValueMap<String, Object> requestBody = new LinkedMultiValueMap<>();
    if (null != requestParam) {
      for (Map.Entry<String, Object> entry : requestParam.entrySet()) {
        requestBody.add(entry.getKey(), entry.getValue());
      }
    }

    //组装HttpEntity
//    HttpEntity<JSONObject> requestEntity = new HttpEntity<>(JSONObject.parseObject(JSON.toJSONString(requestParam)),
//        requestHeaders);
    HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(requestBody,
        requestHeaders);

    String json = "";
    if (httpMethod == HttpMethod.GET) {
      ResponseEntity<String> response = restTemplate
          .exchange(url, HttpMethod.GET, requestEntity, String.class);
      json = response.getBody();
    } else if (httpMethod == HttpMethod.POST) {
      json = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class).getBody();
    } else {
      Map<String, String> result = new HashMap<>();
      result.put("Code", "9999");
      result.put("Message", "请求方式只支持Get和Post");
      ObjectMapper objectMapper = new ObjectMapper();
      json = objectMapper.writeValueAsString(result);
    }
    return JSONObject.parseObject(json);
  }

  private JSONObject sendObjectRequest(String url, Object requestParam,
      Map<String, String> requestHeader, HttpMethod httpMethod) throws IOException {
    //headers
    HttpHeaders requestHeaders = new HttpHeaders();
    if (null != requestHeader) {
      for (Map.Entry<String, String> entry : requestHeader.entrySet()) {
        requestHeaders.add(entry.getKey(), entry.getValue());
      }
    }
    //组装HttpEntity
    HttpEntity<Object> requestEntity = new HttpEntity<>(requestParam,
        requestHeaders);

    String json = "";
    if (httpMethod == HttpMethod.GET) {
      ResponseEntity<String> response = restTemplate
          .exchange(url, HttpMethod.GET, requestEntity, String.class);
      json = response.getBody();
    } else if (httpMethod == HttpMethod.POST) {
      json = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class).getBody();
    } else {
      Map<String, String> result = new HashMap<>();
      result.put("Code", "9999");
      result.put("Message", "请求方式只支持Get和Post");
      ObjectMapper objectMapper = new ObjectMapper();
      json = objectMapper.writeValueAsString(result);
    }
    return JSONObject.parseObject(json);
  }

  /**
   * 无返回结果的请求
   */
  private void sendRequestWithOutResponse(String url, Map<String, Object> requestParam,
      Map<String, String> requestHeader, HttpMethod httpMethod) throws IOException {
    //headers
    HttpHeaders requestHeaders = new HttpHeaders();
    if (null != requestHeader) {
      for (Map.Entry<String, String> entry : requestHeader.entrySet()) {
        requestHeaders.add(entry.getKey(), entry.getValue());
      }
    }

    //body
    MultiValueMap<String, Object> requestBody = new LinkedMultiValueMap<>();
    if (null != requestParam) {
      for (Map.Entry<String, Object> entry : requestParam.entrySet()) {
        requestBody.add(entry.getKey(), entry.getValue());
      }
    }

    //组装HttpEntity
    HttpEntity<JSONObject> requestEntity = new HttpEntity<>(
        JSONObject.parseObject(JSON.toJSONString(requestParam)),
        requestHeaders);
    String json = "";
    if (httpMethod == HttpMethod.GET) {
      ResponseEntity<String> response = restTemplate
          .exchange(url, HttpMethod.GET, requestEntity, String.class);
      json = response.getBody();
    } else if (httpMethod == HttpMethod.POST) {
      json = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class).getBody();
    } else {
      Map<String, String> result = new HashMap<>();
      result.put("Code", "9999");
      result.put("Message", "请求方式只支持Get和Post");
      ObjectMapper objectMapper = new ObjectMapper();
      json = objectMapper.writeValueAsString(result);
    }
  }

  private String sendRequestReturnString(String url, Map<String, Object> requestParam,
      Map<String, String> requestHeader, HttpMethod httpMethod) throws IOException {
    //headers
    HttpHeaders requestHeaders = new HttpHeaders();
    if (null != requestHeader) {
      for (Map.Entry<String, String> entry : requestHeader.entrySet()) {
        requestHeaders.add(entry.getKey(), entry.getValue());
      }
    }

    //body
    MultiValueMap<String, Object> requestBody = new LinkedMultiValueMap<>();
    if (null != requestParam) {
      for (Map.Entry<String, Object> entry : requestParam.entrySet()) {
        requestBody.add(entry.getKey(), entry.getValue());
      }
    }

    //组装HttpEntity
    HttpEntity<JSONObject> requestEntity = new HttpEntity<>(
        JSONObject.parseObject(JSON.toJSONString(requestParam)),
        requestHeaders);
    String json = "";
    if (httpMethod == HttpMethod.GET) {
      ResponseEntity<String> response = restTemplate
          .exchange(url, HttpMethod.GET, requestEntity, String.class);
      json = response.getBody();
    } else if (httpMethod == HttpMethod.POST) {
      json = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class).getBody();
    } else {
      Map<String, String> result = new HashMap<>();
      result.put("Code", "9999");
      result.put("Message", "请求方式只支持Get和Post");
      ObjectMapper objectMapper = new ObjectMapper();
      json = objectMapper.writeValueAsString(result);
    }
    return json;
  }

  private <T> RemoteResultBean<List<T>> convertFromJSONObjectToList(JSONObject jsonObject,
      Class<?> clazz) {
    RemoteResultBean<List<T>> resultBean = new RemoteResultBean<List<T>>();
    if (null == jsonObject) {
      resultBean.setCode("9995");
      resultBean.setMessage("调用远程方法失败 返回对象为空");
    } else {
      if (jsonObject.containsKey("Code") || jsonObject.containsKey("Status")) {
        if (jsonObject.containsKey("Code") && jsonObject.getString("Code").equals("0")
            || jsonObject.containsKey("Status") && jsonObject.getString("Status").equals("true")) {
          if (jsonObject.containsKey("Data")) {
            JSONArray jsonArray = jsonObject.getJSONArray("Data");
            List<T> list = (List<T>) JSON.parseArray(jsonArray.toJSONString(), clazz);
            resultBean.setData(list);
          } else {
            resultBean.setCode("9993");
            resultBean.setMessage("调用远程方法未返回Data");
            logger.info(jsonObject.toString());
          }

        } else {
          resultBean.setCode("9995");
          resultBean.setMessage("调用远程方法失败");
          logger.info(jsonObject.toString());
        }
      } else {
        resultBean.setCode("9994");
        resultBean.setMessage(jsonObject.toString());
        logger.info(jsonObject.toString());
      }
    }
    return resultBean;
  }

  private <T> RemoteResultBean<T> convertFromJSONObjectToObject(JSONObject jsonObject,
      Class<?> clazz) {
    RemoteResultBean<T> resultBean = new RemoteResultBean<T>();
    if (null == jsonObject) {
      resultBean.setCode("9995");
      resultBean.setMessage("调用远程方法失败 返回对象为空");
    } else {
      if (jsonObject.containsKey("code")) {
        if (jsonObject.getString("code").equals("200")) {
          if (jsonObject.containsKey("data")) {
            JSONObject jsonObjectNew = jsonObject.getJSONObject("data");
            T object = (T) JSONObject.parseObject(jsonObjectNew.toJSONString(), clazz);
            resultBean.setData(object);
          } else {
            resultBean.setCode("9993");
            resultBean.setMessage("调用远程方法未返回Data");
            logger.info(jsonObject.toString());
          }
        } else {
          resultBean.setCode("9995");
          resultBean.setMessage("调用远程方法失败");
          logger.info(jsonObject.toString());
        }
      } else {
        resultBean.setCode("9994");
        resultBean.setMessage(jsonObject.toString());
        logger.info(jsonObject.toString());
      }
    }
    return resultBean;
  }

//  private JSONObject commonPostByEntity(String url, Map<String, String> requestParam) {
////    String jsonStr = JSON.toJSONString(requestParam);
////    byte[] bs = jsonStr.getBytes(Charset.forName("UTF-8"));
//
////    HttpHeaders requestHeader = new HttpHeaders();
////    requestHeader.add("Content-Type", "application/json");
////    requestHeader.add("Accept", "application/json");
////    requestHeader.add("ContentLength", bs.length + "");
////    requestHeader.add("MaximumAutomaticRedirections", "4");
////    requestHeader.add("MaximumResponseHeadersLength", "4");
////    requestHeader
////        .add("Credentials",
////            ""); //TODO  .net中取这个值 System.Net.CredentialCache.DefaultCredentials java中不知道对应什么
////
//////    HttpEntity<byte[]> requestEntity = new HttpEntity<>(bs, requestHeader);
////    HttpEntity
//
//    String json = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class)
//        .getBody();
//    return JSON.parseObject(json);
//  }

  /**
   * 手机号码加解密服务
   *
   * @param url, value
   */
  public String cryption(String url, String value) {
    value = "=" + value;
    byte[] valueByte = value.getBytes();

    HttpHeaders requestHeader = new HttpHeaders();
    requestHeader.add("Content-Type", "application/x-www-form-urlencoded");
    HttpEntity<byte[]> requestEntity = new HttpEntity<>(valueByte, requestHeader);
    String json = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class)
        .getBody();
    JSONObject jsonObject = JSON.parseObject(json);
    return jsonObject.getString("Data");
  }

  @Override
  public void sendWithoutResponse(String url, Map<String, Object> requestParam,
      Map<String, String> requestHeader, HttpMethod httpMethod) {
    try {
      sendRequestWithOutResponse(url, requestParam, requestHeader, httpMethod);
    } catch (IOException e) {
      logger.error("远程调用异常 url:" + url + " err:" + e.getMessage());
    }
  }

  @Override
  public <T> RemoteResultBean<T> sendReturnString(String url, Map<String, Object> requestParam,
      Map<String, String> requestHeader, HttpMethod httpMethod) {
    RemoteResultBean<T> resultBean = new RemoteResultBean<T>();
    try {
      String result = sendRequestReturnString(url, requestParam, requestHeader, httpMethod);
      resultBean.setData((T) result);
    } catch (IOException e) {
      logger.error("远程调用异常 url:" + url + " err:" + e.getMessage());
      resultBean.setCode("9996");
      resultBean.setMessage("远程调用异常 url:" + url);
    }
    return resultBean;
  }
}
