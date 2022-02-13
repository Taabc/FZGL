package service;

import com.github.pagehelper.PageInfo;
import pojo.ResultMap;
import pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserService {
    boolean login(String username, String password, ResultMap resultMap, HttpServletRequest request);

    boolean register(User user);

    List<User> findAll();

    boolean deleteById(Integer id);

    boolean updataByUser(User user);
}
