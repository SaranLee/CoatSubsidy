package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.domain.WhiteListExample;
import com.scu.coatsubsidy.mapper.WhiteListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WhiteListServiceImpl implements WhiteListService {
    @Autowired
    private WhiteListMapper mapper;
    @Override
    public WhiteList login(WhiteList user) {
        WhiteList currUser = null;
        WhiteListExample example = new WhiteListExample();
        example.createCriteria().andNameEqualTo(user.getName()).andSnEqualTo(user.getSn());
        List<WhiteList> users = mapper.selectByExample(example);
        if(users.size() != 0)
            currUser = users.get(0);
        return currUser;
    }

    @Override
    public void insert(WhiteList user) {
        mapper.insertSelective(user);
    }
}
