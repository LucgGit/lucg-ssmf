package com.lucg.ssmf.dao.demo.impl;

import com.lucg.ssmf.dao.demo.IDemoDao;
import com.lucg.ssmf.entity.user.UserInfoEntity;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" })
public class DemoDaoImplTest extends AbstractJUnit4SpringContextTests {

    private static Logger logger = Logger.getLogger(DemoDaoImplTest.class);

    @Autowired
    IDemoDao demoDao;

    @Test
    public void test1() {
        List<UserInfoEntity> userInfoList = demoDao.getUserInfo(new UserInfoEntity());
        System.out.println("JUnit测试结果：" + userInfoList);
        logger.info("JUnit测试结果：" + userInfoList);
    }

}
