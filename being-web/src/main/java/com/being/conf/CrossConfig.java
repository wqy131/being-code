package com.being.conf;

import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class CrossConfig extends WebMvcConfigurerAdapter{

//    @Override
//    public void addCorsMappings(CorsRegistry registry) {
//    	registry.addMapping("/**")
//    	.allowedOrigins("*")  
//    	.allowCredentials(true)  
//    	.allowedMethods("GET", "PUT", "POST", "GET", "OPTIONS")
////        .allowedOrigins("http://192.168.1.97")
////        .allowedMethods("GET", "POST")
//        .maxAge(3600);
//    }
    
    @Bean
    public FilterRegistrationBean jwtFilter() {
        final FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setFilter(new JwtFilter());
        registrationBean.addUrlPatterns("/app/secure/*");

        return registrationBean;
    }
	
}