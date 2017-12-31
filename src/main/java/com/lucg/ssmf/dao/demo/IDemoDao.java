package com.lucg.ssmf.dao.demo;

import com.lucg.ssmf.entity.user.UserInfoEntity;

import java.util.List;

public interface IDemoDao {

    List<UserInfoEntity> getUserInfo(UserInfoEntity userInfo);
}
