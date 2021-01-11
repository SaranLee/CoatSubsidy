package com.scu.coatsubsidy.mapper;

import com.scu.coatsubsidy.domain.UserManage;
import com.scu.coatsubsidy.domain.UserManageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserManageMapper {
    long countByExample(UserManageExample example);

    int deleteByExample(UserManageExample example);

    int insert(UserManage record);

    int insertSelective(UserManage record);

    List<UserManage> selectByExample(UserManageExample example);

    int updateByExampleSelective(@Param("record") UserManage record, @Param("example") UserManageExample example);

    int updateByExample(@Param("record") UserManage record, @Param("example") UserManageExample example);
}