package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.UserManage;
import com.scu.coatsubsidy.domain.UserManageExample;
import com.scu.coatsubsidy.mapper.UserManageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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
}
