package com.lucg.ssmf.service.login;

import com.lucg.ssmf.entity.user.UserInfoEntity;

public interface ILoginService {

    /**
     * 根据用户名密码查找用户信息
     * 
     * @param userInfo UserInfoEntity
     * @return UserInfoEntity
     */
    UserInfoEntity findUserByPassword(UserInfoEntity userInfo);

    /**
     * 用户注册
     * 
     * @param userInfo UserInfoEntity
     * @return integer
     */
    int regist(UserInfoEntity userInfo);

    /**
     * 检索用户编码是否存在
     * 
     * @param userCode String
     * @return integer
     */
    int queryUserCount(String userCode);

}
