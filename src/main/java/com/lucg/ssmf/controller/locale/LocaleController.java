package com.lucg.ssmf.controller.locale;

import com.lucg.ssmf.util.common.LanguageUtil;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.CharEncoding;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("locale")
public class LocaleController {

    private static Logger logger = Logger.getLogger(LocaleController.class);

    @RequestMapping(value = "change", method = RequestMethod.POST)
    public void setSession(HttpServletRequest request, HttpServletResponse response, @RequestParam String locale) {
        logger.info("开始切换语言");
        String msg = "";

        try {
            LanguageUtil.setLanguage(request, response, locale);
            msg = "Change Language Success!";
            logger.info("切换语言成功：" + locale);
        } catch (Exception ex) {
            msg = "error";
            logger.error("切换语言失败" + ex.getMessage());
        }
        response.setCharacterEncoding(CharEncoding.UTF_8);

        try {
            response.getWriter().print(msg);
        } catch (IOException e) {
            logger.error("切换语言失败" + e.getMessage());
        }

    }

}
