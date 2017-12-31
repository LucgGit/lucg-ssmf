package com.lucg.ssmf.dao.login.impl;

import com.lucg.ssmf.dao.login.ILoginLogDao;
import com.lucg.ssmf.entity.user.UserLoginLogEntity;
import com.lucg.ssmf.util.db.BaseDao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class LoginLogDaoImpl extends BaseDao implements ILoginLogDao {

    public static final String NAMESPACE = "login.log.";

    @Override
    public void saveLoginLog(UserLoginLogEntity loginLog) {
        getSqlSession().insert(NAMESPACE + "saveLoginLog", loginLog);
    }

    @Override
    public int saveLogOutTime(Map<String, Object> con) {
        return getSqlSession().update(NAMESPACE + "saveLogOutTime", con);
    }

    @Override
    public int selectErrLoginCount(Map<String, Object> con) {
        return (Integer) getSqlSession().selectOne(NAMESPACE + "selectErrLoginCount", con);
    }

    @Override
    public UserLoginLogEntity selectLatestLog(Map<String, Object> con) {
        return getSqlSession().selectOne(NAMESPACE + "selectLatestLog", con);
    }

}
