package com.lucg.ssmf.controller.addition;

import com.lucg.ssmf.constant.FtlUrlConst;
import com.lucg.ssmf.entity.img.ImgInfoEntity;
import com.lucg.ssmf.service.img.IImgInfoService;
import com.lucg.ssmf.type.ImgType;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class AboutController {

    @Autowired
    private IImgInfoService imgInfoService;

    @RequestMapping("about.do")
    public ModelAndView about() {
        ModelAndView mv = new ModelAndView();

        // 检索页面显示图片位置等信息
        List<ImgInfoEntity> imgInfoList = imgInfoService.queryImgsForType(ImgType.I001.name());
        mv.addObject("imgInfoList", imgInfoList);

        mv.setViewName(FtlUrlConst.URL_ABOUT);
        return mv;
    }
}
