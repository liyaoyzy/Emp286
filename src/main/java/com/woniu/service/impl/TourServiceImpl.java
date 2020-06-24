package com.woniu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniu.mapper.AddressMapper;
import com.woniu.mapper.TourMapper;
import com.woniu.mapper.TourimgMapper;
import com.woniu.pojo.*;
import com.woniu.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TourServiceImpl implements TourService {

    @Autowired
    TourMapper tourMapper;
    @Autowired
    AddressMapper addressMapper;
    @Autowired
    TourimgMapper tourimgMapper;
    /*
     *
     * 单个查询
     * 主键查询
     */
    @Override
    public Tour queryTour(Integer tid) {
        Tour tour=tourMapper.selectByPrimaryKey(tid);
        Tourimg tourimg=new Tourimg();
        if(tour!=null) {
            TourimgExample tourimgExample = new TourimgExample();
            TourimgExample.Criteria criteria1 = tourimgExample.createCriteria();
            criteria1.andTidEqualTo(tour.getTid());
            List<Tourimg> tourimgList = tourimgMapper.selectByExample(tourimgExample);
            tourimg = tourimgList.size() == 0 ? null : tourimgList.get(0);
            tour.setTourimg(tourimg);
            Address address = addressMapper.selectByPrimaryKey(tour.getAid());
            tour.setAddress(address);
        }
        return tour;
    }

    /*
     *分页
     * 查询
     * 根据地址名称查询
     */
    @Override
    public Map<String, Object> listTour(PageBean pageBean, Integer aid) {
        Map<String,Object> map=new HashMap<>();
        PageHelper.startPage(pageBean.getNowPage(),pageBean.getPageRow());
        TourExample example=new TourExample();
        TourExample.Criteria criteria = example.createCriteria();
        if (aid!=null){
          criteria.andAidEqualTo(aid);
        }
        List<Tour> tourList=tourMapper.selectByExample(example);
        for (Tour t:tourList
        ) {
            Tourimg tourimg=new Tourimg();
            TourimgExample tourimgExample=new TourimgExample();
            TourimgExample.Criteria criteria1 = tourimgExample.createCriteria();
            criteria1.andTidEqualTo(t.getTid());
            List<Tourimg> tourimgList  =  tourimgMapper.selectByExample(tourimgExample);
            tourimg=tourimgList.size()==0?null:tourimgList.get(0);
            t.setTourimg(tourimg);
        }
        PageInfo<Tour> pageInfo=new PageInfo<>(tourList);
        map.put("tourList",tourList);
        map.put("pageInfo",pageInfo);
        return map;
    }

    @Override
    public Map<String, Object> listTour(Integer aid) {
        Map<String,Object> map=new HashMap<>();
        TourExample example=new TourExample();
        TourExample.Criteria criteria = example.createCriteria();
        if (aid!=null){
            criteria.andAidEqualTo(aid);
        }
        List<Tour> tourList=tourMapper.selectByExample(example);
        for (Tour t:tourList
             ) {
            Tourimg tourimg=new Tourimg();
            TourimgExample tourimgExample=new TourimgExample();
            TourimgExample.Criteria criteria1 = tourimgExample.createCriteria();
            criteria1.andTidEqualTo(t.getTid());
            List<Tourimg> tourimgList  =  tourimgMapper.selectByExample(tourimgExample);
            tourimg=tourimgList.size()==0?null:tourimgList.get(0);
            t.setTourimg(tourimg);
        }
        map.put("tourList",tourList);
        return map;
    }


    /*
     *不分页
     * 查询所有
     * 做下拉菜单
     */
    @Override
    public List<Tour> listTour() {
        List<Tour> tourList=tourMapper.selectByExample(null);
        return tourList;
    }


    /*
     *
     * 统计
     */
    @Override
    public void countTour() {

    }


    /*
     *新增数据
     */
    @Override
    public void addTour(Tour tour) {
        tourMapper.insert(tour);
    }



    /*
     *删除数据
     */
    @Override
    public void removeTour(Integer tid) {
        tourMapper.deleteByPrimaryKey(tid);
    }
    /*
     *批量删除数据
     */
    @Override
    public void removeTour(List<Integer> tids) {
        TourExample example=new TourExample();
        TourExample.Criteria criteria = example.createCriteria();
        criteria.andTidIn(tids);
        tourMapper.deleteByExample(example);
    }


    /*
     *修改数据
     */
    @Override
    public void updateTour(Tour tour) {
        tourMapper.updateByPrimaryKey(tour);
    }
}
