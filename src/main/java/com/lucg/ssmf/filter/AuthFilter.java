package com.lucg.ssmf.filter;

import com.lucg.ssmf.constant.CommonConst;
import com.lucg.ssmf.constant.RequestUrlConst;
import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.service.login.ILoginLogService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * 权限过滤器
 *
 */
public class AuthFilter implements Filter {

    private List<String> whiteList = null;

    private ILoginLogService loginLogService;

    @Override
    public void destroy() {
        return;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(true);
        // 验证是否在白名单中
        if (whiteList.contains(getTargetURI(request))) {
            chain.doFilter(request, response);
            return;
        }
        // 未登录
        if (!checkLogin(session)) {
            // 跳到登录页面
            response.sendRedirect(request.getContextPath() + RequestUrlConst.REQUEST_INDEX);
            return;
        }
        // 登录失效
        if (!isOnline(session, true)) {
            // 跳到登录失效页面
            response.sendRedirect(request.getContextPath() + RequestUrlConst.REQUEST_RELOGIN);
            return;
        }
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(filterConfig
                .getServletContext());
        loginLogService = (ILoginLogService) applicationContext.getBean("loginLogServiceImpl");

        // 添加白名单
        whiteList = new ArrayList<>();
        whiteList.add("/");
        whiteList.add(RequestUrlConst.REQUEST_INDEX);
        whiteList.add(RequestUrlConst.REQUEST_SHOW_REGIST);
        whiteList.add(RequestUrlConst.REQUEST_REGIST);
        whiteList.add(RequestUrlConst.REQUEST_RELOGIN);
        whiteList.add(RequestUrlConst.REQUEST_QUERY_USER_CODE);

    }

    private String getTargetURI(HttpServletRequest request) {
        String uri = request.getRequestURI();
        uri = uri.substring(uri.indexOf('/', 1));
        int queryParamIndex = uri.indexOf('?');
        if (queryParamIndex > 0) {
            uri = uri.substring(0, queryParamIndex);
        }
        return uri;
    }

    private boolean checkLogin(HttpSession session) {
        return session.getAttribute(CommonConst.SESSION_KEY_LOGIN_USER) != null;
    }

    private boolean isOnline(HttpSession session, boolean isCheckOff) {
        if (isCheckOff) {
            return true;
        }
        UserInfoEntity loginUser = (UserInfoEntity) session.getAttribute(CommonConst.SESSION_KEY_LOGIN_USER);
        return loginLogService.isOnline(session.getId(), loginUser.getUserCode());
    }

}
