package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Knrd;
import com.scu.coatsubsidy.domain.KnrdExample;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.mapper.KnrdMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.scu.coatsubsidy.common.Constant.ROLE_STUDENT;

@Service
public class KnrdServiceImpl implements KnrdService {

    @Autowired
    private KnrdMapper mapper;


    @Override
    public boolean checkInKnrd(WhiteList user) {
        KnrdExample example = new KnrdExample();
        example.createCriteria().andNameEqualTo(user.getName()).andStudentIdEqualTo(user.getSn());
        List<Knrd> list = mapper.selectByExample(example);
        if(list.size() > 0){
            user.setRoleId(ROLE_STUDENT);
            return true;
        }
        return false;
    }

    @Override
    public String getDiffLevelByStudentId(String studentId) {
        KnrdExample example = new KnrdExample();
        example.createCriteria().andStudentIdEqualTo(studentId);
        List<Knrd> list = mapper.selectByExample(example);
        if(list.size() > 0){
            return list.get(0).getPovertyLevel();
        }else
            return null;
    }


}
