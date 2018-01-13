package com.lucg.ssmf.entity.img;

import com.lucg.ssmf.util.db.BaseEntity;

import java.io.Serializable;
import java.sql.Timestamp;

public class ImgInfoEntity extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 249698774031657135L;

    private int id;

    private String imgCode;

    private String imgName;

    private String imgType;

    private int imgOrder;

    private String imgPath;

    private String imgRemark;

    private String aosEffect;

    private Timestamp createTime;

    private Timestamp updateTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImgCode() {
        return imgCode;
    }

    public void setImgCode(String imgCode) {
        this.imgCode = imgCode;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getImgType() {
        return imgType;
    }

    public void setImgType(String imgType) {
        this.imgType = imgType;
    }

    public int getImgOrder() {
        return imgOrder;
    }

    public void setImgOrder(int imgOrder) {
        this.imgOrder = imgOrder;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getImgRemark() {
        return imgRemark;
    }

    public void setImgRemark(String imgRemark) {
        this.imgRemark = imgRemark;
    }

    public String getAosEffect() {
        return aosEffect;
    }

    public void setAosEffect(String aosEffect) {
        this.aosEffect = aosEffect;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

}
