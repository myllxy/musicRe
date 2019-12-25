package cn.myllxy.register.service;


import java.io.Serializable;
import java.util.List;

public interface IBaseService<T,ID extends Serializable> {
    //添加或者修改
    void save(T t);
    void delete(ID id);
    T findOne(ID id);
    List<T> findAll();

    /**
     * jpql:语句 select o from Employee where name = ? and age > ?
     * params：参数(类型与数量不确定的)
     */
    List<Object> queryByJpql(String jpql, Object... params);

}
