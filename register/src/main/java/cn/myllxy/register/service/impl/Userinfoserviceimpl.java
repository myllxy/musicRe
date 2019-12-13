package cn.myllxy.register.service.impl;

import cn.myllxy.register.dao.impl.Userinfodaoimpl;
import cn.myllxy.register.domain.User;
import cn.myllxy.register.service.IUserinfoservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author nsu_zk
 * @create 2019-12-01 14:03
 */
@Service
public class Userinfoserviceimpl implements IUserinfoservice {
    @Autowired
    private Userinfodaoimpl ui;

    @Override
    public User checkDuplicateregist(String name, String email) {
        return ui.checkDuplicateregist(name, email);
    }

    @Override
    public void register(String name, String email, String password) {
        ui.register(name, email, password);
    }
}
