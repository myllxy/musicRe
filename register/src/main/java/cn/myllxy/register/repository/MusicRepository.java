package cn.myllxy.register.repository;

import cn.myllxy.register.domain.Music;
import cn.myllxy.register.domain.User;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


/**
 * 第一个泛型:代表类型
 * 第二个泛型:主键类型
 */
public interface MusicRepository extends BaseRepository<Music, Long> {
    List<Music> findByNameLike(String name);
}
