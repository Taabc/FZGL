package service;

import pojo.G_Record;

import java.util.List;

public interface G_RecordService {
    List<G_Record> findAllRecord();
    boolean addRecord(G_Record g_record);
}
