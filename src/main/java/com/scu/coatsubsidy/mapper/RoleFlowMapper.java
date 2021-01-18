package com.scu.coatsubsidy.mapper;

import com.scu.coatsubsidy.domain.RoleFlow;
import com.scu.coatsubsidy.domain.RoleFlowExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleFlowMapper {
    long countByExample(RoleFlowExample example);

    int deleteByExample(RoleFlowExample example);

    int deleteByPrimaryKey(Long id);

    int insert(RoleFlow record);

    int insertSelective(RoleFlow record);

    List<RoleFlow> selectByExample(RoleFlowExample example);

    RoleFlow selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") RoleFlow record, @Param("example") RoleFlowExample example);

    int updateByExample(@Param("record") RoleFlow record, @Param("example") RoleFlowExample example);

    int updateByPrimaryKeySelective(RoleFlow record);

    int updateByPrimaryKey(RoleFlow record);
}