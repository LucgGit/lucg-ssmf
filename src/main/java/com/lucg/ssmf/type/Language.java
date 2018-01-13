package com.lucg.ssmf.type;

public enum Language {

    ZH_CN("zh_CN"),

    EN_US("en_US"),

    JA_JP("ja-JP");

    private String value;

    private Language(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

}
