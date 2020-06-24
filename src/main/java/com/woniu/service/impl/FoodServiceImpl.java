package com.woniu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniu.mapper.FoodMapper;
import com.woniu.pojo.Food;
import com.woniu.pojo.FoodExample;
import com.woniu.pojo.PageBean;
import com.woniu.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class FoodServiceImpl  implements FoodService {

    /*
     *
     * 单个查询
     * 主键查询
     */

    @Autowired
    FoodMapper foodMapper;
    @Override
    public Food queryFood(Integer fid) {
        Food food=foodMapper.selectByPrimaryKey(fid);
        return food;
    }



    /*
     *不分页
     * 查询所有
     * 做下拉菜单
     */
    @Override
    public List<Food> listFood() {
        List<Food> foodList=foodMapper.selectByExample(null);
        return foodList;
    }

    /*
     *
     * 分页
     * 查询
     * 根据饮食名称查询
     */
    @Override
    public Map<String ,Object>listFood(PageBean pageBean,String fname) {
        Map<String,Object> map=new HashMap<>();
        PageHelper.startPage(pageBean.getNowPage(),pageBean.getPageRow());
        FoodExample example=new FoodExample();
        FoodExample.Criteria criteria = example.createCriteria();

        if (fname!=null){
            criteria.andFnameLike("%"+fname+"%");
        }
        List<Food> foodList=foodMapper.selectByExample(example);
        PageInfo<Food> pageInfo=new PageInfo<>(foodList);
        map.put("foodList",foodList);
        map.put("pageInfo",pageInfo);
        return map;
    }
    /*
     *统计
     */
    @Override
    public void countFood() {

    }
    /*
     *
     * 新增数据
     */
    @Override
    public void addFood(Food food) {
        foodMapper.insert(food);
    }
    /*
     *
     * 删除数据
     */
    @Override
    public void removeFood(Integer fid) {
        foodMapper.deleteByPrimaryKey(fid);
    }


    /*
     *
     * 批量数据
     */
    @Override
    public void removeFood(List<Integer> fids) {
        FoodExample example=new FoodExample();
        FoodExample.Criteria criteria = example.createCriteria();
        criteria.andFidIn(fids);
        foodMapper.deleteByExample(example);
    }

    /*
     *
     * 修改数据
     */
    @Override
    public void updateFood(Food food) {
        foodMapper.updateByPrimaryKey(food);
    }
}