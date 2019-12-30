package cn.myllxy.register.web.controller;

import cn.myllxy.register.domain.User;
import cn.myllxy.register.service.impl.Userinfoserviceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


/**
 * @author nsu_zk
 * @create 2019-12-01 14:06
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private Userinfoserviceimpl ui;

    /**
     * 前台会做一个判断,如果email和name输入框为空,是不会发送ajax请求的
     *
     * @param name
     * @param email
     * @return
     */
    @RequestMapping(value = "/checkDuplicateregist", method = RequestMethod.POST)
    @ResponseBody
    public Map checkDuplicateregist(String name, String email) {
        return ui.getDuplicateRegistInfoMap(name, email);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> register(User user) {
        Map<String, String> map = new HashMap<>();
        try {
            ui.register(user);
            map.put("register_result", "注册成功!");
        } catch (Exception e) {
            map.put("register_result", "注册失败!");
            e.printStackTrace();
        }
        return map;
    }
}
