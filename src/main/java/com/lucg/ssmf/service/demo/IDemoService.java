package com.lucg.ssmf.service.demo;

import com.lucg.ssmf.entity.user.UserInfoEntity;

import java.util.List;

public interface IDemoService {

    List<UserInfoEntity> getUserInfo(UserInfoEntity userInfo);

}
