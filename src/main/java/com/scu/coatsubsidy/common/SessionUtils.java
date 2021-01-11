package com.scu.coatsubsidy.common;

import com.scu.coatsubsidy.domain.WhiteList;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtils {
    public static WhiteList getLoginUser(){
        return (WhiteList) getSession().getAttribute("loginUser");
    }

    public static HttpSession getSession(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession();
    }

    public static void setLoginUser(WhiteList loginUser){
        getSession().setAttribute("loginUser", loginUser);
    }
}
