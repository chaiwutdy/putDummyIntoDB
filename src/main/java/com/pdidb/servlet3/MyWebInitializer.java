package com.pdidb.servlet3;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.pdidb.config.SpringWebConfig;
/*
change AbstractAnnotationConfigDispatcherServletInitializer to WebApplicationInitializer 
AbstractAnnotationConfigDispatcherServletInitializer on Weblogic 12c not working
*/
public class MyWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer implements WebApplicationInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
//		return null;
		return new Class[]{SpringWebConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
//		return new Class[]{SpringWebConfig.class};
		return null;
	}

	@Override
	protected String[] getServletMappings() {
		return new String[]{"/"};
	}


}
