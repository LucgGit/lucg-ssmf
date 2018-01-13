package com.lucg.ssmf.controller.forum;

import com.lucg.ssmf.constant.FtlUrlConst;
import com.lucg.ssmf.entity.img.ImgInfoEntity;
import com.lucg.ssmf.service.img.IImgInfoService;
import com.lucg.ssmf.type.ImgType;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("forum")
public class ForumController {

    private static Logger logger = Logger.getLogger(ForumController.class);

    @Autowired
    private IImgInfoService imgInfoService;

    @RequestMapping("main")
    public ModelAndView main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        ModelAndView mv = new ModelAndView();

        // 检索页面显示图片位置等信息
        logger.info("检索页面显示图片位置等信息");
        List<ImgInfoEntity> imgInfoList = imgInfoService.queryImgsForType(ImgType.I001.name());
        mv.addObject("imgInfoList", imgInfoList);

        mv.setViewName(FtlUrlConst.URL_FORUM);
        return mv;
    }

}
