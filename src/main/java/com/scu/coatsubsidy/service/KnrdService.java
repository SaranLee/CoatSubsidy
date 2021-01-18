package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Knrd;
import com.scu.coatsubsidy.domain.WhiteList;

public interface KnrdService {
    boolean checkInKnrd(WhiteList user);
    String getDiffLevelByStudentId(String studentId);
}
