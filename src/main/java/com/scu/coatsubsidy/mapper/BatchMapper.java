package com.scu.coatsubsidy.mapper;

import com.scu.coatsubsidy.domain.Batch;
import com.scu.coatsubsidy.domain.BatchExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BatchMapper {
    long countByExample(BatchExample example);

    int deleteByExample(BatchExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Batch record);

    int insertSelective(Batch record);

    List<Batch> selectByExample(BatchExample example);

    Batch selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Batch record, @Param("example") BatchExample example);

    int updateByExample(@Param("record") Batch record, @Param("example") BatchExample example);

    int updateByPrimaryKeySelective(Batch record);

    int updateByPrimaryKey(Batch record);
}