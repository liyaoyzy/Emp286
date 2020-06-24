package com.woniu.controller;

import com.github.pagehelper.PageInfo;
import com.woniu.pojo.Address;
import com.woniu.pojo.Addressimg;
import com.woniu.pojo.PageBean;
import com.woniu.service.AddressService;
import com.woniu.service.AddressimgService;
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
@RequestMapping("address")
public class AddressController {

    @Autowired
    AddressService addressService;
    @Autowired
    AddressimgService addressimgService;
    @RequestMapping("list")
    public  String Addresslist(){
        return "WEB-INF/address/addresslist";
    }

    @RequestMapping("addForm")
    public String userSave() {
        return "WEB-INF/address/addressAdd";
    }

    @RequestMapping("addressimg")
    public String addressimg() {
        return "WEB-INF/address/addressimgshowAll";
    }

    /*
    * 地址分页查询
    * 根据地址名称查询
    * */
    @ResponseBody
    @RequestMapping("paginationAddress")
    public Map<String,Object>listAddress(PageBean pageBean,String address) {
        Map<String, Object> map=new HashMap<>();
        Map<String ,Object> map1=addressService.listAddress(pageBean, address);
        List<Address> addressList= (List<Address>) map1.get("addressList");
        PageInfo<Address> pageInfo= (PageInfo<Address>) map1.get("pageInfo");
        if (addressList!=null){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        pageBean.setCountPage(pageInfo.getPages());
        pageBean.setCountRow((int) pageInfo.getTotal());
        map.put("pageBean",pageBean);
        map.put("addressList",addressList);
        return map;
    }


    /*
     * 查询照片
     * 根据地址名称查询
     * */
    @ResponseBody
    @RequestMapping("addressAllimg")
    public Map<String,Object>listAddress(String address) {
        Map<String, Object> map=new HashMap<>();
        Map<String ,Object> map1=addressService.listAddress(address);
        List<Address> addressList= (List<Address>) map1.get("addressList");
        if (addressList!=null){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        map.put("addressList",addressList);
        System.out.println(addressList);
        return map;
    }



    /*
     * 查询所有
     * 做下拉菜单
     *
     * */
    @ResponseBody
    @RequestMapping("addresslist")
    public Map<String,Object>addressMenu() {
        Map<String, Object> map=new HashMap<>();
        List<Address> addressList= addressService.listAddress();
        System.out.println(addressList);
        map.put("addressList",addressList);
        return map;
    }


    /*
     * 增加单个信息
     *
     * */
    @ResponseBody
    @RequestMapping("saveOne")
    public Map<String,Object>addAddress(Address address) {
        Map<String, Object> map=new HashMap<>();
        try{
            addressService.addAddress(address);
            map.put("result",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",false);
        }
        return map;
    }


    /*
     * 增加图片
     *
     * */

    @RequestMapping("saveImg")
    public String saveImg(Integer aid,Model model) {
        Map<String, Object> map=new HashMap<>();
        Address address=addressService.queryAddress(aid);
        model.addAttribute("address",address);
        return "WEB-INF/address/addressimgsave";
    }

    /*
     * 删除单个信息
     *
     * */
    @ResponseBody
    @RequestMapping("deleteOne")
    public Map<String,Object>removeAddress(Integer aid) {
        Map<String, Object> map=new HashMap<>();
        try{
            addressService.removeAddress(aid);
            map.put("result",true);
        }catch (Exception e){
            e.printStackTrace();
            map.put("result",false);
        }
        return map;
    }

    /*
     * 地址批量删除
     * */
    @ResponseBody
    @RequestMapping("deleteAll")
    public Map<String, Object> deleteAll(String aids) {
        Map<String, Object> map = new HashMap<>();
        String[] strs = aids.split(",");
        List<Integer> aid = new ArrayList<>();
        for(int i = 0;i<strs.length; i++){
            aid.add(Integer.parseInt(strs[i]));
        }
        try {
            addressService.removeAddress(aid);
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
    @RequestMapping("slelectOne")
    public String updateOne(Integer aid, Model model) {
            Address address=addressService.queryAddress(aid);
            model.addAttribute("address",address);
        return "WEB-INF/address/addressupdate";
    }

    /*
     * 然后根据页面传回来的的对象
     * 对其进行修改操作
     *
     * */
    @ResponseBody
    @RequestMapping("updateAddress")
    public Map<String,Object>updateAddress(MultipartFile files, Model model, HttpServletRequest request, Integer aid,String address) {
        Map<String, Object> map=new HashMap<>();
        Address addre=new Address();
        Addressimg addressimg=new Addressimg();
        if (files.isEmpty()) {
            System.out.println("文件为空空");
        }
        String fileName = files.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        String filePath = request.getRealPath("/")+"addressimg/"; // 上传后的路径
        System.out.println(filePath);
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
         addre.setAid(aid);
         addre.setAddress(address);
        addressimg=addressimgService.queryAddressimg(aid);
        addressimg.setAid(aid);
        addressimg.setAddimg(filename);
        System.out.println(addressimg);
        try{
            addressService.updateAddress(addre);
            addressimgService.updateAddressimg(addressimg);
            map.put("result",true);
        }catch (Exception e){
            map.put("result",false);
            e.printStackTrace();
        }
        return map;
    }

}
