package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.RoleFlow;
import com.scu.coatsubsidy.domain.RoleFlowExample;
import com.scu.coatsubsidy.mapper.RoleFlowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.scu.coatsubsidy.common.Constant.AUDIT_NODE_0;

@Service
public class RoleFlowServiceImpl implements RoleFlowService {

    @Autowired
    private RoleFlowMapper mapper;

    @Override
    public Integer getNextNode(Integer currNode) {
        RoleFlowExample example = new RoleFlowExample();
        example.createCriteria().andNodeCodeEqualTo(currNode);
        List<RoleFlow> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.get(0).getNextNode();
        else
            return AUDIT_NODE_0;
    }

    @Override
    public String getNodeNameByNodeCode(Integer nodeCode) {
        RoleFlowExample example = new RoleFlowExample();
        example.createCriteria().andNodeCodeEqualTo(nodeCode);
        List<RoleFlow> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.get(0).getNodeName();
        else
            return null;
    }
}
