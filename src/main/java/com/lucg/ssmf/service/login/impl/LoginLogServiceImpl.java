package com.lucg.ssmf.service.login.impl;

import com.lucg.ssmf.dao.login.ILoginLogDao;
import com.lucg.ssmf.entity.user.UserLoginLogEntity;
import com.lucg.ssmf.service.login.ILoginLogService;
import com.lucg.ssmf.type.LoginStatus;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginLogServiceImpl implements ILoginLogService {

    @Autowired
    ILoginLogDao loginLogDao;

    @Override
    public void saveLoginLog(UserLoginLogEntity loginLog) {
        loginLogDao.saveLoginLog(loginLog);
    }

    @Override
    public void saveLogOutTime(String sessionId) {
        Map<String, Object> con = new HashMap<>();
        con.put("sessionId", sessionId);
        con.put("loginStatus", LoginStatus.SUCCESS.getValue());
        loginLogDao.saveLogOutTime(con);
    }

    @Override
    public int selectErrLoginCount(String userCode) {
        Map<String, Object> con = new HashMap<>();
        con.put("loginStatus", LoginStatus.FAIL.getValue());
        con.put("userCode", userCode);
        // con.put("fiveMinAgo", new Timestamp(System.currentTimeMillis()))
        return loginLogDao.selectErrLoginCount(con);
    }

    @Override
    public UserLoginLogEntity selectLatestLog(String userCode) {
        Map<String, Object> con = new HashMap<>();
        con.put("loginStatus", LoginStatus.SUCCESS.getValue());
        con.put("userCode", userCode);
        return loginLogDao.selectLatestLog(con);
    }

    @Override
    public Boolean isOnline(String sessionId, String userCode) {
        UserLoginLogEntity userLoginLog = selectLatestLog(userCode);
        if (null == userLoginLog) {
            return false;
        }
        return sessionId.equals(userLoginLog.getSessionId());
    }

}
