package com.woniu.controller.ceshi;

import com.woniu.pojo.Address;
import com.woniu.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class LoginController {

    @Autowired
    AddressService addressService;

    @RequestMapping("/")
    public  String login(Model model){
        model.addAttribute("abc","aaa");
        return "WEB-INF/hello";
    }


    @RequestMapping("tou")
    public  String tou(Model model){
        return "WEB-INF/addressimgtou";
    }


    @RequestMapping("index")
    public  String index(Model model){
        return "addresshome";
    }

    @RequestMapping("ce")
    public  String ce(Model model){
        return "WEB-INF/address/ce";
    }
    @RequestMapping("ly")
    public  String lyui(Model model){
        return "WEB-INF/address/lyui";
    }

    @RequestMapping("chengshi")
    public  String chenshi(Model model){

        return "WEB-INF/address/chengshi";
    }

    @RequestMapping("lunbo")
    public  String lunbo(Model model){

        return "WEB-INF/address/lunbodiv";
    }
    @RequestMapping("zhuan")
    public  String zhuan(Model model){

        return "addressimgshow";
    }

    @RequestMapping("lun")
    public  String lun(Model model){

        return "WEB-INF/address/lun";
    }


    @RequestMapping("zhe")
    public  String zhe(Model model){

        return "WEB-INF/tour/zhe";
    }

    @RequestMapping("caidan")
    public  String caidan(Model model){

        return "WEB-INF/caidan";
    }

    @RequestMapping("new")
    public  String newTour(Model model){
        return "addressimgshowAll";
    }


    @RequestMapping("foodlist")
    public  String foodlist(Model model){
        model.addAttribute("abc","aaa");
        return "WEB-INF/food/foodList";
    }

    @ResponseBody
    @RequestMapping("one")
    public  String addressOne(){
        Address address=addressService.queryAddress(1);
        System.out.println(address);
        return null;
    }




    /*
    * 图片上传
    * */
    @RequestMapping("fileUpload")
    public String fileUpload(MultipartFile files, Model model, HttpServletRequest request) {
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
        model.addAttribute("filename", filename);
        return "WEB-INF/hello";
    }


}
