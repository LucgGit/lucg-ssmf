package com.lucg.ssmf.dao.demo;

import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.util.db.Limit;

import java.util.List;

public interface IDemoDao {

    List<UserInfoEntity> getUserInfo(UserInfoEntity userInfo, Limit limit);
}
