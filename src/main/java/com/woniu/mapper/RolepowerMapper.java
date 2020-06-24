package com.woniu.mapper;

import com.woniu.pojo.Rolepower;
import com.woniu.pojo.RolepowerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RolepowerMapper {
    long countByExample(RolepowerExample example);

    int deleteByExample(RolepowerExample example);

    int deleteByPrimaryKey(Integer rpid);

    int insert(Rolepower record);

    int insertSelective(Rolepower record);

    List<Rolepower> selectByExample(RolepowerExample example);

    Rolepower selectByPrimaryKey(Integer rpid);

    int updateByExampleSelective(@Param("record") Rolepower record, @Param("example") RolepowerExample example);

    int updateByExample(@Param("record") Rolepower record, @Param("example") RolepowerExample example);

    int updateByPrimaryKeySelective(Rolepower record);

    int updateByPrimaryKey(Rolepower record);
}