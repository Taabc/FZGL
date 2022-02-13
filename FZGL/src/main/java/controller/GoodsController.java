package controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.G_Record;
import pojo.Goods;
import pojo.ResultMap;
import pojo.User;
import service.G_RecordService;
import service.GoodsService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    GoodsService goodsService;
    @Autowired
    G_RecordService g_recordService;

    ResultMap resultMap = new ResultMap();

    @RequestMapping("/goodsList")
    @ResponseBody
    public String findGoodsList(Integer page, Integer limit) {
//       PageInfo<User> userlist =  userService.findAll(page,limit);
//
//        System.out.println(userlist.toString());
//      return JSON.toJSONString(userlist);
        //        开启分页
        PageHelper.startPage(page, limit);
//        得到用户列表
        List<Goods> goods = goodsService.findAllGoods();
       // System.out.println(goods);
//        创建分页数据
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(goods);
        return JSON.toJSONString(goodsPageInfo);
    }

    @RequestMapping("updateGoods")
    @ResponseBody
    public String updateGoods(String updateValue) {
        Goods goods = JSON.parseObject(updateValue, Goods.class);
        System.out.println(goods);
        ResultMap resultMap = new ResultMap();
        resultMap.setStatus(goodsService.updateGoods(goods));
        return JSON.toJSONString(resultMap);
    }

    @RequestMapping("addGoods")
    @ResponseBody
    public String addGoods(String addValue){
        Goods goods = JSON.parseObject(addValue, Goods.class);
        System.out.println(goods);
        ResultMap resultMap = new ResultMap();
        resultMap.setStatus(goodsService.addGoods(goods));
        return JSON.toJSONString(resultMap);
    }

    @RequestMapping("deleteGoods")
    @ResponseBody
    public String deleteGoods(Integer id) {
        ResultMap resultMap = new ResultMap();
        resultMap.setStatus(goodsService.deleteGoods(id));
        return JSON.toJSONString(resultMap);
    }

    @RequestMapping("updateRepertory")
    @ResponseBody
    public String updateRepertory(Integer id, Integer num, String flag, HttpServletRequest request) {
        ResultMap resultMap = new ResultMap();
        if (flag != null && id != null && num != null) {

            User user = (User) request.getSession().getAttribute("loginUser");
            Goods goods = goodsService.findGoodsNumById(id);
            System.out.println(goods);
            G_Record g_record = new G_Record();
            g_record.setFlag(flag);
            g_record.setUid(user.getId());
            g_record.setGid(id);
            if (flag.equals("in")) {
                goodsService.updateRepertory(id, num + goods.getRepertory());
            } else if (flag.equals("out")) {
                int af = goods.getRepertory() - num;
                if (af < 0){
                    resultMap.setStatus(false);
                    return JSON.toJSONString(resultMap);
                }
                goodsService.updateRepertory(id,  af);
            }
            g_record.setNum(num);
            g_record.setTime(new Date());
            System.out.println(g_record);
            resultMap.setStatus(g_recordService.addRecord(g_record));
            return JSON.toJSONString(resultMap);

        }

        resultMap.setStatus(false);
        return JSON.toJSONString(resultMap);
    }

    @RequestMapping("recordList")
    @ResponseBody
    public String recordList(Integer page, Integer limit){
        System.out.println("page"+page);
        System.out.println("limit"+limit);
        PageHelper.startPage(page, limit);
//        得到用户列表
        List<G_Record> g_records = g_recordService.findAllRecord();
        System.out.println(g_records);
        //System.out.println(g);
//        创建分页数据
        PageInfo<G_Record> recordPageInfo = new PageInfo<>(g_records);
        return JSON.toJSONString(recordPageInfo);
    }
}
