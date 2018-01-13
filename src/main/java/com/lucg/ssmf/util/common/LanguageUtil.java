package com.lucg.ssmf.util.common;

import com.lucg.ssmf.constant.CommonConst;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

public class LanguageUtil {

    private LanguageUtil() {
    }

    public static void setLanguage(HttpServletRequest request, HttpServletResponse response, String locale) {
        // 设置locale
        LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
        if (localeResolver == null) {
            throw new IllegalStateException("No LocaleResolver found.");
        }
        LocaleEditor localeEditor = new LocaleEditor();
        localeEditor.setAsText(locale);
        localeResolver.setLocale(request, response, (Locale) localeEditor.getValue());
        // 将语言信息放入session
        request.getSession().setAttribute(CommonConst.SESSION_KEY_LANGUAGE, locale);
    }

}
