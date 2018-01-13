package com.lucg.ssmf.controller.login;

import com.lucg.ssmf.constant.CommonConst;
import com.lucg.ssmf.constant.FtlUrlConst;
import com.lucg.ssmf.constant.MessageConst;
import com.lucg.ssmf.constant.RequestUrlConst;
import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.entity.user.UserLoginLogEntity;
import com.lucg.ssmf.service.login.ILoginLogService;
import com.lucg.ssmf.service.login.ILoginService;
import com.lucg.ssmf.type.LoginStatus;
import com.lucg.ssmf.util.common.LanguageUtil;
import com.lucg.ssmf.util.common.MessageUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/")
public class LoginController {

    private static Logger logger = Logger.getLogger(LoginController.class);

    @Autowired
    ILoginService loginService;

    @Autowired
    ILoginLogService loginLogService;

    @RequestMapping("index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        ModelAndView mv = new ModelAndView();

        // 根据本机环境设置默认语言信息
        if (null == session.getAttribute(CommonConst.SESSION_KEY_LANGUAGE)) {
            String locale = request.getLocale().toString();
            LanguageUtil.setLanguage(request, response, locale);
        }

        UserInfoEntity loginUser = (UserInfoEntity) session.getAttribute(CommonConst.SESSION_KEY_LOGIN_USER);

        // ----------已登录----------
        if (null != loginUser) {
            logger.info("该用户已经登录，跳转下一页面，用户名：" + loginUser.getUserName());
            mv = new ModelAndView(new RedirectView(request.getContextPath() + RequestUrlConst.REQUEST_MAIN));
            return mv;
        }

        // ----------进入登录页面----------
        if ("GET".equalsIgnoreCase(request.getMethod())) {
            mv.setViewName(FtlUrlConst.URL_INDEX);
            return mv;
        }

        // ----------登录操作----------
        String userCode = request.getParameter("userCode");
        String userPwd = request.getParameter("userPwd");
        // 验证输入参数
        if (StringUtils.isEmpty(userCode) || StringUtils.isEmpty(userPwd)) {
            mv.setViewName(FtlUrlConst.URL_INDEX);
            return mv;
        }
        // 账户封锁
        if (loginLogService.selectErrLoginCount(userCode) > CommonConst.ERR_COUNT) {
            mv.addObject("errorMsg", MessageUtil.getMessage(request, MessageConst.MSG_LOGIN_001, CommonConst.ERR_COUNT));
            mv.setViewName(FtlUrlConst.URL_INDEX);
            return mv;
        }
        // 查询账户信息
        Md5PasswordEncoder md5 = new Md5PasswordEncoder();
        String md5password = md5.encodePassword(CommonConst.MD5_ENCODE_TOKEN, userPwd);
        UserInfoEntity userInfo = new UserInfoEntity();
        userInfo.setUserCode(userCode);
        userInfo.setUserPwd(md5password);
        UserInfoEntity user = loginService.findUserByPassword(userInfo);
        if (user != null) {
            // 找到用户后，放入session
            request.getSession().setAttribute(CommonConst.SESSION_KEY_LOGIN_USER, user);
            // 保存用户登录成功日志
            loginLogService.saveLoginLog(createLoginLog(request, session, user, LoginStatus.SUCCESS));
            // 跳转页面
            mv = new ModelAndView(new RedirectView(request.getContextPath() + RequestUrlConst.REQUEST_MAIN));
            return mv;
        }
        // 保存用户登录失败日志
        loginLogService.saveLoginLog(createLoginLog(request, session, userInfo, LoginStatus.FAIL));
        // 登录验证失败
        mv.addObject("errorMsg", MessageUtil.getMessage(request, MessageConst.MSG_LOGIN_002, CommonConst.ERR_COUNT));
        mv.setViewName(FtlUrlConst.URL_INDEX);
        return mv;
    }

    @RequestMapping("logout")
    public ModelAndView logout(HttpServletRequest request, HttpSession session) {
        removeSession(session);
        return new ModelAndView(new RedirectView(request.getContextPath() + RequestUrlConst.REQUEST_INDEX));
    }

    @RequestMapping("showRegist")
    public ModelAndView showRegist(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName(FtlUrlConst.URL_REGIST);
        return mv;
    }

    @RequestMapping(value = "regist", method = RequestMethod.GET)
    @ResponseBody
    public String regist(HttpServletRequest request, HttpSession session, UserInfoEntity user) {
        try {
            Md5PasswordEncoder md5 = new Md5PasswordEncoder();
            String md5password = md5.encodePassword(CommonConst.MD5_ENCODE_TOKEN, user.getUserPwd());
            user.setUserPwd(md5password);
            loginService.regist(user);
        } catch (Exception ex) {
            logger.error("用户注册失败：" + ex.getMessage());
            return "";
        }
        return "1";
    }

    @RequestMapping("reLogin")
    public ModelAndView reLogin(HttpServletRequest request, HttpSession session) {
        removeSession(session);
        ModelAndView mv = new ModelAndView();
        mv.setViewName(FtlUrlConst.URL_RELOGIN);
        return mv;
    }

    @RequestMapping(value = "queryUserCode", method = RequestMethod.GET)
    @ResponseBody
    public int queryUserCode(HttpServletRequest request, HttpSession session, String userCode) {
        return loginService.queryUserCount(userCode);
    }

    private void removeSession(HttpSession session) {
        if (session.getAttribute(CommonConst.SESSION_KEY_LOGIN_USER) != null) {
            // 记录登出时间
            loginLogService.saveLogOutTime(session.getId());
            session.removeAttribute(CommonConst.SESSION_KEY_LOGIN_USER);
            session.invalidate();
        }
    }

    private UserLoginLogEntity createLoginLog(HttpServletRequest request, HttpSession session, UserInfoEntity user,
            LoginStatus loginStatus) {
        UserLoginLogEntity loginLog = new UserLoginLogEntity();
        loginLog.setUserCode(user.getUserCode());
        loginLog.setUserName(user.getUserName());
        loginLog.setUserIp(request.getRemoteAddr());
        loginLog.setSessionId(session.getId());
        loginLog.setLoginStatus(loginStatus.getValue());
        return loginLog;
    }

}
