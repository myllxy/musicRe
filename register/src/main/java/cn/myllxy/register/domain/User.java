package cn.myllxy.register.domain;

/**
 * @author nsu_zk
 * @create 2019-12-01 13:26
 */
public class User {
    private String name;
    private String password;
    private String email;

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
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
