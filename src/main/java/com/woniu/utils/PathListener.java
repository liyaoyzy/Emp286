package com.woniu.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class PathListener implements ServletContextListener {

    public PathListener() {
        // TODO Auto-generated constructor stub
    }


    public void contextDestroyed(ServletContextEvent sce)  {
        // TODO Auto-generated method stub
    }

    public void contextInitialized(ServletContextEvent sce)  {
        // TODO Auto-generated method stub
        sce.getServletContext().setAttribute("BASE",sce.getServletContext().getContextPath());
    }
}
