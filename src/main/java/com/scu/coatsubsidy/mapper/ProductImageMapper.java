package com.scu.coatsubsidy.mapper;

import com.scu.coatsubsidy.domain.ProductImage;
import com.scu.coatsubsidy.domain.ProductImageExample;
import java.util.List;

import com.scu.coatsubsidy.mapper.extend.ProductImageMapperExtend;
import org.apache.ibatis.annotations.Param;

public interface ProductImageMapper extends ProductImageMapperExtend {
    long countByExample(ProductImageExample example);

    int deleteByExample(ProductImageExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ProductImage record);

    int insertSelective(ProductImage record);

    List<ProductImage> selectByExample(ProductImageExample example);

    ProductImage selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ProductImage record, @Param("example") ProductImageExample example);

    int updateByExample(@Param("record") ProductImage record, @Param("example") ProductImageExample example);

    int updateByPrimaryKeySelective(ProductImage record);

    int updateByPrimaryKey(ProductImage record);
}