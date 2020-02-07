package cn.myllxy.register.service.impl;

import cn.myllxy.register.domain.Music;
import cn.myllxy.register.repository.MusicRepository;
import cn.myllxy.register.service.IMusicInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author nsu_zk
 * @create 2019-12-01 14:03
 */
@Service
public class MusicInfoServiceimpl extends BaseServiceImpl<Music, Long> implements IMusicInfoService {
    @Autowired
    private MusicRepository musicRepository;

    @Override
    public List<Music> findByNameLike(String name) {
        return musicRepository.findByNameLike(name);
    }
}
