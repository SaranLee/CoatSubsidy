package com.scu.coatsubsidy.mapper.extend;

import com.scu.coatsubsidy.domain.Application;

import java.util.List;

public interface ApplicationMapperExtend {
    List<Application> collegeWaitingForAudit(String userSn);
    List<Application> schoolWaitingForAudit();

    List<Application> listByInstructor(String sn);

    List<Application> listByCollege(String sn);

    List<Application> listBySchool();
}
