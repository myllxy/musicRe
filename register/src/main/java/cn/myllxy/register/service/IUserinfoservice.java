package cn.myllxy.register.service;

import cn.myllxy.register.domain.User;

/**
 * @author nsu_zk
 * @create 2019-12-01 14:02
 */
public interface IUserinfoservice {
    User checkDuplicateregist(String name, String email);
}
