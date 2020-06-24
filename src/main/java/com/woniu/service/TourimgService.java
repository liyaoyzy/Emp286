package com.woniu.service;


import com.woniu.pojo.PageBean;
import com.woniu.pojo.Tour;
import com.woniu.pojo.Tourimg;

import java.util.List;
import java.util.Map;


public interface TourimgService {

    /*
     *
     * 单个查询
     * 主键查询
     */
    Tourimg queryTourimg(Integer tid);


    /*
     *不分页
     * 查询所有
     * 做下拉菜单
     */
    Map<String,Object> listTourimg(PageBean pageBean,Integer tid);


    /*
     *新增数据
     */
    void addTourimg(Tourimg tourimg);

    /*
     *修改数据
     */
    void updateTourimg(Tourimg tourimg);

}
