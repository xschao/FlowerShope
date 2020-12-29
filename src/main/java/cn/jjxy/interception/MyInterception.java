package cn.jjxy.interception;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterception implements HandlerInterceptor {
    /*进入方法前执行
    * 1、登录拦截
    * 2、权限校验
    * */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("MyInterception的preHandle方法执行了......");
        //true  ：对方法放行  如果设置false时，后面的方法无法执行。
        return true;
    }

    @Override
    /*
    * 方法执行之后，在返回ModelAndView方法执行前
    * 1、设置页面的共用参数
    *
    * */
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("MyInterception的postHandle方法执行了......");
    }

    @Override
    /*
    * 在ModelAndView方法后执行
    * 1、异常处理，清理资源，记录日志
    *   只要拦截器放行（true） afterCompletion一定会执行
    * */
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("MyInterception的afterCompletion方法执行了......");
    }
}
