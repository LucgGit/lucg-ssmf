package com.lucg.ssmf.dao.login.impl;

import com.lucg.ssmf.dao.login.ILoginDao;
import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.util.db.BaseDao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl extends BaseDao<UserInfoEntity> implements ILoginDao {

    public static final String NAMESPACE = "login.";

    @Override
    public UserInfoEntity findUserByPassword(UserInfoEntity userInfo) {
        return getSqlSession().selectOne(NAMESPACE + "findUserByPassword", userInfo);
    }

    @Override
    public int registUserBaseInfo(UserInfoEntity userInfo) {
        return getSqlSession().insert(NAMESPACE + "registUserBaseInfo", userInfo);
    }

    @Override
    public int queryUserCount(Map<String, Object> con) {
        return getSqlSession().selectOne(NAMESPACE + "queryUserCount", con);
    }

}
