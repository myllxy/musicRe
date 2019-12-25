package cn.myllxy.register.domain;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * 在JPA中,domain的父类必需要加: MappedSuperclass
 *
 * @MappedSuperclass :
 * 意义:
 * 在实际开发中为了提高代码复用性以及便于管理,常常将模型中的公共属性
 * 提取出来成为一个公共可访问的模块,比如表中的id,将id单独封装在个
 * 类中,并且打上@MappedSuperclass注解,提供给其子类使用
 * 作用:
 * 1.标注为@MappedSuperclass的类将不是一个完整的 实体类,
 * 他将不会映射到数据库表,但是他的属性都将映射到其子类的数据库字段中。
 * 2.标注为@MappedSuperclass的类不能再标注@Entity或@Table注解,
 * 也无需实现序列化接口。
 */
@MappedSuperclass
public class BaseDomain {
    @Id
    @GeneratedValue
    protected Long id;
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
}
