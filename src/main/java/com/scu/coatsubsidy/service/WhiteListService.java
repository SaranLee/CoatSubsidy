package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.UserRole;
import com.scu.coatsubsidy.domain.WhiteList;

import java.util.List;
import java.util.Set;

public interface WhiteListService {
    WhiteList login(WhiteList user);

    void insert(WhiteList user);
    boolean insert(String sn, String name);

    List<WhiteList> list();

    void switchRole(Integer roleId);
}
