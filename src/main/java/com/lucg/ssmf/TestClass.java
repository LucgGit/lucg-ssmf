package com.lucg.ssmf;

import com.lucg.ssmf.annotations.TableColumn;
import com.lucg.ssmf.entity.user.UserInfoEntity;

import java.lang.reflect.Field;

public class TestClass {

    public static void main(String[] args) {
        try {
            Field field = UserInfoEntity.class.getDeclaredField("userCode");
            System.out.println("field.getName():"+field.getName());
            TableColumn anno = field.getAnnotation(TableColumn.class);
            System.out.println("anno:"+anno.column()+"   "+anno.value());
            
        } catch (NoSuchFieldException e) {
            System.out.println("no such field");
            e.printStackTrace();
        } catch (SecurityException e) {
            e.printStackTrace();
        }

    }

}
