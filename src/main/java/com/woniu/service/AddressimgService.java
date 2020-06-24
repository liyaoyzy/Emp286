package com.woniu.service;

import com.woniu.pojo.Address;
import com.woniu.pojo.Addressimg;
import com.woniu.pojo.PageBean;


import java.util.Map;

public interface AddressimgService {
    /*
     *
     * 查询单个 照片
     * 根据地址的id查询照片
     *
     */
    Addressimg queryAddressimg(Integer aid);


    /*
     * 根据地址的id查询照片
     */
    Map<String,Object> listAddressimg(Integer aid, PageBean pageBean);


    Map<String,Object> listAddressimg(Integer aid);

    /*
     *新增数据
     */
    void addAddressimg(Addressimg addressimg);

    /*
     *修改数据
     */
    void updateAddressimg(Addressimg addressimg);
}
