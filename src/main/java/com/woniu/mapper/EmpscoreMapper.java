package com.woniu.mapper;

import com.woniu.pojo.Empscore;
import com.woniu.pojo.EmpscoreExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpscoreMapper {
    long countByExample(EmpscoreExample example);

    int deleteByExample(EmpscoreExample example);

    int deleteByPrimaryKey(Integer sid);

    int insert(Empscore record);

    int insertSelective(Empscore record);

    List<Empscore> selectByExample(EmpscoreExample example);

    Empscore selectByPrimaryKey(Integer sid);

    int updateByExampleSelective(@Param("record") Empscore record, @Param("example") EmpscoreExample example);

    int updateByExample(@Param("record") Empscore record, @Param("example") EmpscoreExample example);

    int updateByPrimaryKeySelective(Empscore record);

    int updateByPrimaryKey(Empscore record);
}