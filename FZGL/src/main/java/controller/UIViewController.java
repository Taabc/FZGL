package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UIViewController {
    @RequestMapping("login")
    public String login(){
        return "login";
    }

    @RequestMapping("index")
    public String index(){
        return "index";
    }

    @RequestMapping("index_v")
    public String index_v(){
        return "index_v";
    }

    @RequestMapping("register")
    public String register(){
        return "register";
    }

    @RequestMapping("goodsList")
    public String goodsList(){
        return "goodsList";
    }

    @RequestMapping("recordList")
    public String recordList(){
        return "recordList";
    }

    @RequestMapping("userList")
    public String userList(){
        return "userList";
    }
}
