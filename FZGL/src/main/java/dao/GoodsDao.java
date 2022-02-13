package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Goods;

import java.util.List;

public interface GoodsDao {
    List<Goods> findAllGoods();
    Goods findGoodsNumById(Integer id);
    Integer addGoods(Goods goods);
    Integer updateGoods(Goods goods);
    Integer deleteGoods(Integer id);
    Integer updateRepertory(@Param("id") Integer id, @Param("repertory") Integer repertory);
}
