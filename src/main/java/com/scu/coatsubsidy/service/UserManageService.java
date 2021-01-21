package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.UserManage;
import com.scu.coatsubsidy.domain.UserRole;

import java.util.List;
import java.util.Set;

public interface UserManageService {
    List<String> getOrganizationSnByUserSn(String userSn);

    UserManage getBySn(String sn);

    Set<UserRole> getUserRolesBySn(String sn);
}
