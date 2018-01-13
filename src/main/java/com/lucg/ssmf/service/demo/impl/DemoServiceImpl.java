package com.lucg.ssmf.service.demo.impl;

import com.lucg.ssmf.dao.demo.IDemoDao;
import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.service.demo.IDemoService;
import com.lucg.ssmf.util.db.Limit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DemoServiceImpl implements IDemoService {

    @Autowired
    IDemoDao demoDao;

    @Override
    public List<UserInfoEntity> getUserInfo(UserInfoEntity userInfo, Limit limit) {
        return demoDao.getUserInfo(userInfo, limit);
    }

}
