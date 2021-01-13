import com.scu.coatsubsidy.domain.Batch;
import com.scu.coatsubsidy.domain.BatchExample;
import com.scu.coatsubsidy.mapper.BatchMapper;
import com.scu.coatsubsidy.service.BatchServiceImpl;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDate;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/conf/spring-config.xml")
public class Test {

    @Autowired
    private BatchMapper mapper;

    @org.junit.Test
    public void insertRecord(){
        for(int i = 0;i < 10;i++) {
            Batch batch = new Batch();
            batch.setName("2021春季第" + (i+1) + "批次" );
            batch.setApplicationStartDate(LocalDate.now());
            batch.setApplicationEndDate(LocalDate.of(2021, 1, 15));
            batch.setRegisterStartDate(LocalDate.of(2021, 1, 20));
            batch.setRegisterEndDate(LocalDate.of(2021, 1, 24));
            batch.setDifficultyLevel("BKN");
            batch.setActive(0);
            mapper.insertSelective(batch);
        }
    }
}
