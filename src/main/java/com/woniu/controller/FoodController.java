package com.woniu.controller;

import com.github.pagehelper.PageInfo;
import com.woniu.pojo.Food;
import com.woniu.pojo.PageBean;
import com.woniu.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("food")
public class FoodController {

    @Autowired
    FoodService foodService;

    @RequestMapping("list")
    public String FoodList() {
        return "WEB-INF/food/foodList";
    }

    /*
     * 分页查询
     */
    @ResponseBody
    @RequestMapping("paginationFood")
    public Map<String, Object> FoodPagination(PageBean pageBean, String fname) {
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map1 = foodService.listFood(pageBean, fname);
        List<Food> foodList = (List<Food>) map1.get("foodList");
        PageInfo<Food> pageInfo = (PageInfo<Food>) map1.get("pageInfo");
        pageBean.setCountPage(pageInfo.getPages());
        pageBean.setCountRow((int) pageInfo.getTotal());
        map.put("pageBean", pageBean);
        map.put("foodList", foodList);
        try {
            if (foodList != null) {
                map.put("result", true);
            }
        } catch (Exception e) {
            map.put("result", false);
            e.printStackTrace();
        }
        return map;
    }

    /*
     * 查询所有
     * 做下拉菜单
     *
     * */
    @ResponseBody
    @RequestMapping("foodlist")
    public Map<String,Object>foodMenu() {
        Map<String, Object> map=new HashMap<>();
        List<Food> foodList= foodService.listFood();
        map.put("foodList",foodList);
        return map;
    }


    /*
     * 增加单个信息
     *
     * */
    @ResponseBody
    @RequestMapping("saveOne")
    public Map<String,Object>addAddress(Food food) {
        Map<String, Object> map=new HashMap<>();
        try{
            foodService.addFood(food);
            map.put("result",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",false);
        }
        return map;
    }


    /*
     * 单个删除
     */
    @ResponseBody
    @RequestMapping("deleteOne")
    public Map<String, Object> removeFoodOne(Integer fid) {
        Map<String, Object> map = new HashMap<>();
        try {
            foodService.removeFood(fid);
            map.put("result", true);
        } catch (Exception e) {
            map.put("result", false);
            e.printStackTrace();
        }
        return map;
    }

    /*
     * 批量删除
     */
    @ResponseBody
    @RequestMapping("deleteFoodAll")
    public Map<String, Object> removeFoodAll(String fids) {
        Map<String, Object> map = new HashMap<>();
        String[] strs = fids.split(",");
        List<Integer> fid = new ArrayList<>();
        for(int i = 0;i<strs.length; i++){
            fid.add(Integer.parseInt(strs[i]));
        }
        try {
            foodService.removeFood(fid);
            map.put("result", true);
        } catch (Exception e) {
            map.put("result", false);
            e.printStackTrace();
        }
        return map;
    }


    /*
     * 修改信息之前需要查询这个信息
     * 然后将其返回到页面
     *
     * */

    @RequestMapping("selectOne")
    public String UpdateOne(Model model, Integer fid) {
        Food food = foodService.queryFood(fid);
        model.addAttribute("food", food);
        return "WEB-INF/food/updatefood";
    }

    /*
     * 修改信息
     * */
    @RequestMapping("updateFood")
    public Map<String, Object> updateFood(Food food) {
        Map<String, Object> map = new HashMap<>();
        try {
            foodService.updateFood(food);
            map.put("result", true);
        } catch (Exception e) {
            map.put("result", false);
            e.printStackTrace();
        }
        return map;
    }

}
