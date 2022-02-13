package interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if(url.indexOf("login") >= 0 || url.indexOf("/user/register") >=0){
            return true;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginUser");
        if(user != null)
            return true;
//        request.setAttribute("msg", "您还没有登录,请先登录!");
//        request.getRequestDispatcher("/login.jsp").forward(request, response);
        response.sendRedirect("/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
