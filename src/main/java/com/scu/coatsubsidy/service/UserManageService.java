package com.scu.coatsubsidy.service;

import java.util.List;

public interface UserManageService {
    List<String> getOrganizationSnByUserSn(String userSn);
}
