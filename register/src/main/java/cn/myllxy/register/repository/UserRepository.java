package cn.myllxy.register.repository;

import cn.myllxy.register.domain.User;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


/**
 * 第一个泛型:代表类型
 * 第二个泛型:主键类型
 */
public interface UserRepository extends BaseRepository<User, Long> {
    @Query(nativeQuery = true, value = "select * from user where name = ?1 or email = ?2 limit 1")
    User checkDuplicateregist(String name, String email);

    @Query(nativeQuery = true, value = "insert into user (name,email,password) values(?1,?2,?3)")
    void register(String name, String email, String password);

    /* 根据用户名查到第一个元素 */
    User findFirstByName(String username);
}