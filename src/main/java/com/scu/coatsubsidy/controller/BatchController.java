package com.scu.coatsubsidy.controller;

import com.github.pagehelper.PageInfo;
import com.scu.coatsubsidy.common.JsonResult;
import com.scu.coatsubsidy.domain.Batch;
import com.scu.coatsubsidy.service.BatchService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/batch")
public class BatchController {

    @Autowired
    private BatchService service;

    @RequestMapping("/list")
    public String
    list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
         @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
         Model model) {
        PageInfo pageInfo = service.list(pageNo, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "batchList";
    }

    @RequestMapping(value = "/hasActiveOne")
    @ResponseBody
    public JsonResult hasActiveOne(){
        return JsonResult.ok(service.hasActiveOne());
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult save(Batch batch){
        if(batch.getId() != null)
            return JsonResult.ok(service.updateById(batch));
        else
            return JsonResult.ok(service.add(batch));
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult getBatchById(@PathVariable("id") Integer id){
        return JsonResult.ok(service.getBatchById(id));
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult getAll(){
        return JsonResult.ok(service.getAll());
    }

    @RequestMapping(value = "/currBatch", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult currBatch(){
        return JsonResult.ok(service.getCurrBatch());
    }
}
