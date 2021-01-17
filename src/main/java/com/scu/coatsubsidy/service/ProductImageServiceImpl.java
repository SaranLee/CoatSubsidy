package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.ProductImage;
import com.scu.coatsubsidy.domain.ProductImageExample;
import com.scu.coatsubsidy.mapper.ProductImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.scu.coatsubsidy.common.Constant.NOT_DELETED;

@Service
public class ProductImageServiceImpl implements ProductImageService {

    @Autowired
    private ProductImageMapper mapper;

    @Override
    public boolean insertBatch(List<ProductImage> imgs) {
        mapper.insertBatch(imgs);
        return true;
    }

    @Override
    public List<ProductImage> getImgsByProductId(Long productId) {
        ProductImageExample example = new ProductImageExample();
        example.createCriteria().andProductIdEqualTo(productId).andDeletedEqualTo(NOT_DELETED);
        return mapper.selectByExample(example);
    }
}
