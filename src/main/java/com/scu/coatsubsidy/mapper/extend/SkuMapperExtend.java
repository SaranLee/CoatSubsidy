package com.scu.coatsubsidy.mapper.extend;

import com.scu.coatsubsidy.domain.Sku;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SkuMapperExtend {
    boolean insertBatch(@Param("skus") List<Sku> skus);
}
