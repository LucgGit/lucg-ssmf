package com.lucg.ssmf.dao.login;

import com.lucg.ssmf.entity.user.UserLoginLogEntity;

import java.util.Map;

public interface ILoginLogDao {

    /**
     * 保存登录日志
     * 
     * @param loginLog UserLoginLogEntity
     */
    void saveLoginLog(UserLoginLogEntity loginLog);

    /**
     * 保存登出时间
     * 
     * @param con condition
     */
    int saveLogOutTime(Map<String, Object> con);

    /**
     * 检索五分钟内登录失败次数
     * 
     * @param con condition
     * @return integer
     */
    int selectErrLoginCount(Map<String, Object> con);

    /**
     * 检索用户最近的一条登录日志
     * 
     * @param con condition
     * @return integer
     */
    UserLoginLogEntity selectLatestLog(Map<String, Object> con);

}
