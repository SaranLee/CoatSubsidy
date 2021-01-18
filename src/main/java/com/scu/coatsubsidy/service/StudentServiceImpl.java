package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Student;
import com.scu.coatsubsidy.domain.StudentExample;
import com.scu.coatsubsidy.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper mapper;

    @Override
    public Student getBySnAndName(String sn, String name) {
        StudentExample example = new StudentExample();
        example.createCriteria().andSnEqualTo(sn).andNameEqualTo(name);
        List<Student> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.get(0);
        else
            return null;
    }

    @Override
    public Student getBySn(String sn) {
        StudentExample example = new StudentExample();
        example.createCriteria().andSnEqualTo(sn);
        List<Student> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.get(0);
        else
            return null;
    }
}
