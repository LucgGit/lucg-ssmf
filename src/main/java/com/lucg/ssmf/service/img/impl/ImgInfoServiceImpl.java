package com.lucg.ssmf.service.img.impl;

import com.lucg.ssmf.dao.img.IImgInfoDao;
import com.lucg.ssmf.entity.img.ImgInfoEntity;
import com.lucg.ssmf.service.img.IImgInfoService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImgInfoServiceImpl implements IImgInfoService {
    
    @Autowired
    private IImgInfoDao imgInfoDao;

    @Override
    public List<ImgInfoEntity> queryImgsForType(String imgType) {
        return imgInfoDao.queryImgsForType(imgType);
    }

}
