package com.woniu.service;


import com.woniu.pojo.PageBean;
import com.woniu.pojo.Tour;

import java.util.List;
import java.util.Map;

public interface TourService {


    /*
     *
     * 单个查询
     * 主键查询
     */
    Tour queryTour(Integer tid);

    /*
     *分页
     * 查询
     * 根据地址名称查询
     */
    Map<String,Object> listTour(PageBean pageBean, Integer aid);


    /*
     * 查询
     * 根据地址名称查询
     */
    Map<String,Object> listTour( Integer aid);
    /*
     *不分页
     * 查询所有
     * 做下拉菜单
     */
    List<Tour> listTour();

    /*
     *
     * 统计
     */
    void countTour();


    /*
     *新增数据
     */
    void addTour(Tour tour);


    /*
     *删除单个数据
     */
    void removeTour(Integer tid);

    /*
     *批量删除数据
     */
    void removeTour(List<Integer> tids);


    /*
     *修改数据
     */
    void updateTour(Tour tour);
}
