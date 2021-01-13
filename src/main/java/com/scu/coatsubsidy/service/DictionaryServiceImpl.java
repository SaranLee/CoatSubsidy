package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Dictionary;
import com.scu.coatsubsidy.domain.DictionaryExample;
import com.scu.coatsubsidy.mapper.DictionaryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    private DictionaryMapper mapper;

    @Override
    public String getNameByTypeAndValue(String type, String value) {
        DictionaryExample example = new DictionaryExample();
        example.createCriteria().andTypeEqualTo(type).andItemValueEqualTo(value);
        List<Dictionary> dictionaries = mapper.selectByExample(example);
        if(dictionaries.size() == 0)
            return "";
        else
            return dictionaries.get(0).getItemName();
    }

    @Override
    public List<Dictionary> listByType(String type) {
        DictionaryExample example = new DictionaryExample();
        example.createCriteria().andTypeEqualTo(type).andItemValueIsNotNull();
        return mapper.selectByExample(example);
    }
}
