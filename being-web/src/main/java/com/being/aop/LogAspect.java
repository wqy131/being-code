//package com.being.aop;
//
//import java.util.Arrays;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Pointcut;
//import org.springframework.stereotype.Component;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//
//import com.being.constant.ResultBean;
//
///**
// * 
// * @author zhangwei
// *
// */
//@Aspect
//@Component
//public class LogAspect {
//  private static Log logger = LogFactory.getLog(LogAspect.class);
//
//
//  @Pointcut("execution(public * com.being.controller.*.*(..))")
//  public void webLog() {}
//
//
//  
//  /*
//   * @AfterReturning(returning = "ret", pointcut = "webLog()") public void doAfterReturning(Object
//   * ret) throws Throwable { // 处理完请求，返回内容 System.out.println("方法的返回值 : " + ret); }
//   * 
//   * //后置异常通知
//   * 
//   * @AfterThrowing("webLog()") public void throwss(JoinPoint jp){
//   * System.out.println("方法异常时执行....."); }
//   * 
//   * //后置最终通知,final增强，不管是抛出异常或者正常退出都会执行
//   * 
//   * @After("webLog()") public void after(JoinPoint jp){ System.out.println("方法最后执行....."); }
//   */
//  // 环绕通知,环绕增强，相当于MethodInterceptor
//  @Around("webLog()")
//  public Object arround(ProceedingJoinPoint pjp) throws Throwable {
//    // 接收到请求，记录请求内容
//    StringBuffer logBuffer = new StringBuffer();
//    ServletRequestAttributes attributes =
//        (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//    HttpServletRequest request = attributes.getRequest();
//    // 记录下请求内容
//
//    logBuffer.append("[");
//    logBuffer.append("URL=" + request.getRequestURI().toString());
//    logBuffer.append(";");
//    logBuffer.append(" HTTP_METHOD=" + request.getMethod());
//    logBuffer.append(";");
//    logBuffer.append(" IP=" + request.getRemoteAddr());
//    logBuffer.append(";");
//    logBuffer.append(" CLASS_METHOD=" + pjp.getSignature().getDeclaringTypeName() + "."
//        + pjp.getSignature().getName());
//    logBuffer.append(";");
//    logBuffer.append(" ARGS=" + Arrays.toString(pjp.getArgs()));
//
//    // logger.info(logBuffer);
//    Long startDate = System.currentTimeMillis();
//    // 执行方法
//    Object o = null;
//    try {
//    	o =  pjp.proceed();
//    	if (o instanceof ResultBean){
//            o = (ResultBean) o;
//          }else {
//        	  Long endDate = System.currentTimeMillis();
//        	    logBuffer.append(";");
//        	    logBuffer.append(" TIME=" + (endDate - startDate));
//        	    logBuffer.append("]");
//        	    logger.info(logBuffer.toString());
//            return o;
//          }
//    } catch(NumberFormatException | NullPointerException ex) {
//      o=new ResultBean(null,"9999","参数错误");
//      logger.error("参数错误",ex);
//    }  catch (Throwable t) {
//      o=new ResultBean(null,"9999","系统运行时异常"+t);
//      
//      logger.error("系统运行时异常",t);
//    }
//    Long endDate = System.currentTimeMillis();
//    logBuffer.append(";");
//    logBuffer.append(" TIME=" + (endDate - startDate));
//    logBuffer.append("]");
//    logger.info(logBuffer.toString());
//    return o;
//
//  }
//}
