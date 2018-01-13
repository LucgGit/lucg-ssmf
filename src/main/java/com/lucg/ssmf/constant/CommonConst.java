package com.lucg.ssmf.constant;

public class CommonConst {

    private CommonConst() {
    }

    // 保存在session中的登录用户信息key
    public static final String SESSION_KEY_LOGIN_USER = "loginUser";

    // 密码md5加密key
    public static final String MD5_ENCODE_TOKEN = "21a858q1s8s4ada2dxzc21asd";

    // 允许登录失败次数
    public static final int ERR_COUNT = 5;

    // 保存在session中的语言信息key
    public static final String SESSION_KEY_LANGUAGE = "language";

}
