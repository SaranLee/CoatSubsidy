package com.scu.coatsubsidy.mapper;

import com.scu.coatsubsidy.domain.UserRole;
import com.scu.coatsubsidy.domain.UserRoleExample;
import java.util.List;

import com.scu.coatsubsidy.mapper.extend.UserRoleMapperExtend;
import org.apache.ibatis.annotations.Param;

public interface UserRoleMapper extends UserRoleMapperExtend {
    long countByExample(UserRoleExample example);

    int deleteByExample(UserRoleExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    List<UserRole> selectByExample(UserRoleExample example);

    UserRole selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UserRole record, @Param("example") UserRoleExample example);

    int updateByExample(@Param("record") UserRole record, @Param("example") UserRoleExample example);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}