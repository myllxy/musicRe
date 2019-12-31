package cn.myllxy.register.web.controller;

import cn.myllxy.register.common.JsonResult;
import cn.myllxy.register.domain.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Optional;

/**
 * @author myllxy
 * @create 2019-12-14 20:35
 */
@Controller
public class LoginController {
    @RequestMapping("/login")
    @ResponseBody
    public JsonResult login(String name, String password) {
        /* 1.拿到当前用户 */
        Subject subject = SecurityUtils.getSubject();
        try {
            /* 2.封装令牌，进行登录 */
            UsernamePasswordToken token = new UsernamePasswordToken(name, password);
            subject.login(token);
        } catch (UnknownAccountException e) {
            System.out.println("用户名错误！！！");
            e.printStackTrace();
            return new JsonResult(false, "登录失败,用户名或密码错误");
        } catch (IncorrectCredentialsException e) {
            System.out.println("密码错误！！！");
            e.printStackTrace();
            return new JsonResult(false, "登录失败,用户名或密码错误");
        } catch (AuthenticationException e) {
            System.out.println("神秘错误！！！！");
            e.printStackTrace();
        }
        return new JsonResult("登录成功");
    }

    //登出跳到登录页面
    @RequestMapping("/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/index.jsp";
    }

    @RequestMapping("/hasUser")
    @ResponseBody
    public User hasUser() {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        try {
            Optional.ofNullable(user)
                    .orElseThrow(() -> new Exception("后台获取用户失败"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
