package com.lucg.ssmf.dao.login;

import com.lucg.ssmf.entity.user.UserInfoEntity;

import java.util.Map;

public interface ILoginDao {

    /**
     * 根据用户名密码查找用户信息
     * 
     * @param userInfo UserInfoEntity
     * @return UserInfoEntity
     */
    UserInfoEntity findUserByPassword(UserInfoEntity userInfo);

    /**
     * 登入用户基本信息
     * 
     * @param userInfo UserInfoEntity
     * @return integer
     */
    int registUserBaseInfo(UserInfoEntity userInfo);

    /**
     * 检索用户编码是否存在
     * 
     * @param con condition
     * @return integer
     */
    int queryUserCount(Map<String, Object> con);

}
