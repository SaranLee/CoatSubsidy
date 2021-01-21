package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Application;
import com.scu.coatsubsidy.domain.vo.AppliStatisticVO;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface ApplicationService {
    boolean insert(Application application);
    List<Application> waitingForAudit();
    boolean audit(Long applicationId, String isAgreed, String auditComment);
    Integer getCurrNodeCodeById(Long id);

    List<Application> list();

    AppliStatisticVO statistic();

    void export(HttpServletResponse response);
}
