package com.woniu.mapper;

import com.woniu.pojo.Orderpeople;
import com.woniu.pojo.OrderpeopleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderpeopleMapper {
    long countByExample(OrderpeopleExample example);

    int deleteByExample(OrderpeopleExample example);

    int deleteByPrimaryKey(Integer ouid);

    int insert(Orderpeople record);

    int insertSelective(Orderpeople record);

    List<Orderpeople> selectByExample(OrderpeopleExample example);

    Orderpeople selectByPrimaryKey(Integer ouid);

    int updateByExampleSelective(@Param("record") Orderpeople record, @Param("example") OrderpeopleExample example);

    int updateByExample(@Param("record") Orderpeople record, @Param("example") OrderpeopleExample example);

    int updateByPrimaryKeySelective(Orderpeople record);

    int updateByPrimaryKey(Orderpeople record);
}