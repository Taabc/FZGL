package controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import pojo.ResultMap;
import pojo.User;
import service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
//    自动注入
    @Autowired
    UserService userService;
    ResultMap resultMap = new ResultMap();

    @RequestMapping("/login")
//    返回的数据为json格式
    @ResponseBody
    public String login(String username,String password,HttpServletRequest request) {
        try{
            boolean result = userService.login(username, password,resultMap,request);
            userService.te
            resultMap.setStatus(result);
        }catch (Exception e){
            e.printStackTrace();
        }
//        if (resultMap.isStatus()){
//            return "redirect:WEB-INF/index_v.jsp";
//        }
        return JSON.toJSONString(resultMap);
        //return resultMap.toString();
    }

//    对应前端请求的路径
    @RequestMapping("/register")
    @ResponseBody
    public String register(User user) {
        System.out.println(user);
        boolean register = userService.register(user);
        resultMap.setStatus(register);
        return JSON.toJSONString(resultMap);
        //return resultMap.toString();
    }

    @RequestMapping("/userList")
    @ResponseBody
    public String findUserList(Integer page,Integer limit){
//       PageInfo<User> userlist =  userService.findAll(page,limit);
//
//        System.out.println(userlist.toString());
//      return JSON.toJSONString(userlist);
                //        开启分页
        PageHelper.startPage(page, limit);
//        得到用户列表
        List<User> users = userService.findAll();
        System.out.println(users);
//        创建分页数据
        PageInfo<User> userPageInfo = new PageInfo<>(users);
        return JSON.toJSONString(userPageInfo);
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public String deleteUser(Integer id){
        ResultMap resultMap = new ResultMap();
        resultMap.setStatus(userService.deleteById(id));
        return JSON.toJSONString(resultMap);
    }

    @RequestMapping("updateUser")
    @ResponseBody
    public String updateUser(String updateValue){
        User user = JSON.parseObject(updateValue,User.class);
        System.out.println(user);
        ResultMap resultMap = new ResultMap();
        resultMap.setStatus(userService.updataByUser(user));
        return JSON.toJSONString(resultMap);
    }


}
