package cn.jiangong.intercept;

import cn.jiangong.entity.BackUser;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginIntercept extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        BackUser user = (BackUser) request.getSession().getAttribute("user");
        if(user == null){
            response.sendRedirect("login");
        }
        return super.preHandle(request, response, handler);
    }
}
