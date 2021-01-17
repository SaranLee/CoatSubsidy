package com.scu.coatsubsidy.controller;

import com.scu.coatsubsidy.common.JsonResult;
import com.scu.coatsubsidy.domain.Product;
import com.scu.coatsubsidy.domain.dto.ProductDTO;
import com.scu.coatsubsidy.domain.vo.ProductVO;
import com.scu.coatsubsidy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService service;

    @RequestMapping("/toAdd")
    public String toPage(){
        return "productAdd";
    }
    @RequestMapping("/toList")
    public String toList(){
        return "productList";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult add(ProductDTO product, MultipartFile[] imgs, HttpServletRequest req){
        String imgPathPrefix = req.getServletContext().getRealPath("static/img");
        service.add(product, imgs, imgPathPrefix);
        return JsonResult.ok(true);
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getAll(Model model){
        List<ProductVO> list = service.getAll();
        model.addAttribute("list", list);
        return "productList";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult getById(@PathVariable("id") Integer id){
        return JsonResult.ok(service.getById(id));
    }

}
