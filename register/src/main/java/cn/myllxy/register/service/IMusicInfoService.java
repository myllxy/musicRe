package cn.myllxy.register.service;

import cn.myllxy.register.domain.Music;
import cn.myllxy.register.domain.User;

import java.util.List;
import java.util.Map;

/**
 * @author nsu_zk
 * @create 2019-12-01 14:02
 */
public interface IMusicInfoService extends IBaseService<Music, Long> {
    /**
     * 通过模糊查询搜索歌曲
     *
     * @param name
     * @return
     */
    List<Music> findByNameLike(String name);
}
