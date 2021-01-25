package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.common.SessionUtils;
import com.scu.coatsubsidy.domain.UserRole;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.domain.WhiteListExample;
import com.scu.coatsubsidy.mapper.WhiteListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class WhiteListServiceImpl implements WhiteListService {
    @Autowired
    private WhiteListMapper mapper;
    @Autowired
    private UserRoleService userRoleService;

    @Override
    public WhiteList login(WhiteList user) {
        WhiteList currUser = null;
        WhiteListExample example = new WhiteListExample();
        example.createCriteria().andNameEqualTo(user.getName()).andSnEqualTo(user.getSn());
        List<WhiteList> users = mapper.selectByExample(example);
        if(users.size() != 0) {
            currUser = users.get(0);
            Set<UserRole> userRoles = userRoleService.getUserRolesBySn(users.get(0).getSn());
            List<UserRole> list = new ArrayList<>(userRoles);
            if(list.size() > 0)
                currUser.setRoleId(list.get(0).getRoleId());
        }
        return currUser;
    }

    @Override
    public void insert(WhiteList user) {
        mapper.insertSelective(user);
    }

    @Override
    public boolean insert(String sn, String name) {
        WhiteList user = new WhiteList();
        user.setSn(sn);
        user.setName(name);
        mapper.insertSelective(user);
        return true;
    }

    @Override
    public List<WhiteList> list() {
        return mapper.selectByExample(null);
    }

    @Override
    public void switchRole(Integer roleId) {
        SessionUtils.getLoginUser().setRoleId(roleId.longValue());
    }
}
