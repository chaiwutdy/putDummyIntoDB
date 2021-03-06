package com.pdidb.servlet3;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import com.pdidb.config.CoreConfig;
import com.pdidb.config.SpringWebConfig;
/*
change AbstractAnnotationConfigDispatcherServletInitializer to WebApplicationInitializer 
AbstractAnnotationConfigDispatcherServletInitializer on Weblogic 12c not working
*/
public class WebInitializer implements WebApplicationInitializer {

	private static final String DISPATCHER_SERVLET_NAME = "spring-mvc";
	private static final String DISPATCHER_SERVLET_MAPPING = "/";
	 
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException{
		
    AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
    appContext.register(CoreConfig.class);
    appContext.setDisplayName("CoreConfig");    

    AnnotationConfigWebApplicationContext mvcContext = new AnnotationConfigWebApplicationContext();
    mvcContext.register(SpringWebConfig.class);

    ServletRegistration.Dynamic springmvc =
            servletContext.addServlet(DISPATCHER_SERVLET_NAME,
                      new DispatcherServlet(mvcContext));
    springmvc.setLoadOnStartup(1);
    springmvc.addMapping(DISPATCHER_SERVLET_MAPPING);

    EnumSet<DispatcherType> dispatcherTypes = EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD);

    CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
    characterEncodingFilter.setEncoding("UTF-8");
    characterEncodingFilter.setForceEncoding(true);

    FilterRegistration.Dynamic characterEncoding = servletContext.addFilter("characterEncoding", characterEncodingFilter);
    characterEncoding.addMappingForUrlPatterns(dispatcherTypes, true, "/*");

    servletContext.addListener(new ContextLoaderListener(appContext));
	}
	

}
