package com.woniu.controller;

import com.github.pagehelper.PageInfo;
import com.woniu.pojo.Addressimg;
import com.woniu.pojo.PageBean;
import com.woniu.service.AddressimgService;
import org.omg.CORBA.OBJ_ADAPTER;
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
@RequestMapping("addressimg")
public class AddressimgController {
    @Autowired
    AddressimgService addressimgService;


    @RequestMapping("list")
    public  String addressimglist (){
        return "WEB-INF/address/addressimglist";
    }

    /*
     * 展示一张图片
     *
     */
    @ResponseBody
    @RequestMapping("addressimgOne")
    public Map<String,Object> queryAddressimg(Integer aid){
        Map<String, Object>map=new HashMap<>();
        Addressimg addressimg =addressimgService.queryAddressimg(aid);
        if (addressimg!=null){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        map.put("addressimg",addressimg);
        return map;
    }

    /*
     * 展示所有图片
     *
     */
    @ResponseBody
    @RequestMapping("addressimgAll")
    public Map<String,Object> listAddressimg(Integer aid, PageBean pageBean){
        Map<String, Object>map=new HashMap<>();
        Map<String, Object>map1=addressimgService.listAddressimg(aid, pageBean);
        List<Addressimg> addressimgList  = (List<Addressimg>) map1.get("addressimgList");
        PageInfo<Addressimg> pageInfo= (PageInfo<Addressimg>) map1.get("pageInfo");
        if (addressimgList!=null){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        pageBean.setCountPage(pageInfo.getPages());
        pageBean.setCountRow((int) pageInfo.getTotal());
        map.put("pageBean",pageBean);
        map.put("addressimgList",addressimgList);
        return map;
    }
    /*
     * 展示所有图片
     *
     */
    @ResponseBody
    @RequestMapping("addressimgAllimg")
    public Map<String,Object> addressimgAllimg(Integer aid){
        Map<String, Object>map=new HashMap<>();
        Map<String, Object>map1=addressimgService.listAddressimg(aid);
        List<Addressimg> addressimgList  = (List<Addressimg>) map1.get("addressimgList");
        if (addressimgList!=null){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        map.put("addressimgList",addressimgList);
        return map;
    }
    /*
     * 新增图片
     *
     */

    @ResponseBody
    @RequestMapping("saveimg")
    public Map<String,Object> saveAddressimg(MultipartFile files, HttpServletRequest request,Integer aid){
       Map<String,Object> map=new HashMap<>();
        if (files.isEmpty()) {
            System.out.println("文件为空");
        }
        String fileName = files.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        String filePath = request.getRealPath("/")+"addressimg/"; // 上传后的路径
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
        String filename = "../addressimg/" + fileName;
        Addressimg addressimg=new Addressimg();
        addressimg.setAid(aid);
        addressimg.setAddimg(filename);
        try {
            addressimgService.addAddressimg(addressimg);
            map.put("result",true);
        } catch (Exception e) {
            map.put("result",false);
            e.printStackTrace();
        }
        return map;
    }
}
