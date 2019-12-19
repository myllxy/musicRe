package cn.myllxy.register.web.controller;

import cn.myllxy.register.common.CheckDup;
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

    @RequestMapping(value = "/checkDuplicateregist", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> checkDuplicateregist(
            @RequestParam(value = "name", defaultValue = "") String name,
            @RequestParam(value = "email", defaultValue = "") String email) {
        Map<String, String> map = new HashMap<>();
        User user = ui.checkDuplicateregist(name, email);
        return CheckDup.checkDuplicateregist(user, map, name, email);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> register(@RequestParam(value = "name", defaultValue = "") String name,
                                        @RequestParam(value = "email", defaultValue = "") String email,
                                        @RequestParam(value = "password", defaultValue = "") String password) {
        Map<String, String> map = new HashMap<>();
        try {
            ui.register(name, email, password);
            map.put("register_result", "注册成功!");
        } catch (Exception e) {
            map.put("register_result", "注册失败!");
        }
        return map;
    }
}
