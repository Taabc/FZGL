package service.impl;

import dao.G_RecordDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.G_Record;
import service.G_RecordService;

import java.util.List;
@Service
@Transactional
public class G_RecordServiceImpl implements G_RecordService {
    @Autowired
    G_RecordDao g_recordDao;

    @Override
    public List<G_Record> findAllRecord() {
        return g_recordDao.findAllRecord();
    }

    @Override
    public boolean addRecord(G_Record g_record) {
        if (g_record != null){
            int row = g_recordDao.addRecord(g_record);
            if (row >0 ){
                return true;
            }
        }
        return false;
    }
}
