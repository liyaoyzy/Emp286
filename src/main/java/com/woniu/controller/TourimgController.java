package com.woniu.controller;

import com.github.pagehelper.PageInfo;
import com.woniu.pojo.PageBean;
import com.woniu.pojo.Tourimg;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("tourimg")
public class TourimgController {
    @Autowired
    TourimgService tourimgService;
    @RequestMapping("list")
    public  String addressimglist (){
        return "WEB-INF/tour/tourimglist";
    }

    /*
     * 展示所有图片
     *
     */
    @ResponseBody
    @RequestMapping("tourimgAll")
    public Map<String,Object> listAddressimg(Integer tid, PageBean pageBean){
        Map<String, Object>map=new HashMap<>();
        Map<String, Object>map1=tourimgService.listTourimg(pageBean,tid);
        List<Tourimg> tourimgList  = (List<Tourimg>) map1.get("tourimgList");
        PageInfo<Tourimg> pageInfo= (PageInfo<Tourimg>) map1.get("pageInfo");
        if (tourimgList!=null){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        pageBean.setCountPage(pageInfo.getPages());
        pageBean.setCountRow((int) pageInfo.getTotal());
        map.put("pageBean",pageBean);
        map.put("tourimgList",tourimgList);
        return map;
    }


    /*
     * 新增图片
     *
     */
    @ResponseBody
    @RequestMapping("saveimg")
    public Map<String,Object> saveAddressimg(MultipartFile files, Model model, HttpServletRequest request, Integer tid){
        Map<String,Object> map=new HashMap<>();
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
        Tourimg tourimg=new Tourimg();
        tourimg.setTid(tid);
        tourimg.setImg(filename);
        try {
            tourimgService.addTourimg(tourimg);
            map.put("result",true);
        } catch (Exception e) {
            map.put("result",false);
            e.printStackTrace();
        }
        return map;
    }

}
