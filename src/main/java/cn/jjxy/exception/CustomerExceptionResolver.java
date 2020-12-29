package cn.jjxy.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author  kevin
 * @desc    全局异常处理器
 **/
public class CustomerExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        System.out.println("全局异常处理开始！");
        /*这边处理的是系统执行的时候中断异常*/
        String result = "系统发生异常，请联系管理员";
        if(e instanceof MyException){
            result = ((MyException) e).getMsg();
        }
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg",result);
        mav.setViewName("msg");
        return mav;
    }

}
