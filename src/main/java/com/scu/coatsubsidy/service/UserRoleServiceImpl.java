package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.UserRole;
import com.scu.coatsubsidy.mapper.UserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleMapper mapper;

    @Override
    public boolean insertBatch(Set<UserRole> userRoles) {
        mapper.insertBatch(userRoles);
        return true;
    }
}
