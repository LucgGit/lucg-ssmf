package com.lucg.ssmf.dao.img;

import com.lucg.ssmf.entity.img.ImgInfoEntity;

import java.util.List;

public interface IImgInfoDao {

    /**
     * 检索某一分类下的所有图片。
     * 
     * @param imgType String
     * @return List
     */
    List<ImgInfoEntity> queryImgsForType(String imgType);
}
