package com.scu.coatsubsidy.controller;

import com.scu.coatsubsidy.common.Constant;
import com.scu.coatsubsidy.common.JsonResult;
import com.scu.coatsubsidy.common.SessionUtils;
import com.scu.coatsubsidy.domain.Role;
import com.scu.coatsubsidy.domain.UserManage;
import com.scu.coatsubsidy.domain.UserRole;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Set;

@Controller
@RequestMapping(value = "/whiteList", method = RequestMethod.POST)
public class WhiteListController {

    @Autowired
    private WhiteListService service;
    @Autowired
    private StudentService studentService;
    @Autowired
    private KnrdService knrdService;
    @Autowired
    private UserManageService userManageService;
    @Autowired
    private UserRoleService userRoleService;

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

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model){
        model.addAttribute("list", service.list());
        return "userList";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult insert(String sn, String name){
        Set<UserRole> userRoles = userManageService.getUserRolesBySn(sn);
        return JsonResult.ok(service.insert(sn, name) && userRoleService.insertBatch(userRoles));
    }
}
