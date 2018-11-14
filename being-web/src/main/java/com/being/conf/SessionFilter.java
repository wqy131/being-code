package com.being.conf;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;

import com.being.constant.Constant;

/**
 * Created by mazhenhua on 2016/12/27.
 *
 * 过滤器
 */
public class SessionFilter implements Filter {
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SessionFilter.class);

    /**
     * 封装，不需要过滤的list列表
     */
    protected static List<Pattern> patterns = new ArrayList<Pattern>();
    private String prersonPassUrl = "app.*,static.*,template.*,ajax.*,public.*,^[a-z][a-z].register.*,^[a-z][a-z].login.*,^[a-z][a-z].submit,index.*,^[a-z][a-z].index.*,register.*,login.*,submit";
    private String[] prersonPassUrls;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    	System.out.println("==>DemoFilter启动");
		prersonPassUrls = prersonPassUrl.split(",");
		for (String url : prersonPassUrls) {
			Pattern p = Pattern.compile(url);
			patterns.add(p);
		}
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        String url = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        logger.info("url:"+url);
        System.out.println(url);
        if (url.startsWith("/") && url.length() > 1) {
            url = url.substring(1);
        }
        System.out.println(url);
        if (isInclude(url)){
            chain.doFilter(httpRequest, httpResponse);
            return;
        } else {
        	System.out.println("进入验证session程序");
            HttpSession session = httpRequest.getSession();
            if (session.getAttribute(Constant.SESSION_LOGIN_KEY) != null){
                // session存在
                chain.doFilter(httpRequest, httpResponse);
                return;
            } else {
//            	httpResponse.setHeader("Cache-Control", "no-store");
//            	httpResponse.setDateHeader("Expires", 0);
//            	httpResponse.setHeader("Prama", "no-cache");
//                //此处设置了访问静态资源类
//            	String path = httpRequest.getContextPath();
//                String basePath = httpRequest.getScheme()+"://"+httpRequest.getServerName()+":"+httpRequest.getServerPort()+path;
//            	httpResponse.sendRedirect(basePath+"/login");
            	// session不存在 准备跳转失败
                RequestDispatcher dispatcher = httpRequest.getRequestDispatcher("/en/index");
                  dispatcher.forward(httpRequest, httpResponse);
//                chain.doFilter(httpRequest, httpResponse);
                return;
            }
        }


    }

    @Override
    public void destroy() {

    }


    /**
     * 是否需要过滤
     * @param url
     * @return
     */
    private static boolean isInclude(String url) {
        for (Pattern pattern : patterns) {
            Matcher matcher = pattern.matcher(url);
            if (matcher.matches()) {
                return true;
            }
        }
        return false;
    }


}