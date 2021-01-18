package com.scu.coatsubsidy.controller;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.scu.coatsubsidy.common.Constant;
import com.scu.coatsubsidy.common.JsonResult;
import com.scu.coatsubsidy.common.SessionUtils;
import com.scu.coatsubsidy.domain.Application;
import com.scu.coatsubsidy.domain.Student;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.service.ApplicationService;
import com.scu.coatsubsidy.service.BatchService;
import com.scu.coatsubsidy.service.KnrdService;
import com.scu.coatsubsidy.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import static com.scu.coatsubsidy.common.Constant.AUDIT_STATUS_DSH;
import static com.scu.coatsubsidy.common.Constant.ROLE_INSTRUCTOR;

@Controller
@RequestMapping("/application")
public class ApplicationController {

    @Autowired
    private ApplicationService service;
    @Autowired
    private StudentService studentService;
    @Autowired
    private BatchService batchService;
    @Autowired
    private KnrdService knrdService;

    @RequestMapping("/toPage")
    public String toPage(){
        return "application";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult insert(String applicationReason){
        WhiteList user = SessionUtils.getLoginUser();
        Student student = studentService.getBySn(user.getSn());
        Application application = new Application();
        application.setBatchId(batchService.getCurrBatch().getId());
        application.setSn(student.getSn());
        application.setName(student.getName());
        application.setGender(student.getGender());
        application.setApplyDate(new Date());
        application.setCollegeSn(student.getCollegeCode());
        application.setCollegeName(student.getCollege());
        application.setMajorSn(student.getMajorCode());
        application.setMajorName(student.getMajor());
        application.setClassSn(student.getClassCode());
        application.setClassName(student.getClazz());
        application.setDifficultyLevel(knrdService.getDiffLevelByStudentId(student.getSn()));
        application.setApplicationReason(applicationReason);
        application.setCurrentNodeCode(1);
        application.setStatus(AUDIT_STATUS_DSH);
        service.insert(application);
        return JsonResult.ok(true);
    }

    @RequestMapping(value = "/waitingForAudit", method = RequestMethod.GET)
    public String waitingForAudit(Model model){
        List<Application> list = service.waitingForAudit();
        model.addAttribute("list", list);
        return "auditApplication";
    }

    @RequestMapping(value = "/audit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult audit(Long id, String isAgreed, String auditComment){
        return JsonResult.ok(service.auditById(id, isAgreed, auditComment));
    }
}