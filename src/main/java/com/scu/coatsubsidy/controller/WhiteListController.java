package com.scu.coatsubsidy.controller;

import com.scu.coatsubsidy.common.Constant;
import com.scu.coatsubsidy.common.SessionUtils;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.service.WhiteListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/whiteList", method = RequestMethod.POST)
public class WhiteListController {

    @Autowired
    private WhiteListService service;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(WhiteList user, Model model){
        WhiteList currUser = service.login(user);
        if(currUser == null){
            model.addAttribute(Constant.LOGIN_RTN_MSG, "用户名或密码错误");
            return "login";
        }
        SessionUtils.setLoginUser(currUser);
        return "main";
    }
}
