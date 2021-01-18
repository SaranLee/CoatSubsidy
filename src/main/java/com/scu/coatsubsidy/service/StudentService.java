package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Student;

public interface StudentService {
    Student getBySnAndName(String sn, String name);
    Student getBySn(String sn);
}
