package cn.myllxy.register.service.impl;

import cn.myllxy.register.common.CheckDup;
import cn.myllxy.register.domain.User;
import cn.myllxy.register.repository.UserRepository;
import cn.myllxy.register.service.IUserinfoservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * @author nsu_zk
 * @create 2019-12-01 14:03
 */
@Service
public class Userinfoserviceimpl extends BaseServiceImpl<User, Long> implements IUserinfoservice {
    @Autowired
    private UserRepository userRepository;

    /**
     * @param name  用户名
     * @param email 用户邮箱
     * @return 用户输入的用户名和邮箱信息是否重复的map
     */
    @Override
    public Map<String, String> getDuplicateRegistInfoMap(String name, String email) {
        /* 如果ofNullable中的参数不为null,就执行map中的逻辑 */
        Optional<HashMap<String, String>> map = Optional
                .ofNullable(userRepository.checkDuplicateregist(name, email))
                .map(user -> {
                    HashMap<String, String> hashMap = new HashMap<>();
                    if (name.equals(user.getName())) {
                        hashMap.put("name", "用户名重复");
                    } else if (email.equals(user.getEmail())) {
                        hashMap.put("email", "邮箱重复");
                    }
                    return hashMap;
                });
        HashMap<String, String> h = new HashMap<>();
        return map.orElse(h);
    }

    /**
     * @param name  用户名
     * @param email 用户邮箱
     * @return 用户实体
     */
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
