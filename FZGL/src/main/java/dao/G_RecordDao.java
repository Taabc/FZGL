package dao;

import pojo.G_Record;

import java.util.List;

public interface G_RecordDao {
    List<G_Record> findAllRecord();
    Integer addRecord(G_Record g_record);
}
