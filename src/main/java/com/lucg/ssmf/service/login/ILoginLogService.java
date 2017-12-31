package com.lucg.ssmf.service.login;

import com.lucg.ssmf.entity.user.UserLoginLogEntity;

public interface ILoginLogService {

    /**
     * 保存登录日志
     * 
     * @param loginLog UserLoginLogEntity
     */
    void saveLoginLog(UserLoginLogEntity loginLog);

    /**
     * 保存登出时间
     * 
     * @param loginLog UserLoginLogEntity
     */
    void saveLogOutTime(String sessionId);

    /**
     * 检索五分钟内登录失败次数
     * 
     * @param userCode String
     * @return integer
     */
    int selectErrLoginCount(String userCode);

    /**
     * 检索用户最近的一条登录日志
     * 
     * @param userCode String
     * @return integer
     */
    UserLoginLogEntity selectLatestLog(String userCode);

    /**
     * 验证登录是否有效
     * 
     * @param sessionId String
     * @param userCode String
     * @return Boolean
     */
    Boolean isOnline(String sessionId, String userCode);

}
