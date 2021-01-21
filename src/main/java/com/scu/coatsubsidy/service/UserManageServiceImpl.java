package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.UserManage;
import com.scu.coatsubsidy.domain.UserManageExample;
import com.scu.coatsubsidy.domain.UserRole;
import com.scu.coatsubsidy.mapper.UserManageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserManageServiceImpl implements UserManageService {

    @Autowired
    private UserManageMapper mapper;

    @Override
    public List<String> getOrganizationSnByUserSn(String userSn) {
        UserManageExample example = new UserManageExample();
        example.createCriteria().andUserSnEqualTo(userSn);
        List<UserManage> list = mapper.selectByExample(example);
        return list.stream().map(UserManage::getOrganizationSn).collect(Collectors.toList());
    }

    @Override
    public UserManage getBySn(String sn) {
        UserManageExample example = new UserManageExample();
        example.createCriteria().andUserSnEqualTo(sn);
        List<UserManage> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.get(0);
        else
            return null;
    }

    @Override
    public Set<UserRole> getUserRolesBySn(String sn) {
        UserManageExample example = new UserManageExample();
        example.createCriteria().andUserSnEqualTo(sn);
        List<UserManage> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.stream().map( user -> {
                UserRole userRole = new UserRole();
                userRole.setRoleId(user.getRoleId());
                userRole.setUserSn(user.getUserSn());
                return userRole;
            }).collect(Collectors.toSet());
        else
            return new HashSet<>();
    }
}
