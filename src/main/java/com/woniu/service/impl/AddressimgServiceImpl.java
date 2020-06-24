package com.woniu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniu.mapper.AddressMapper;
import com.woniu.mapper.AddressimgMapper;
import com.woniu.pojo.Address;
import com.woniu.pojo.Addressimg;
import com.woniu.pojo.AddressimgExample;
import com.woniu.pojo.PageBean;
import com.woniu.service.AddressService;
import com.woniu.service.AddressimgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AddressimgServiceImpl implements AddressimgService {

    @Autowired
    AddressimgMapper addressimgMapper;
    @Autowired
    AddressMapper addressMapper;

    /*
     * 根据地址的id查询照片
     * 然后选择一个展示
     */
    @Override
    public Addressimg queryAddressimg(Integer aid) {
        AddressimgExample example=new AddressimgExample();
        AddressimgExample.Criteria criteria = example.createCriteria();
        criteria.andAidEqualTo(aid);
        Address address=addressMapper.selectByPrimaryKey(aid);
        List<Addressimg> addressimgList=addressimgMapper.selectByExample(example);
        addressimgList.get(0).setAddress(address);
        return addressimgList.get(0);
    }

    /*
     * 根据地址的id查询照片
     */
    @Override
    public Map<String,Object> listAddressimg(Integer aid, PageBean pageBean) {
        Map<String,Object> map=new HashMap<>();
        AddressimgExample example=new AddressimgExample();
        AddressimgExample.Criteria criteria = example.createCriteria();
        Address address=new Address();
        Set<Integer> aids =new HashSet<>();
        List<Integer> aidsss=new ArrayList<>();
        List<Addressimg> addressimgList=new ArrayList<>();
        if(aid!=null){
            criteria.andAidEqualTo(aid);
            address=addressMapper.selectByPrimaryKey(aid);
            PageHelper.startPage(pageBean.getNowPage(),pageBean.getPageRow());
            addressimgList=addressimgMapper.selectByExample(example);
        }else {
            List<Addressimg> addressimgList1=addressimgMapper.selectByExample(null);
            for (Addressimg addre:addressimgList1
                 ) {
                aids.add(addre.getAid());
            }
            for (Integer setaisd:aids
                 ) {
                aidsss.add(setaisd);
            }
            criteria.andAidIn(aidsss);
            PageHelper.startPage(pageBean.getNowPage(),pageBean.getPageRow());
            addressimgList=  addressimgMapper.selectByExample(example);
        }
        for (Addressimg addressimg:addressimgList
             ) {
            address=addressMapper.selectByPrimaryKey(addressimg.getAid());
            addressimg.setAddress(address);
        }
        PageInfo<Addressimg> pageInfo=new PageInfo<>(addressimgList);
        map.put("pageInfo",pageInfo);
        map.put("addressimgList",addressimgList);
        return map;
    }

    @Override
    public Map<String, Object> listAddressimg(Integer aid) {
        Map<String,Object> map=new HashMap<>();
        AddressimgExample example=new AddressimgExample();
        AddressimgExample.Criteria criteria = example.createCriteria();
        Address address=new Address();
        Set<Integer> aids =new HashSet<>();
        List<Integer> aidsss=new ArrayList<>();
        List<Addressimg> addressimgList=new ArrayList<>();
        if(aid!=null){
            criteria.andAidEqualTo(aid);
            address=addressMapper.selectByPrimaryKey(aid);
            addressimgList=addressimgMapper.selectByExample(example);
        }else {
            List<Addressimg> addressimgList1=addressimgMapper.selectByExample(null);
            for (Addressimg addre:addressimgList1
            ) {
                aids.add(addre.getAid());
            }
            for (Integer setaisd:aids
            ) {
                aidsss.add(setaisd);
            }
            criteria.andAidIn(aidsss);
            addressimgList=  addressimgMapper.selectByExample(example);
        }
        for (Addressimg addressimg:addressimgList
        ) {
            address=addressMapper.selectByPrimaryKey(addressimg.getAid());
            addressimg.setAddress(address);
        }
        map.put("addressimgList",addressimgList);
        return map;
    }


    /*
     * 新增照片
     */
    @Override
    public void addAddressimg(Addressimg addressimg) {
        addressimgMapper.insert(addressimg);
    }


    /*
     * 修改照片
     */
    @Override
    public void updateAddressimg(Addressimg addressimg) {
        addressimgMapper.updateByPrimaryKey(addressimg);
    }
}
