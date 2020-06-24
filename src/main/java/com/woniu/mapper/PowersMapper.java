package com.woniu.mapper;

import com.woniu.pojo.Powers;
import com.woniu.pojo.PowersExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PowersMapper {
    long countByExample(PowersExample example);

    int deleteByExample(PowersExample example);

    int deleteByPrimaryKey(Integer pid);

    int insert(Powers record);

    int insertSelective(Powers record);

    List<Powers> selectByExample(PowersExample example);

    Powers selectByPrimaryKey(Integer pid);

    int updateByExampleSelective(@Param("record") Powers record, @Param("example") PowersExample example);

    int updateByExample(@Param("record") Powers record, @Param("example") PowersExample example);

    int updateByPrimaryKeySelective(Powers record);

    int updateByPrimaryKey(Powers record);
}