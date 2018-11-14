package com.being.dto;

import java.io.Serializable;

public class RemoteResultBean<T> implements Serializable {
    private static final long serialVersionUID = -1724546458368592165L;
    private String code = "200";// 返回代码
    private String message;// 错误信息描述
    private T data;// 返回对象
    private Integer pageCount;// 分页总页数
    private Integer dataCount;// 数据总条数


    public String getCode() {
      return code;
    }

    public void setCode(String code) {
      this.code = code;
    }

    public String getMessage() {
      return message;
    }

    public void setMessage(String message) {
      this.message = message;
    }

    public T getData() {
      return data;
    }

    public void setData(T data) {
      this.data = data;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getDataCount() {
        return dataCount;
    }

    public void setDataCount(Integer dataCount) {
        this.dataCount = dataCount;
    }

    public Boolean isSuccess() {
        return this.getCode().equals("200");
    }

}
