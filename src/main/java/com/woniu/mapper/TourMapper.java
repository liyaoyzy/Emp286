package com.woniu.mapper;

import com.woniu.pojo.Tour;
import com.woniu.pojo.TourExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TourMapper {
    long countByExample(TourExample example);

    int deleteByExample(TourExample example);

    int deleteByPrimaryKey(Integer tid);

    int insert(Tour record);

    int insertSelective(Tour record);

    List<Tour> selectByExample(TourExample example);

    Tour selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") Tour record, @Param("example") TourExample example);

    int updateByExample(@Param("record") Tour record, @Param("example") TourExample example);

    int updateByPrimaryKeySelective(Tour record);

    int updateByPrimaryKey(Tour record);
}