package com.scu.coatsubsidy.mapper;

import com.scu.coatsubsidy.domain.Knrd;
import com.scu.coatsubsidy.domain.KnrdExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KnrdMapper {
    long countByExample(KnrdExample example);

    int deleteByExample(KnrdExample example);

    int insert(Knrd record);

    int insertSelective(Knrd record);

    List<Knrd> selectByExample(KnrdExample example);

    int updateByExampleSelective(@Param("record") Knrd record, @Param("example") KnrdExample example);

    int updateByExample(@Param("record") Knrd record, @Param("example") KnrdExample example);
}