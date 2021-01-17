package com.scu.coatsubsidy.mapper.extend;

import com.scu.coatsubsidy.domain.ProductImage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductImageMapperExtend {
    boolean insertBatch(@Param("imgs") List<ProductImage> imgs);
}
