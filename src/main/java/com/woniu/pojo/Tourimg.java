package com.woniu.pojo;

public class Tourimg {
    private Integer imgid;

    private Integer tid;

    private String img;

    private Tour tour;

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public Integer getImgid() {
        return imgid;
    }

    public void setImgid(Integer imgid) {
        this.imgid = imgid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Tourimg{" +
                "imgid=" + imgid +
                ", tid=" + tid +
                ", img='" + img + '\'' +
                '}';
    }
}