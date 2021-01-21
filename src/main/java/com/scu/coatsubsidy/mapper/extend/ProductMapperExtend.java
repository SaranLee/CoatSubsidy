package com.scu.coatsubsidy.mapper.extend;

import com.scu.coatsubsidy.domain.vo.ProductVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapperExtend {
    List<ProductVO> getAllByStudent(@Param("sn") String sn, @Param("batchId") Long batchId);
}
