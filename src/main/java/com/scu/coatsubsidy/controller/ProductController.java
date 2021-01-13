package com.scu.coatsubsidy.controller;

import com.scu.coatsubsidy.common.JsonResult;
import com.scu.coatsubsidy.domain.Product;
import com.scu.coatsubsidy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService service;

    @RequestMapping("/toPage")
    public String toPage(){
        return "productAdd";
    }

    @RequestMapping(value = "/", method = RequestMethod.PUT)
    @ResponseBody
    public JsonResult add(Product product){
        return JsonResult.ok(service.add(product));
    }


}
