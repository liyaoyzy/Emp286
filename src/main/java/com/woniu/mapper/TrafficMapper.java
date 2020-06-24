package com.woniu.mapper;

import com.woniu.pojo.Traffic;
import com.woniu.pojo.TrafficExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TrafficMapper {
    long countByExample(TrafficExample example);

    int deleteByExample(TrafficExample example);

    int deleteByPrimaryKey(Integer trid);

    int insert(Traffic record);

    int insertSelective(Traffic record);

    List<Traffic> selectByExample(TrafficExample example);

    Traffic selectByPrimaryKey(Integer trid);

    int updateByExampleSelective(@Param("record") Traffic record, @Param("example") TrafficExample example);

    int updateByExample(@Param("record") Traffic record, @Param("example") TrafficExample example);

    int updateByPrimaryKeySelective(Traffic record);

    int updateByPrimaryKey(Traffic record);
}