package com.woniu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniu.mapper.AddressMapper;
import com.woniu.mapper.AddressimgMapper;
import com.woniu.pojo.*;
import com.woniu.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    AddressMapper addressMapper;
    @Autowired
    AddressimgMapper addressimgMapper;
    /*
     *
     * 单个查询
     * 主键查询
     */
    @Override
    public Address queryAddress(Integer aid) {
        Address address=addressMapper.selectByPrimaryKey(aid);
        Addressimg addressimg=new Addressimg();
                if(address!=null){
                    AddressimgExample example=new AddressimgExample();
                    AddressimgExample.Criteria criteria = example.createCriteria();
                    criteria.andAidEqualTo(address.getAid());
                    List<Addressimg> addressimgList=addressimgMapper.selectByExample(example);
                    addressimg=addressimgList.size()==0?null:addressimgList.get(0);
                    address.setAddressimg(addressimg);
                }

        return address;
    }
    /*
     *分页
     * 查询
     * 根据地址名称查询
     */
    @Override
    public Map<String, Object> listAddress(PageBean pageBean, String address) {
        Map<String,Object> map=new HashMap<>();
        PageHelper.startPage(pageBean.getNowPage(),pageBean.getPageRow());
        AddressExample example=new AddressExample();
        AddressExample.Criteria criteria = example.createCriteria();
        if(address!=null){
            criteria.andAddressLike("%"+address+"%");
        }
        List<Address> addressList=addressMapper.selectByExample(example);
        if (addressList!=null){
            for (Address addre:addressList
            ) {
                Addressimg addressimg=new Addressimg();
                AddressimgExample addressimgExample=new AddressimgExample();
                AddressimgExample.Criteria criteria1 = addressimgExample.createCriteria();
                criteria1.andAidEqualTo(addre.getAid());
                List<Addressimg> addressimgList=addressimgMapper.selectByExample(addressimgExample);
                addressimg=addressimgList.size()==0?null:addressimgList.get(0);
                addre.setAddressimg(addressimg);
            }
        }
        PageInfo<Address>pageInfo=new PageInfo<>(addressList);
        map.put("addressList",addressList);
        map.put("pageInfo",pageInfo);
        return map;
    }

    @Override
    public Map<String, Object> listAddress(String address) {
        Map<String,Object> map=new HashMap<>();
        AddressExample example=new AddressExample();
        AddressExample.Criteria criteria = example.createCriteria();
        if(address!=null){
            criteria.andAddressLike("%"+address+"%");
        }
        List<Address> addressList=addressMapper.selectByExample(example);
       if (addressList!=null){
           for (Address addre:addressList
                ) {
               Addressimg addressimg=new Addressimg();
               AddressimgExample addressimgExample=new AddressimgExample();
               AddressimgExample.Criteria criteria1 = addressimgExample.createCriteria();
               criteria1.andAidEqualTo(addre.getAid());
               List<Addressimg> addressimgList=addressimgMapper.selectByExample(addressimgExample);
               addressimg=addressimgList.size()==0?null:addressimgList.get(0);
               addre.setAddressimg(addressimg);
           }
       }
        map.put("addressList",addressList);
        return map;
    }

    @Override
    public List<Address> listAddress() {
        List<Address> addressList=addressMapper.selectByExample(null);
        return addressList;
    }

    /*
     *
     * 统计
     */
    @Override
    public void countAddress() {

    }
    /*
     *新增数据
     */
    @Override
    public void addAddress(Address address) {
        addressMapper.insert(address);
    }
    /*
     *删除数据
     */
    @Override
    public void removeAddress(Integer aid) {
       addressMapper.deleteByPrimaryKey(aid);
    }

    @Override
    public void removeAddress(List<Integer> aids) {
        AddressExample example=new AddressExample();
        AddressExample.Criteria criteria = example.createCriteria();
        criteria.andAidIn(aids);
        addressMapper.deleteByExample(example);
    }

    /*
     *修改数据
     */
    @Override
    public void updateAddress(Address address) {
        addressMapper.updateByPrimaryKey(address);
    }
}
