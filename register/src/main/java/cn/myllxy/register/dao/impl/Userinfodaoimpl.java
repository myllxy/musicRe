package cn.myllxy.register.dao.impl;

import cn.myllxy.register.dao.IUserinfo;
import cn.myllxy.register.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author nsu_zk
 * @create 2019-12-01 13:41
 */
@Repository
public class Userinfodaoimpl implements IUserinfo {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public User checkDuplicateregist(String name, String email) {
        String sql = "select * from user where name = ? or email = ?";
        List<User> list;
        try {
            list = jdbcTemplate.query(
                    sql, new BeanPropertyRowMapper<>(User.class), name, email);
            if (list.size() != 0) {
                return list.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
