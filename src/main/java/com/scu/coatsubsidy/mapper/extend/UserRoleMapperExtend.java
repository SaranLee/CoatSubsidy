package com.scu.coatsubsidy.mapper.extend;

import com.scu.coatsubsidy.domain.UserRole;
import org.apache.ibatis.annotations.Param;

import java.util.Set;

public interface UserRoleMapperExtend {
    boolean insertBatch(@Param("userRoles") Set<UserRole> userRoles);
}
