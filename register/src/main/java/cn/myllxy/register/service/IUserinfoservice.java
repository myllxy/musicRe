package cn.myllxy.register.service;

import cn.myllxy.register.domain.User;

import java.util.Map;

/**
 * @author nsu_zk
 * @create 2019-12-01 14:02
 */
public interface IUserinfoservice extends IBaseService<User, Long> {

    /**
     * 根据用户名和邮箱获取用户信息
     *
     * @param name 用户名
     * @param email 用户邮箱
     * @return 用户实体, 此实体有可能是缺省值
     */
    Map getDuplicateRegistInfoMap(String name, String email);

    User checkDuplicateregist(String name, String email);

    User findByName(String name);
}
