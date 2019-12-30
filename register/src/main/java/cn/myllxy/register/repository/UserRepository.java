package cn.myllxy.register.repository;

import cn.myllxy.register.domain.User;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;


/**
 * 第一个泛型:代表类型
 * 第二个泛型:主键类型
 */
public interface UserRepository extends BaseRepository<User, Long> {
    /**
     * @param name  用户名
     * @param email 用户邮箱
     * @return 用户实体
     */
    @Query(nativeQuery = true, value = "select * from user where name = ?1 or email = ?2 limit 1")
    User checkDuplicateregist(String name, String email);

    /* 根据用户名查到第一个元素 */
    User findFirstByName(String name);
}
