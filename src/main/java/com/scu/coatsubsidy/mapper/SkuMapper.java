package com.scu.coatsubsidy.mapper;

import com.scu.coatsubsidy.domain.Sku;
import com.scu.coatsubsidy.domain.SkuExample;
import java.util.List;

import com.scu.coatsubsidy.mapper.extend.SkuMapperExtend;
import org.apache.ibatis.annotations.Param;

public interface SkuMapper extends SkuMapperExtend {
    long countByExample(SkuExample example);

    int deleteByExample(SkuExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Sku record);

    int insertSelective(Sku record);

    List<Sku> selectByExample(SkuExample example);

    Sku selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Sku record, @Param("example") SkuExample example);

    int updateByExample(@Param("record") Sku record, @Param("example") SkuExample example);

    int updateByPrimaryKeySelective(Sku record);

    int updateByPrimaryKey(Sku record);
}