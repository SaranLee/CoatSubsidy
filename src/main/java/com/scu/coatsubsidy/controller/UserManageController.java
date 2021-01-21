package com.scu.coatsubsidy.controller;

import com.scu.coatsubsidy.common.JsonResult;
import com.scu.coatsubsidy.service.UserManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("userManage")
public class UserManageController {

    @Autowired
    private UserManageService service;

    @RequestMapping(value = "/{sn}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult getBySn(@PathVariable("sn") String sn){
        return JsonResult.ok(service.getBySn(sn));
    }

}
