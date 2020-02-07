package cn.myllxy.register.service.impl;

import cn.myllxy.register.service.IMusicInfoService;
import cn.myllxy.register.service.SpringTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * @author myllxy
 * @create 2019-12-28 16:59
 */
public class MusicinfoserviceimplTest extends SpringTest {
    @Autowired
    private IMusicInfoService musicInfoService;

    @Test
    public void findByNameLike() {
        System.out.println(musicInfoService.findByNameLike("%气%"));
    }
}