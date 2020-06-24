package com.woniu.mapper;

import com.woniu.pojo.Rec;
import com.woniu.pojo.RecExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RecMapper {
    long countByExample(RecExample example);

    int deleteByExample(RecExample example);

    int deleteByPrimaryKey(Integer recid);

    int insert(Rec record);

    int insertSelective(Rec record);

    List<Rec> selectByExample(RecExample example);

    Rec selectByPrimaryKey(Integer recid);

    int updateByExampleSelective(@Param("record") Rec record, @Param("example") RecExample example);

    int updateByExample(@Param("record") Rec record, @Param("example") RecExample example);

    int updateByPrimaryKeySelective(Rec record);

    int updateByPrimaryKey(Rec record);
}