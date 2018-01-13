package com.lucg.ssmf.util.db;

import static org.springframework.util.Assert.notNull;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class BaseDao<T extends BaseEntity> extends SqlSessionDaoSupport {

    private SqlSessionExecutor<T> sqlSession;

    private SqlSessionFactory sqlSessionFactory;

    @Resource
    @Override
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSession = new SqlSessionExecutor<T>(this.sqlSessionFactory);
    }

    @Override
    public final SqlSessionExecutor<T> getSqlSession() {
        return this.sqlSession;
    }

    @Override
    protected void checkDaoConfig() {
        notNull(this.sqlSession, "Property 'sqlSessionFactory' or 'sqlSessionTemplate' are required");
    }

}
