package cn.myllxy.register.service.impl;

import cn.myllxy.register.domain.User;
import cn.myllxy.register.repository.UserRepository;
import cn.myllxy.register.service.IUserinfoservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author nsu_zk
 * @create 2019-12-01 14:03
 */
@Service
public class Userinfoserviceimpl extends BaseServiceImpl<User, Long> implements IUserinfoservice {
    @Autowired
    private UserRepository userRepository;

    @Override
    public User checkDuplicateregist(String name, String email) {
        return userRepository.checkDuplicateregist(name, email);
    }

    public void register(User user) {
        userRepository.save(user);
    }

    @Override
    public User findByName(String name) {
        return userRepository.findFirstByName(name);
    }
}
