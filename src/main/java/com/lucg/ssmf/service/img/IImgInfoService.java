package com.lucg.ssmf.service.img;

import com.lucg.ssmf.entity.img.ImgInfoEntity;

import java.util.List;

public interface IImgInfoService {

    /**
     * 检索某一分类下的所有图片。
     * 
     * @param imgType String
     * @return List
     */
    List<ImgInfoEntity> queryImgsForType(String imgType);
}
