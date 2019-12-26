package cn.myllxy.register.service.service;

import cn.myllxy.register.service.IUserinfoservice;
import cn.myllxy.register.service.SpringTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


public class EmployeeServiceTest extends SpringTest {

    @Autowired
    private IUserinfoservice userinfoservice;

    @Test
    public void findByName() {
        System.out.println(userinfoservice.findByName("qq"));
    }
}
