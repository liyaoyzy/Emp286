package com.woniu.service;

import com.woniu.pojo.Food;
import com.woniu.pojo.PageBean;

import java.util.List;
import java.util.Map;

public interface FoodService {

    /*
     *
     * 单个查询
     * 主键查询
     */
    Food queryFood(Integer fid);


    /*
     *不分页
     * 查询所有
     * 做下拉菜单
     */
    List<Food> listFood();

    /*
     *分页
     * 查询
     * 根据地址名称查询
     */
    Map<String,Object> listFood(PageBean pageBean,String fname);

    /*
     *
     * 统计
     */
    void countFood();


    /*
     *新增数据
     */
   void addFood(Food food);

    /*
     *删除数据
     */
    void removeFood(Integer fid);

    /*
     *批量删除数据
     */
    void removeFood(List<Integer> fids);

    /*
     *修改数据
     */
    void updateFood(Food food);
}