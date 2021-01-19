package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.AuditHistory;

import java.util.List;

public interface AuditHistoryService {
    boolean insert(AuditHistory auditHistory);
    List<AuditHistory> getByApplicationId(Long applicationId);
}
