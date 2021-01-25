package com.scu.coatsubsidy.controller;

import com.scu.coatsubsidy.common.JsonResult;
import com.scu.coatsubsidy.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/userRole")
public class UserRoleController {

    @Autowired
    private UserRoleService service;

    @RequestMapping(value = "/{sn}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult userRoles(@PathVariable("sn") String sn){
        return JsonResult.ok(service.getUserRolesBySn(sn));
    }

}
