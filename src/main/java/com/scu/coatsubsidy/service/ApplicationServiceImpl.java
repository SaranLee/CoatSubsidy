package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.common.ExcelUtil;
import com.scu.coatsubsidy.common.SessionUtils;
import com.scu.coatsubsidy.domain.Application;
import com.scu.coatsubsidy.domain.ApplicationExample;
import com.scu.coatsubsidy.domain.AuditHistory;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.domain.vo.AppliStatisticVO;
import com.scu.coatsubsidy.mapper.ApplicationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
        else if(roleId.equals(ROLE_COLLEGE)){
            return mapper.collegeWaitingForAudit(user.getSn());
        }else if(roleId.equals(ROLE_SCHOOL)){
            return mapper.schoolWaitingForAudit();
        }else
            return new ArrayList<>();
    }

    @Override
    public boolean audit(Long applicationId, String isAgreed, String auditComment) {
        AuditHistory auditHistory = new AuditHistory();
        Application application = new Application();
        application.setId(applicationId);
        application.setAuditComment(auditComment);
        Integer currNode = getCurrNodeCodeById(applicationId);
        Integer nextNode = roleFlowService.getNextNode(currNode);
        if (isAgreed.equals(AGREE)) {
            if (nextNode.equals(AUDIT_NODE_4))
                application.setStatus(AUDIT_STATUS_TG);
            else if (!nextNode.equals(AUDIT_NODE_0))
                application.setStatus(AUDIT_STATUS_DSH);
            application.setCurrentNodeCode(nextNode);
            auditHistory.setStatus(AUDIT_STATUS_TG);
        } else {
            application.setStatus(AUDIT_STATUS_BTG);
            auditHistory.setStatus(AUDIT_STATUS_BTG);
        }
        mapper.updateByPrimaryKeySelective(application);

        auditHistory.setApplicationId(applicationId);
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

    @Override
    public List<Application> list() {
        WhiteList user = SessionUtils.getLoginUser();
        Long roleId = user.getRoleId();
        if(roleId.equals(ROLE_INSTRUCTOR))
            return mapper.listByInstructor(user.getSn());
        else if(roleId.equals(ROLE_COLLEGE))
            return mapper.listByCollege(user.getSn());
        else if(roleId.equals(ROLE_SCHOOL))
            return mapper.listBySchool();
        else
            return new ArrayList<>();
    }

    @Override
    public AppliStatisticVO statistic() {
        WhiteList user = SessionUtils.getLoginUser();
        Long roleId = user.getRoleId();
        if(roleId.equals(ROLE_INSTRUCTOR))
            return mapper.statisticByInstructor(user.getSn());
        else if(roleId.equals(ROLE_COLLEGE))
            return mapper.statisticByCollege(user.getSn());
        else if(roleId.equals(ROLE_SCHOOL))
            return mapper.statisticBySchool();
        else
            return new AppliStatisticVO();
    }

    @Override
    public void export(HttpServletResponse response) {
        List<Application> list = list();
        String filename = "申请列表.xls";
        try {
            filename = java.net.URLEncoder.encode(filename,"utf-8");
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename=" + filename);
            ExcelUtil.exportApplication(response, list);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
