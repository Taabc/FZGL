package dao;

import pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

//把dao加入到容器

public interface UserDao {

    User login(String username);


    int register(User user);

    List<User> findAll();

    Integer deleteById(Integer id);

    Integer updataByUser(User user);
}
