package cn.myllxy.register.shiro;


import cn.myllxy.register.common.MD5utils;
import cn.myllxy.register.domain.User;
import cn.myllxy.register.service.IUserinfoservice;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * @author myllxy
 * @create 2019-12-14 11:02
 */
public class MyRealm extends AuthorizingRealm {
    @Autowired
    IUserinfoservice userinfoservice;


    //授权认证功能就写在这里面
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        return authorizationInfo;
    }


    /**
     * 记住：如果这个方法返回null,就代表是用户名错误，shiro就会抛出:UnknownAccountException
     */
    //身份认证(登录)就写在这里面
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 1.拿到令牌(UsernamePasswordToken)
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        // 2.拿到用户名，判断这个用户是否存在
        // 2.1 拿到传过来的用户名
        String username = token.getUsername();
        // 2.2 根据用户名从数据库中拿到密码(以后会拿用户对象)
        // 2.3 如果没有拿到密码(没有通过用户名拿到相应的用户->用户不存在)
        User user = userinfoservice.findByName(username);
        ByteSource salt = ByteSource.Util.bytes(MD5utils.SALT);
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, user.getPassword(), salt, getName());
        return authenticationInfo;
    }
}