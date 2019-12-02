package cn.myllxy.register.dao;

import cn.myllxy.register.domain.User;

/**
 * @author nsu_zk
 * @create 2019-12-01 13:33
 */
public interface IUserinfo {
    User checkDuplicateregist(String name, String email);
}
