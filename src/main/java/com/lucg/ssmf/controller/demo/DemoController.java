package com.lucg.ssmf.controller.demo;

import com.lucg.ssmf.entity.demo.DemoSearchEntity;
import com.lucg.ssmf.entity.user.UserInfoEntity;
import com.lucg.ssmf.service.demo.IDemoService;
import com.lucg.ssmf.util.db.Limit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("demo")
public class DemoController {

    private static Logger logger = Logger.getLogger(DemoController.class);

    @Autowired
    IDemoService demoService;

    @RequestMapping("main.do")
    public ModelAndView main(HttpServletRequest request, HttpServletResponse response,
            DemoSearchEntity searchCondition, Limit limit) {
        ModelAndView mv = new ModelAndView();
        logger.info("开始查询用户信息。");
        List<UserInfoEntity> userList = demoService.getUserInfo(searchCondition, limit);
        mv.addObject("condition", searchCondition);
        mv.addObject("userList", userList);
        mv.setViewName("/demo/demo.ftl");
        return mv;
    }
}
