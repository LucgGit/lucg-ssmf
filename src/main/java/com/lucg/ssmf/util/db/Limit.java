package com.lucg.ssmf.util.db;

import java.io.Serializable;

import org.springframework.util.StringUtils;

public class Limit implements Serializable {

    private static final long serialVersionUID = 7713581775092883255L;

    /**
     * 开始行
     */
    private int rowStart;

    /**
     * 结束行
     */
    private int rowEnd;

    /**
     * 总条数
     */
    private int totalRecords;

    /**
     * 每页大小
     */
    private int pageSize = 10;

    /**
     * 当前页
     */
    private int currentPage = 1;

    /**
     * 总页数
     */
    @SuppressWarnings("unused")
    private int pageCount;

    /**
     * 返回总共多少页
     * 
     * @return
     */
    public int getPageCount() {
        return (int) Math.ceil((double) totalRecords / pageSize);
    }

    /**
     * 分页大小，默认为10条
     * 
     * @return
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置分页大小，如果为空则默认为10条
     * 
     * @param pageSize
     */
    public void setPageSize(String pageSize) {
        if (StringUtils.isEmpty(pageSize)) {
            this.pageSize = 10;
        } else {
            this.pageSize = Integer.parseInt(pageSize);
        }
    }

    /**
     * 获取当前页
     * 
     * @return
     */
    public int getCurrentPage() {
        return currentPage;
    }

    /**
     * 设置当前页，如果为空则默认为当前页为第一页
     * 
     * @param currentPage
     */
    public void setCurrentPage(String currentPage) {
        if (StringUtils.isEmpty(currentPage)) {
            this.currentPage = 1;
        } else {
            this.currentPage = Integer.parseInt(currentPage);
        }
    }

    /**
     * 获取当前页开始行
     * 
     * @return
     */
    public int getRowStart() {
        rowStart = (currentPage - 1) * pageSize;
        return rowStart;
    }

    /**
     * 获取当前页结束行
     * 
     * @return
     */
    public int getRowEnd() {
        rowEnd = currentPage * pageSize;
        return rowEnd;
    }

    public void setRowEnd(int rowEnd) {
        this.rowEnd = rowEnd;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public void setRowStart(int rowStart) {
        this.rowStart = rowStart;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
}
