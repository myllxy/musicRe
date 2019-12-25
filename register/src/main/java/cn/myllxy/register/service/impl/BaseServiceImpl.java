package cn.myllxy.register.service.impl;


import cn.myllxy.register.repository.BaseRepository;
import cn.myllxy.register.service.IBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.Serializable;
import java.util.List;

/**
 * 父接口的实现  这个类就是一个父类,根本就不用它创建对象
 *
 * @param <T>
 * @param <ID>
 */
@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
public abstract class BaseServiceImpl<T, ID extends Serializable> implements IBaseService<T, ID> {

    /**
     * 这个地方咱们注入的是BaseRepository的实现
     * 其实对应的是它的所有子接口的实现(注:它有很多子接口)
     * EmployeeRepository
     * DepartmentRepository
     */
    @Autowired
    private BaseRepository<T, ID> baseRepository;
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public void save(T t) {
        baseRepository.save(t);
    }

    @Override
    @Transactional
    public void delete(ID id) {
        baseRepository.delete(id);
    }

    @Override
    public T findOne(ID id) {
        return baseRepository.findOne(id);
    }

    @Override
    public List<T> findAll() {
        return baseRepository.findAll();
    }

    @Override
    public List<Object> queryByJpql(String jpql, Object... params) {
        //1.创建query对象
        Query query = entityManager.createQuery(jpql);
        //2.把参数放进去
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i + 1, params[i]);
        }
        //3.获到数据
        return query.getResultList();
    }
}
