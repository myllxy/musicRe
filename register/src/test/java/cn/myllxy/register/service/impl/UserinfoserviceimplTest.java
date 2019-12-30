package cn.myllxy.register.service.impl;

import cn.myllxy.register.service.IUserinfoservice;
import cn.myllxy.register.service.SpringTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * @author myllxy
 * @create 2019-12-28 16:59
 */
public class UserinfoserviceimplTest extends SpringTest {
    @Autowired
    private IUserinfoservice userinfoservice;

    @Test
    public void getOptional() {
        System.out.println(userinfoservice.getDuplicateRegistInfoMap("张三1111", ""));
    }

    @Test
    public void checkDuplicateregist() {
        System.out.println(userinfoservice.checkDuplicateregist("", ""));
    }
}