package cn.myllxy.register.web.controller;

import cn.myllxy.register.domain.Music;
import cn.myllxy.register.domain.User;
import cn.myllxy.register.service.impl.MusicInfoServiceimpl;
import cn.myllxy.register.service.impl.Userinfoserviceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author nsu_zk
 * @create 2019-12-01 14:06
 */
@Controller
@RequestMapping("/music")
public class MusicController {
    @Autowired
    private MusicInfoServiceimpl musicInfoServiceimpl;

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    @ResponseBody
    public List<Music> findByNameLike(String name) {
        return musicInfoServiceimpl.findByNameLike("%" + name + "%");
    }
}
