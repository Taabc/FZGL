package service.impl;

import dao.GoodsDao;
import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pojo.Goods;
import service.GoodsService;

import java.util.List;
//把service加入到Spring容器
@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsDao goodsDao;

    @Override
    public List<Goods> findAllGoods() {
        return goodsDao.findAllGoods();
    }

    @Override
    public boolean deleteGoods(Integer id) {
        if (id != null){
            int row = goodsDao.deleteGoods(id);
            if (row > 0){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean updateGoods(Goods goods) {
        if (goods != null){
            int row = goodsDao.updateGoods(goods);
            if (row > 0){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean addGoods(Goods goods) {
        if(goods != null){
            int row = goodsDao.addGoods(goods);
            if(row > 0){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean updateRepertory(Integer id, Integer repertory) {
        if (id != null && repertory != null){
            int row = goodsDao.updateRepertory(id, repertory);
            if (row > 0){
                return true;
            }
        }
        return false;
    }

    @Override
    public Goods findGoodsNumById(Integer id) {
        if (id != null){
            Goods goods = goodsDao.findGoodsNumById(id);
            return goods;
        }
        return null;
    }
}
