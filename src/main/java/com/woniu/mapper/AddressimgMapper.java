package com.woniu.mapper;

import com.woniu.pojo.Addressimg;
import com.woniu.pojo.AddressimgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressimgMapper {
    long countByExample(AddressimgExample example);

    int deleteByExample(AddressimgExample example);

    int deleteByPrimaryKey(Integer addid);

    int insert(Addressimg record);

    int insertSelective(Addressimg record);

    List<Addressimg> selectByExample(AddressimgExample example);

    Addressimg selectByPrimaryKey(Integer addid);

    int updateByExampleSelective(@Param("record") Addressimg record, @Param("example") AddressimgExample example);

    int updateByExample(@Param("record") Addressimg record, @Param("example") AddressimgExample example);

    int updateByPrimaryKeySelective(Addressimg record);

    int updateByPrimaryKey(Addressimg record);
}