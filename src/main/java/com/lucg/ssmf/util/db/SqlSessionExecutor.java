package com.lucg.ssmf.util.db;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;

public class SqlSessionExecutor<T extends BaseEntity> extends SqlSessionTemplate {

    public SqlSessionExecutor(SqlSessionFactory sqlSessionFactory) {
        super(sqlSessionFactory);
    }
    
    public List<T> selectListByLimitNoPage(String statement,
            Object parameter, Limit limit) {
        int offset = limit.getRowStart();
        int pageSize = limit.getPageSize();

        // 设置分页边界，并查询结果集
        RowBounds bound = new RowBounds(offset, pageSize);
        return selectList(statement, parameter, bound);
    }

    /**
     * 根据分页条件，查询结果集
     * 
     * @param statement
     * @param parameter
     * @param rowBounds
     * @param limit
     * @return
     */
    public List<T> selectPage(String statement, Object parameter, Limit limit) {

        // 设置符合条件的结果集总数
        List<T> resultForCount =  super.selectList(statement, parameter);

        Integer resultCount = resultForCount.size();
        int totalCount = resultCount.intValue();
        limit.setTotalRecords(totalCount);

        int offset = limit.getRowStart();
        int pageSize = limit.getPageSize();

        RowBounds bound = null;
        if (totalCount < (offset + pageSize)) {
            bound = new RowBounds(offset, totalCount - offset);
        } else {
            bound = new RowBounds(offset, pageSize);
        }

        // 查询分页内容
        return selectList(statement, parameter, bound);
    }

}
