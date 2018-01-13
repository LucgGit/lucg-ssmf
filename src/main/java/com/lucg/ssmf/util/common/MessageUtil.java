package com.lucg.ssmf.util.common;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.context.NoSuchMessageException;
import org.springframework.web.servlet.support.RequestContext;

public class MessageUtil {
    
    private static Logger logger = Logger.getLogger(MessageUtil.class);

    private MessageUtil() {
    }

    public static String getMessage(HttpServletRequest request, String code, Object... obj) {
        RequestContext rc = new RequestContext(request);
        String message;
        try {
            message = rc.getMessage(code, obj);
        } catch (NoSuchMessageException ex) {
            logger.error("Message not found.[Messgae Code] : " + code);
            message = "";
        }
        return message;
    }
}
