package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Dictionary;

import java.util.List;

public interface DictionaryService {
    String getNameByTypeAndValue(String type, String value);
    List<Dictionary> listByType(String type);
}
