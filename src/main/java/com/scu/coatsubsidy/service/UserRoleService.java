package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.UserRole;

import java.util.Set;

public interface UserRoleService {

    boolean insertBatch(Set<UserRole> userRoles);

    Set<UserRole> getUserRolesBySn(String sn);
}
