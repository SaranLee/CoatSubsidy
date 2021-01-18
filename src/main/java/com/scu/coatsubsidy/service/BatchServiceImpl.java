package com.scu.coatsubsidy.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.scu.coatsubsidy.common.SessionUtils;
import com.scu.coatsubsidy.domain.Batch;
import com.scu.coatsubsidy.domain.BatchExample;
import com.scu.coatsubsidy.domain.WhiteList;
import com.scu.coatsubsidy.mapper.BatchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.scu.coatsubsidy.common.Constant.*;

@Service
public class BatchServiceImpl implements BatchService {

    @Autowired
    private BatchMapper mapper;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private KnrdService knrdService;

    @Override
    public PageInfo list(Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        BatchExample example = new BatchExample();
        example.createCriteria().andDeletedEqualTo(NOT_DELETED);
        example.setOrderByClause("id DESC");
        List<Batch> batches = mapper.selectByExample(example);
        //设置困难等级名称
        batches.stream().forEach(batch -> batch.setDifficultyLevel(dictionaryService.getNameByTypeAndValue(DT_DIFFICULTY, batch.getDifficultyLevel())));
        return new PageInfo<>(batches);
    }

    @Override
    public Boolean hasActiveOne() {
        BatchExample example = new BatchExample();
        example.createCriteria().andActiveEqualTo(1);
        List<Batch> list = mapper.selectByExample(example);
        return (list.size() > 0);
    }

    @Override
    public boolean add(Batch batch) {
        mapper.insertSelective(batch);
        return true;
    }

    @Override
    public boolean updateById(Batch batch) {
        mapper.updateByPrimaryKeySelective(batch);
        return true;
    }

    @Override
    public Batch getBatchById(Integer id) {
        BatchExample example = new BatchExample();
        example.createCriteria().andIdEqualTo(id.longValue());
        List<Batch> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.get(0);
        else
            return null;
    }

    @Override
    public List<Batch> getAll() {
        BatchExample example = new BatchExample();
        example.setOrderByClause("id DESC");
        return mapper.selectByExample(example);
    }

    @Override
    public Batch getCurrBatch() {
        BatchExample example = new BatchExample();
        example.createCriteria().andActiveEqualTo(1);
        List<Batch> list = mapper.selectByExample(example);
        if(list.size() > 0)
            return list.get(0);
        else
            return null;
    }

    @Override
    public boolean checkUserDiff() {
        String currBatchDiff = getCurrBatch().getDifficultyLevel();
        WhiteList user = SessionUtils.getLoginUser();
        String userDiff = knrdService.getDiffLevelByStudentId(user.getSn());
        if(userDiff == null)
            return false;
        switch (currBatchDiff) {
            case DIFF_LEVEL_BKN:
                return true;
            case DIFF_LEVEL_YBKN:
                return !userDiff.equals("不困难");
            case DIFF_LEVEL_TSKN:
                return userDiff.equals("特殊困难");
            default:
                return false;
        }
    }
}
