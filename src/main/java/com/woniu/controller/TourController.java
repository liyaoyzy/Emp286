package com.woniu.controller;

import com.github.pagehelper.PageInfo;
import com.woniu.pojo.PageBean;
import com.woniu.pojo.Tour;
import com.woniu.pojo.Tourimg;
import com.woniu.service.TourService;
import com.woniu.service.TourimgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("tour")
public class TourController {


    @Autowired
    TourService tourService;

    @Autowired
    TourimgService tourimgService;


    @RequestMapping("tidimg")
    public  String ce(Integer aid,Model model){
        model.addAttribute("aid",aid);
        return "WEB-INF/tour/newtourimg";
    }


    @RequestMapping("list")
    public String tourList(){
        return "WEB-INF/tour/tourlist";
    }

    /*
    * 新增图片
    *
    * */
    @RequestMapping("saveImg")
    public String saveimg(Model model,Integer tid){
        Tour tour=tourService.queryTour(tid);
        model.addAttribute("tour",tour);
        return "WEB-INF/tour/tourimgsave";
    }
    /*
     * 分页查询
     */
    @ResponseBody
    @RequestMapping("paginationTour")
    public Map<String, Object> listTour(PageBean pageBean,Integer aid){
       Map<String,Object> map=new HashMap<>();
       Map<String,Object> map1=tourService.listTour(pageBean, aid);
        List<Tour> tourList= (List<Tour>) map1.get("tourList");
        PageInfo<Tour> pageInfo= (PageInfo<Tour>) map1.get("pageInfo");
        pageBean.setCountPage(pageInfo.getPages());
        pageBean.setCountRow((int) pageInfo.getTotal());
        if (tourList!=null){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        map.put("pageBean",pageBean);
        map.put("tourList",tourList);
        map.put("pageInfo",pageInfo);
        return map;
    }

    /*
     * 分页查询
     */
    @ResponseBody
    @RequestMapping("tourAllimg")
    public Map<String, Object> tourAllimg(Integer aid){
        Map<String,Object> map=new HashMap<>();
        Map<String,Object> map1=tourService.listTour(aid);
        List<Tour> tourList= (List<Tour>) map1.get("tourList");
        if (tourList!=null){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        map.put("tourList",tourList);
        return map;
    }


    /*
     * 查询所有
     * 做下拉菜单
     *
     * */
    @ResponseBody
    @RequestMapping("tourlist")
    public Map<String,Object>tourMenu() {
        Map<String, Object> map=new HashMap<>();
        List<Tour> tourList= tourService.listTour();
        map.put("tourList",tourList);
        return map;
    }


    /*
     * 增加单个信息
     *
     * */
    @ResponseBody
    @RequestMapping("saveOne")
    public Map<String,Object>addTour(Tour tour) {
        System.out.println(tour);
        Map<String, Object> map=new HashMap<>();
        try{
           tourService.addTour(tour);
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
    public   Map<String, Object> removeTourOne(Integer tid){
        Map<String, Object> map = new HashMap<>();
        try {
            tourService.removeTour(tid);
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
    @RequestMapping("deleteAll")
    public   Map<String, Object> removeTourAll(String tids){
        Map<String, Object> map = new HashMap<>();
        String[] strs = tids.split(",");
        List<Integer> tid = new ArrayList<>();
        for(int i = 0;i<strs.length; i++){
            tid.add(Integer.parseInt(strs[i]));
        }
        try {
            tourService.removeTour(tid);
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
    public  String updateTour(Integer tid, Model model){
        Tour tour=tourService.queryTour(tid);
        model.addAttribute("tour",tour);
        return "WEB-INF/tour/tourupdate";
    }


    /*
     * 修改信息
     * */
    @ResponseBody
    @RequestMapping("updateTour")
    public Map<String, Object> updateTour(MultipartFile files, Model model, HttpServletRequest request, Integer tid,Integer aid,String tname,String times,String price) {
        Map<String, Object> map = new HashMap<>();

        Tour tour=new Tour();
        Tourimg tourimg=new Tourimg();
        if (files.isEmpty()) {
            System.out.println("文件为空空");
        }
        String fileName = files.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        String filePath = request.getRealPath("/")+"tourimg/"; // 上传后的路径
        fileName = UUID.randomUUID() + suffixName; // 新文件名
        File dest = new File(filePath + fileName);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            files.transferTo(dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String filename = "../tourimg/" + fileName;
        tour.setTid(tid);
        tour.setTname(tname);
        tour.setTimes(times);
        tour.setAid(aid);
        tour.setPrice(Double.valueOf(price));
        tourimg=tourimgService.queryTourimg(tid);
        tourimg.setImg(filename);
        try {
        tourService.updateTour(tour);
        tourimgService.updateTourimg(tourimg);
            map.put("result", true);
        } catch (Exception e) {
            map.put("result", false);
            e.printStackTrace();
        }
        return map;
    }
}
