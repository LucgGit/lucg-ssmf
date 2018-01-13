package com.lucg.ssmf.service.demo;

import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.util.db.Limit;

import java.util.List;

public interface IDemoService {

    List<UserInfoEntity> getUserInfo(UserInfoEntity userInfo, Limit limit);

}
