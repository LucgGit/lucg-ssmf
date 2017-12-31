package com.lucg.ssmf.dao.demo.impl;

import com.lucg.ssmf.dao.demo.IDemoDao;
import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.util.db.BaseDao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class DemoDaoImpl extends BaseDao implements IDemoDao {

    public static final String NAMESPACE = "demo.";

    @Override
    public List<UserInfoEntity> getUserInfo(UserInfoEntity userInfo) {
        return getSqlSession().selectList(NAMESPACE + "getUserInfoById", userInfo);
    }

}
