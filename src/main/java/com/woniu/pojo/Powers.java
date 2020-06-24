package com.woniu.pojo;

public class Powers {
    private Integer pid;

    private String name;

    private String url;

    private Integer parentid;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    @Override
    public String toString() {
        return "Powers{" +
                "pid=" + pid +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", parentid=" + parentid +
                '}';
    }
}