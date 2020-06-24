package com.woniu.mapper;

import com.woniu.pojo.Emprole;
import com.woniu.pojo.EmproleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EmproleMapper {
    long countByExample(EmproleExample example);

    int deleteByExample(EmproleExample example);

    int deleteByPrimaryKey(Integer erid);

    int insert(Emprole record);

    int insertSelective(Emprole record);

    List<Emprole> selectByExample(EmproleExample example);

    Emprole selectByPrimaryKey(Integer erid);

    int updateByExampleSelective(@Param("record") Emprole record, @Param("example") EmproleExample example);

    int updateByExample(@Param("record") Emprole record, @Param("example") EmproleExample example);

    int updateByPrimaryKeySelective(Emprole record);

    int updateByPrimaryKey(Emprole record);
}