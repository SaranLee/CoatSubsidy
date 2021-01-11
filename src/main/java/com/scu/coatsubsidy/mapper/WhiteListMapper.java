package com.scu.coatsubsidy.mapper;

import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.domain.WhiteListExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WhiteListMapper {
    long countByExample(WhiteListExample example);

    int deleteByExample(WhiteListExample example);

    int deleteByPrimaryKey(Long id);

    int insert(WhiteList record);

    int insertSelective(WhiteList record);

    List<WhiteList> selectByExample(WhiteListExample example);

    WhiteList selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") WhiteList record, @Param("example") WhiteListExample example);

    int updateByExample(@Param("record") WhiteList record, @Param("example") WhiteListExample example);

    int updateByPrimaryKeySelective(WhiteList record);

    int updateByPrimaryKey(WhiteList record);
}