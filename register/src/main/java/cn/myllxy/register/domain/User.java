package cn.myllxy.register.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author nsu_zk
 * @create 2019-12-01 13:26
 */
@Entity
@Table(name = "user")
public class User extends BaseDomain {
    private String name;
    private String password;
    private String email;
    private String headImg;

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", headImg='" + headImg + '\'' +
                '}';
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public User(String name, String password, String email, String headImg) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.headImg = headImg;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User() {
    }

    public User(String name, String password, String email) {

        this.name = name;
        this.password = password;
        this.email = email;
    }
}
