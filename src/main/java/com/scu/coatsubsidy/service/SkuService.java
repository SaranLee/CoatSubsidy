package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Sku;

import java.util.List;

public interface SkuService {
    boolean insertBatch(List<Sku> skus);

    List<Sku> getSkusByProductId(Long productId);

    void deleteById(Long id);
}
