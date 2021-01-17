package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Product;
import com.scu.coatsubsidy.domain.vo.ProductVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {
    boolean add(Product product, MultipartFile[] files, String imgPathPrefix);
    List<ProductVO> getAll();

    ProductVO getById(Integer id);
}
