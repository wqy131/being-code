package com.being.conf;
import javax.servlet.Filter;

import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by zongruibiao on 2017/3/14.
 */
@Configuration
public class FilterConfiguration {
	
	
    /**
     * 配置过滤器
     * @return
     */
    @Bean
    public FilterRegistrationBean someFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        //注入过滤器
        registration.setFilter(sessionFilter());
      //拦截规则
        registration.addUrlPatterns("/*");
//     	//是否自动注册 false 取消Filter的自动注册
//        registration.setEnabled(false);
//        //过滤应用程序中所有资源,当前应用程序根下的所有文件包括多级子目录下的所有文件，注意这里*前有“/”
//        registration.addUrlPatterns("/*");
//        //过滤指定的类型文件资源, 当前应用程序根目录下的所有html文件，注意：*.html前没有“/”,否则错误
//        registration.addUrlPatterns(".ftl");
//        registration.addUrlPatterns(".html");
//        //过滤指定的目录下的所有文件,当前应用程序根目录下的folder_name子目录（可以是多级子目录）下所有文件
//        registration.addUrlPatterns("/static/*");
        //过滤指定文件
//        registration.addUrlPatterns("login");
        registration.addInitParameter("paramName", "paramValue");
        //过滤器名称
        registration.setName("sessionFilter");
//        registration.setOrder(Integer.MAX_VALUE);//多个过滤器执行先后顺序的控制
        return registration;
    }

    /**
     * 创建一个bean
     * @return
     */
    @Bean(name = "sessionFilter")
    public Filter sessionFilter() {
        return new SessionFilter();
    }
}