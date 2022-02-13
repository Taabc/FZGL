package service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.UserDao;
import org.springframework.transaction.annotation.Transactional;
import pojo.ResultMap;
import pojo.User;
import service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

//把service加入到Spring容器
@Service
@Transactional
public class UserServiceImpl implements UserService {
//    自动装配，从pring容器里获取
    @Autowired
    UserDao userDao;
    @Override
    public boolean login(String username, String password, ResultMap resultMap, HttpServletRequest request) {
//          验证数据是否合法
        if (username != null && password != null) {
//            数据合法
            User login = userDao.login(username);
//          从数据库查询出来的用户
            if (login == null) {
//                登录失败，没有该用户名

                resultMap.setMessage("该用户名不存在");
                return false;
            } else {
//                查询成功，开始判断密码是否正确
                if (password.equals(login.getPassword())) {
//                    相等，密码正确
                    resultMap.setMessage("登录成功");
//                    把登录的用户存入session中
                    request.getSession().setAttribute("loginUser",login);
                    return true;
                }
            }
        }
        resultMap.setMessage("密码错误");
        return false;
    }

    @Override
    public boolean register(User user) {
        if (user != null) {
//            数据合法
            user.setU_delete(0);
            int register = userDao.register(user);
            if (register == 1) {
//                添加成功
                return true;
            }
        }
        return false;
    }


    @Override
    public List<User> findAll() {

//        //        开启分页
//        PageHelper.startPage(page, limit);
////        得到用户列表
//        List<User> users = userDao.findAll();
////        创建分页数据
//        PageInfo<User> userPageInfo = new PageInfo<>(users);
//        return userPageInfo;
        return userDao.findAll();
    }

    @Override
    public boolean deleteById(Integer id) {
        int row = userDao.deleteById(id);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean updataByUser(User user) {
        int row = userDao.updataByUser(user);
        if (row > 0){
            return true;
        }
        return false;
    }

    public void test(){
        System.out.println("test");
    }
}
