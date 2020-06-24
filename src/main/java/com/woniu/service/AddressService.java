package com.woniu.service;

import com.woniu.pojo.Address;
import com.woniu.pojo.PageBean;

import java.util.List;
import java.util.Map;

public interface AddressService {


    /*
     *
     * 单个查询
     * 主键查询
     */
    Address queryAddress(Integer aid);

    /*
     *分页
     * 查询
     * 根据地址名称查询
     */
    Map<String,Object> listAddress(PageBean pageBean, String address);

    /*
     *分页
     * 查询
     * 根据地址名称查询
     */
    Map<String,Object> listAddress( String address);


    /*
     *不分页
     * 查询所有
     * 做下拉菜单
     */
    List<Address> listAddress();

    /*
     *
     * 统计
     */
    void countAddress();


    /*
     *新增数据
     */
    void addAddress(Address address);


    /*
     *删除数据
     */
    void removeAddress(Integer aid);

    /*
     *批量删除数据
     */
    void removeAddress(List<Integer> aids);

    /*
     *修改数据
     */
    void updateAddress(Address address);
}