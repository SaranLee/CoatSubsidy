package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Product;
import com.scu.coatsubsidy.domain.ProductExample;
import com.scu.coatsubsidy.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper mapper;

    @Override
    public boolean add(Product product) {
        mapper.insertSelective(product);
        return true;
    }
}
