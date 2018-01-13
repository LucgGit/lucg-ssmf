package com.lucg.ssmf.dao.img.impl;

import com.lucg.ssmf.dao.img.IImgInfoDao;
import com.lucg.ssmf.entity.img.ImgInfoEntity;
import com.lucg.ssmf.util.db.BaseDao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class ImgInfoDaoImpl extends BaseDao<ImgInfoEntity> implements IImgInfoDao {

    public static final String NAMESPACE = "img.";

    @Override
    public List<ImgInfoEntity> queryImgsForType(String imgType) {
        return getSqlSession().selectList(NAMESPACE + "queryImgsForType", imgType);
    }

}
