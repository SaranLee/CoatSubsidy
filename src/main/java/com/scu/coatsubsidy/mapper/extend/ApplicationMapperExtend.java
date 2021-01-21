package com.scu.coatsubsidy.mapper.extend;

import com.scu.coatsubsidy.domain.Application;
import com.scu.coatsubsidy.domain.vo.AppliStatisticVO;

import java.util.List;

public interface ApplicationMapperExtend {
    List<Application> collegeWaitingForAudit(String userSn);
    List<Application> schoolWaitingForAudit();

    List<Application> listByInstructor(String sn);

    List<Application> listByCollege(String sn);

    List<Application> listBySchool();

    AppliStatisticVO statisticByInstructor(String sn);

    AppliStatisticVO statisticByCollege(String sn);

    AppliStatisticVO statisticBySchool();
}
