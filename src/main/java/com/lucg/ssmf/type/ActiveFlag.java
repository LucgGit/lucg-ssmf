package com.lucg.ssmf.type;

public enum ActiveFlag {

    ACTIVE("1"),

    INACTIVE("0");

    private String value;

    private ActiveFlag(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

}
