package cn.jiangong.intercept;

import cn.jiangong.entity.BackUser;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginIntercept extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        System.out.println(url);
        boolean flag = true;
        if(url.contains("js")
                || url.contains("css")
                || url.contains("layui")
                || url.contains("images")
                || url.contains("login")){
            flag = false;
        }


        BackUser user = (BackUser) request.getSession().getAttribute("user");
        if(user == null && flag){
            System.out.println("tiao");
            response.sendRedirect("/loginPage");
        }
        return super.preHandle(request, response, handler);
    }
}
