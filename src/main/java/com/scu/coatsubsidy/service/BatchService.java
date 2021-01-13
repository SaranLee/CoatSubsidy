package com.scu.coatsubsidy.service;

import com.github.pagehelper.PageInfo;
import com.scu.coatsubsidy.domain.Batch;

import java.util.List;

public interface BatchService {
    PageInfo list(Integer pageNo, Integer pageSize);
    Boolean hasActiveOne();
    boolean add(Batch batch);
    boolean updateById(Batch batch);
    Batch getBatchById(Integer id);
    List<Batch> getAll();
    Batch getCurrBatch();
}
