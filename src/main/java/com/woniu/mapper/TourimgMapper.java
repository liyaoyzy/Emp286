package com.woniu.mapper;

import com.woniu.pojo.Tourimg;
import com.woniu.pojo.TourimgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TourimgMapper {
    long countByExample(TourimgExample example);

    int deleteByExample(TourimgExample example);

    int deleteByPrimaryKey(Integer imgid);

    int insert(Tourimg record);

    int insertSelective(Tourimg record);

    List<Tourimg> selectByExample(TourimgExample example);

    Tourimg selectByPrimaryKey(Integer imgid);

    int updateByExampleSelective(@Param("record") Tourimg record, @Param("example") TourimgExample example);

    int updateByExample(@Param("record") Tourimg record, @Param("example") TourimgExample example);

    int updateByPrimaryKeySelective(Tourimg record);

    int updateByPrimaryKey(Tourimg record);
}