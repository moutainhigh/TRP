package com.fdays.tsms.base;

import javax.servlet.*;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fdays.tsms.system.biz.SysInitBiz;

public class ContextListener implements ServletContextListener {
	public void contextInitialized(ServletContextEvent event) {
		SysInitBiz sysInitBiz;
		System.out.println("init system,please waiting a few minutes.");
		try {
			ApplicationContext applicationContext = WebApplicationContextUtils
					.getWebApplicationContext(event.getServletContext());
			sysInitBiz = (SysInitBiz) applicationContext.getBean("sysInitBiz");

			sysInitBiz.initMainTask();
			sysInitBiz.initPlatComAccountStore();
			sysInitBiz.updateUserStore();	
			sysInitBiz.updateAirlineStroe();
		} catch (Exception ex) {
			System.out.println("init system fails... " + ex.getMessage());
		}
	}

	public void contextDestroyed(ServletContextEvent event) {

	}
}