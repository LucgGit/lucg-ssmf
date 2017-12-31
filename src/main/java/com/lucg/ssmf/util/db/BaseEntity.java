package com.lucg.ssmf.util.db;

public class BaseEntity {

    /**
     * 当前Sql查询记录总数
     */
    private Integer totalCount;

    /**
     * 返回当前Sql查询记录总数
     * 
     * @return
     */
    public Integer getTotalCount() {
        return totalCount;
    }

    /**
     * 设置当前Sql查询记录总数
     * 
     * @param totalCount
     */
    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }
}
