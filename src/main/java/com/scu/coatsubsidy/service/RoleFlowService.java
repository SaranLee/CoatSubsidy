package com.scu.coatsubsidy.service;

public interface RoleFlowService {
    Integer getNextNode(Integer currNode);
    String getNodeNameByNodeCode(Integer nodeCode);
}
