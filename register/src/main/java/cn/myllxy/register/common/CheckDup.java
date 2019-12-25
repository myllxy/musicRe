package cn.myllxy.register.common;

import cn.myllxy.register.domain.User;

import java.util.Map;

/**
 * 用于验证重复的注册
 *
 * @author myllxy
 * @create 2019-12-19 11:04
 */
public class CheckDup {
    public static Map<String, String> checkDuplicateregist(User user, Map<String, String> map, String name, String email) {
        // 用户名或者邮箱已经存在，向前台反映
        if (user != null) {
            if (user.getName().equals(name)) {
                map.put("name", "用户名重复,不可以注册");
            }
            if (user.getEmail().equals(email)) {
                map.put("email", "邮箱重复,不可以注册");
            }
        } else {
            map.put("result", "可以注册");
        }
        return map;
    }
}
