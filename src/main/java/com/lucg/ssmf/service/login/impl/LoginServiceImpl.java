package com.lucg.ssmf.service.login.impl;

import com.lucg.ssmf.dao.login.ILoginDao;
import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.service.login.ILoginService;
import com.lucg.ssmf.type.ActiveFlag;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements ILoginService {

    @Autowired
    ILoginDao loginDao;

    @Override
    public UserInfoEntity findUserByPassword(UserInfoEntity userInfo) {
        userInfo.setActiveFlag(ActiveFlag.ACTIVE.getValue());
        return loginDao.findUserByPassword(userInfo);
    }

    @Override
    public int regist(UserInfoEntity userInfo) {
        userInfo.setActiveFlag(ActiveFlag.ACTIVE.getValue());
        return loginDao.registUserBaseInfo(userInfo);
    }

    @Override
    public int queryUserCount(String userCode) {
        Map<String, Object> con = new HashMap<>();
        con.put("userCode", userCode);
        con.put("activeFlag", ActiveFlag.ACTIVE.getValue());
        return loginDao.queryUserCount(con);
    }

}
