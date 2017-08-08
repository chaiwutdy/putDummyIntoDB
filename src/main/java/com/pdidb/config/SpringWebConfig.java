package com.pdidb.config;
import java.nio.charset.Charset;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.pdidb.util.Utils;

@EnableWebMvc //mvc:annotation-driven
@Configuration
@ComponentScan({ "com.pdidb.web" })
@MapperScan("com.pdidb.mapper")
public class SpringWebConfig extends WebMvcConfigurerAdapter{
		
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry){
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public InternalResourceViewResolver viewResolver(){
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/jsp/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	 @Bean
   public DataSource dataSource() {
       DriverManagerDataSource dataSource = new DriverManagerDataSource();
       /*dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
       dataSource.setUrl("jdbc:oracle:thin:@10.119.21.13:1521/HONDA");
       dataSource.setUsername("honda");
       dataSource.setPassword("honda");*/
      
       dataSource.setDriverClassName( Utils.getProperties("app.jdbc.driverClassName") );
       dataSource.setUrl( Utils.getProperties("app.jdbc.url") );
       dataSource.setUsername( Utils.getProperties("app.jdbc.username") );
       dataSource.setPassword( Utils.getProperties("app.jdbc.password") );
       
       return dataSource;
   }
	 
	 @Bean
   public SqlSessionFactory sqlSessionFactory() throws Exception {
     SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
     sqlSessionFactory.setDataSource(dataSource());
     return (SqlSessionFactory) sqlSessionFactory.getObject();
   }
	 
	 @Bean
	 public StringHttpMessageConverter stringHttpMessageConverter() {
	     return new StringHttpMessageConverter(Charset.forName("UTF-8"));
	 }
	 
	 
}
