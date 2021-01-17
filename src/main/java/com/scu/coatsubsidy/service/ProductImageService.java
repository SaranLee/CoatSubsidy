package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.ProductImage;

import java.util.List;

public interface ProductImageService {
    boolean insertBatch(List<ProductImage> imgs);

    List<ProductImage> getImgsByProductId(Long productId);
}
