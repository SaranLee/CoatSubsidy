package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Sku;
import com.scu.coatsubsidy.domain.SkuExample;
import com.scu.coatsubsidy.mapper.SkuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.scu.coatsubsidy.common.Constant.NOT_DELETED;

@Service
public class SkuServiceImpl implements SkuService {

    @Autowired
    private SkuMapper mapper;

    @Override
    public boolean insertBatch(List<Sku> skus) {
        mapper.insertBatch(skus);
        return true;
    }

    @Override
    public List<Sku> getSkusByProductId(Long productId) {
        SkuExample example = new SkuExample();
        example.createCriteria().andProductIdEqualTo(productId).andDeletedEqualTo(NOT_DELETED);
        return mapper.selectByExample(example);
    }
}
