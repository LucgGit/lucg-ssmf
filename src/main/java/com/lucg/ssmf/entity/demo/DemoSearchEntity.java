package com.lucg.ssmf.entity.demo;

import com.lucg.ssmf.entity.user.UserInfoEntity;

public class DemoSearchEntity extends UserInfoEntity {

    private static final long serialVersionUID = 5150328462804389681L;

    private String createStartTime;

    private String createEndTime;

    public String getCreateStartTime() {
        return createStartTime;
    }

    public void setCreateStartTime(String createStartTime) {
        this.createStartTime = createStartTime;
    }

    public String getCreateEndTime() {
        return createEndTime;
    }

    public void setCreateEndTime(String createEndTime) {
        this.createEndTime = createEndTime;
    }

}
