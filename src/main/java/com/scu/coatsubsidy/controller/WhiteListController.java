package com.scu.coatsubsidy.controller;

import com.scu.coatsubsidy.common.Constant;
import com.scu.coatsubsidy.common.SessionUtils;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.service.KnrdService;
import com.scu.coatsubsidy.service.StudentService;
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
    @Autowired
    private StudentService studentService;
    @Autowired
    private KnrdService knrdService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(WhiteList user, Model model){
        //用户登录首先去白名单里找
        WhiteList currUser = service.login(user);
        //白名单里没有
        if(currUser == null){
            //先去Student表里找，是否存在
            if( studentService.getBySnAndName(user.getSn(), user.getName()) != null) {
                //找到了再去困难认定里找
                if( knrdService.checkInKnrd(user) ){
                    //Knrd里也找到了，将其添加到白名单
                    service.insert(user);
                    SessionUtils.setLoginUser(user);
                    return "main";
                }
            }
            model.addAttribute(Constant.LOGIN_RTN_MSG, "用户名或密码错误");
            return "login";
        }else {
            SessionUtils.setLoginUser(currUser);
            return "main";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout() {
        SessionUtils.removeLoginUser();
        return "login";
    }
}
