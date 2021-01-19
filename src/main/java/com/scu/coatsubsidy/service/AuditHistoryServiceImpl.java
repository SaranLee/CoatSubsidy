package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.AuditHistory;
import com.scu.coatsubsidy.domain.AuditHistoryExample;
import com.scu.coatsubsidy.mapper.AuditHistoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuditHistoryServiceImpl implements AuditHistoryService {

    @Autowired
    private AuditHistoryMapper mapper;

    @Override
    public boolean insert(AuditHistory auditHistory) {
        mapper.insertSelective(auditHistory);
        return true;
    }

    @Override
    public List<AuditHistory> getByApplicationId(Long applicationId) {
        AuditHistoryExample example = new AuditHistoryExample();
        example.createCriteria().andApplicationIdEqualTo(applicationId);
        return mapper.selectByExample(example);
    }
}
