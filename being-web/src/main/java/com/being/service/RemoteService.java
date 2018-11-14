package com.being.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpMethod;

import com.being.dto.RemoteResultBean;

public interface RemoteService {

    /**
     * 发送带Header头的请求 并返回对应对象
     * @param url
     * @param requestParam
     * @param requestHeader
     * @param httpMethod
     * @param clazz
     * @return
     */
    <T> RemoteResultBean<T> sendWithHeader(String url, Map<String, Object> requestParam, Map<String, String> requestHeader, HttpMethod httpMethod, Class<?> clazz);

    /**
     * 发送带Header头的请求 并返回对应对象的List
     * @param url
     * @param requestParam
     * @param requestHeader
     * @param httpMethod
     * @param clazz
     * @return
     */
    <T> RemoteResultBean<List<T>> sendWithHeader4List(String url, Map<String, Object> requestParam, Map<String, String> requestHeader, HttpMethod httpMethod, Class<?> clazz);

  <T> RemoteResultBean<List<T>> sendObjectWithHeader4List(String url,
      Object requestParam, Map<String, String> requestHeader, HttpMethod httpMethod,
      Class<?> clazz);

  /**
     * 发送不带Header头的请求 并返回对应对象
     * @param url
     * @param requestParam
     * @param httpMethod
     * @param clazz
     * @return
     */
    <T> RemoteResultBean<T> sendWithoutHeader(String url, Map<String, Object> requestParam, HttpMethod httpMethod, Class<?> clazz);

    /**
     * 发送不带Header头的请求 并返回对应对象的List
     * @param url
     * @param requestParam
     * @param httpMethod
     * @param clazz
     * @return
     */
    <T> RemoteResultBean<List<T>> sendWithoutHeader4List(String url, Map<String, Object> requestParam, HttpMethod httpMethod, Class<?> clazz);

    <T> RemoteResultBean<T> postByEntity(String url,
        Map<String, String> requestParam, Class<?> clazz);

    /**
     * 手机号码加解密服务
     * @param url
     * @param value
     * @return
     */    
    public String cryption(String url,String value);

    /**
     * 无返回请求
     * @param url
     * @param requestParam
     * @param requestHeader
     * @param httpMethod
     */
    public void sendWithoutResponse(String url, Map<String, Object> requestParam, Map<String, String> requestHeader, HttpMethod httpMethod);

    <T> RemoteResultBean<T> sendReturnString(String url, Map<String, Object> requestParam,
        Map<String, String> requestHeader, HttpMethod httpMethod);
}
