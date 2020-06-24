package com.woniu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniu.mapper.TourMapper;
import com.woniu.mapper.TourimgMapper;
import com.woniu.pojo.*;
import com.woniu.service.TourimgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class TourimgServiceImpl implements TourimgService {

    @Autowired
    TourimgMapper tourimgMapper;
    @Autowired
    TourMapper tourMapper;
    /*
     * 根据景区的id查询照片
     */
    @Override
    public Tourimg queryTourimg(Integer tid) {
        TourimgExample example=new TourimgExample();
        TourimgExample.Criteria criteria = example.createCriteria();
        criteria.andTidEqualTo(tid);
        List<Tourimg> tourimgList=tourimgMapper.selectByExample(example);
        return tourimgList.get(0);
    }

    /*
     * 根据景区的id查询照片
     */
    @Override
    public Map<String,Object>listTourimg(PageBean pageBean,Integer tid) {
        Map<String,Object> map=new HashMap<>();
        TourimgExample example=new TourimgExample();
        TourimgExample.Criteria criteria = example.createCriteria();
        Tour tour=new Tour();
        Set<Integer> tids =new HashSet<>();
        List<Integer> tidsss=new ArrayList<>();
        List<Tourimg> tourimgList=new ArrayList<>();
        if(tid!=null){
            criteria.andTidEqualTo(tid);
            tour=tourMapper.selectByPrimaryKey(tid);
            PageHelper.startPage(pageBean.getNowPage(),pageBean.getPageRow());
            tourimgList=tourimgMapper.selectByExample(example);
        }else {
            List<Tourimg> tourimgList1=tourimgMapper.selectByExample(null);
            for (Tourimg tourimg:tourimgList1
            ) {
                tids.add(tourimg.getTid());
            }
            for (Integer settid:tids
            ) {
                tidsss.add(settid);
            }
            criteria.andTidIn(tidsss);
            PageHelper.startPage(pageBean.getNowPage(),pageBean.getPageRow());
            tourimgList=  tourimgMapper.selectByExample(example);
        }
        for (Tourimg tourimg:tourimgList
        ) {
            tour=tourMapper.selectByPrimaryKey(tourimg.getTid());
            tourimg.setTour(tour);
        }
        PageInfo<Tourimg> pageInfo=new PageInfo<>(tourimgList);
        map.put("pageInfo",pageInfo);
        map.put("tourimgList",tourimgList);
        return map;
    }


    /*
     * 新增照片
     */
    @Override
    public void addTourimg(Tourimg tourimg) {
        tourimgMapper.insert(tourimg);
    }


    /*
     * 修改照片
     */
    @Override
    public void updateTourimg(Tourimg tourimg) {
        tourimgMapper.updateByPrimaryKey(tourimg);
    }
}
