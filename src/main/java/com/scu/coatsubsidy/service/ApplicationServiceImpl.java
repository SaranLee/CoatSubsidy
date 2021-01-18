package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.common.SessionUtils;
import com.scu.coatsubsidy.domain.Application;
import com.scu.coatsubsidy.domain.ApplicationExample;
import com.scu.coatsubsidy.domain.AuditHistory;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.mapper.ApplicationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.scu.coatsubsidy.common.Constant.*;

@Service
public class ApplicationServiceImpl implements ApplicationService {

    @Autowired
    private ApplicationMapper mapper;
    @Autowired
    private UserManageService userManageService;
    @Autowired
    private RoleFlowService roleFlowService;
    @Autowired
    private AuditHistoryService auditHistoryService;

    @Override
    public boolean insert(Application application) {
        mapper.insertSelective(application);
        return true;
    }

    @Override
    public List<Application> waitingForAudit() {
        WhiteList user = SessionUtils.getLoginUser();
        Long roleId = user.getRoleId();

        ApplicationExample example = new ApplicationExample();

        if(roleId.equals(ROLE_INSTRUCTOR)){
            List<String> classSns = userManageService.getOrganizationSnByUserSn(user.getSn());
            example.createCriteria().andClassSnIn(classSns)
                    .andCurrentNodeCodeEqualTo(AUDIT_NODE_1)
                    .andStatusEqualTo(AUDIT_STATUS_DSH);
            return mapper.selectByExample(example);
        }
        else
            return new ArrayList<>();
    }

    @Override
    public boolean auditById(Long id, String isAgreed, String auditComment) {
        AuditHistory auditHistory = new AuditHistory();
        Application application = new Application();
        application.setId(id);
        application.setAuditComment(auditComment);
        Integer currNode = getCurrNodeCodeById(id);
        Integer nextNode = roleFlowService.getNextNode(currNode);
        if (isAgreed.equals(AGREE)) {
            if (nextNode.equals(AUDIT_NODE_3)) {
                application.setStatus(AUDIT_STATUS_TG);
                auditHistory.setStatus(AUDIT_STATUS_TG);
            } else if (!nextNode.equals(AUDIT_NODE_0)) {
                application.setStatus(AUDIT_STATUS_DSH);
                auditHistory.setStatus(AUDIT_STATUS_DSH);
            }
            application.setCurrentNodeCode(nextNode);
        } else {
            application.setStatus(AUDIT_STATUS_BTG);
            auditHistory.setStatus(AUDIT_STATUS_BTG);
        }
        mapper.updateByPrimaryKeySelective(application);

        auditHistory.setApplicationId(id);
        auditHistory.setAuditBy(SessionUtils.getLoginUser().getSn());
        auditHistory.setAuditorName(SessionUtils.getLoginUser().getName());
        auditHistory.setAuditComment(auditComment);
        auditHistory.setAuditNodeCode(currNode);
        auditHistory.setAuditNodeName(roleFlowService.getNodeNameByNodeCode(currNode));

        return auditHistoryService.insert(auditHistory);
    }

    @Override
    public Integer getCurrNodeCodeById(Long id) {
        ApplicationExample example = new ApplicationExample();
        example.createCriteria().andIdEqualTo(id);
        List<Application> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.get(0).getCurrentNodeCode();
        else
            return AUDIT_NODE_0;
    }
}
