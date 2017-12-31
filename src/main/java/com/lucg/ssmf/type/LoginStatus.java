package com.lucg.ssmf.type;

public enum LoginStatus {

    SUCCESS("0"),

    FAIL("1");

    private String value;

    private LoginStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
