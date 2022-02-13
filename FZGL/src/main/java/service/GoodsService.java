package service;

import pojo.G_Record;
import pojo.Goods;
import pojo.User;

import java.util.List;

public interface GoodsService {
    List<Goods> findAllGoods();

    boolean deleteGoods(Integer id);

    boolean updateGoods(Goods goods);

    boolean addGoods(Goods goods);

    boolean updateRepertory(Integer id, Integer repertory);

    Goods findGoodsNumById(Integer id);
}
