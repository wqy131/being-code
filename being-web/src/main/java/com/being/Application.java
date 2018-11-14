package com.being;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

@EnableAutoConfiguration
@SpringBootApplication
@ComponentScan(basePackages={"com.being"})//指定spring要扫描的包
@MapperScan("com.being.mapper")//指定mapper文件所在的包
public class Application{
	 protected static final Logger logger = LoggerFactory.getLogger(Application.class);

	public static void main(String[] args) {
		logger.info("SpringBoot开始加载");
		SpringApplication.run(Application.class, args);
		logger.info("SpringBoot加载完毕");
	}
	//创建数据源
	@Bean  
    @ConfigurationProperties(prefix = "spring.datasource")//ָ指定数据源的前缀
    public DataSource dataSource() {  
        return new DataSource();  
    }
	
	//创建SqlSessionFactory
	@Bean  
    public SqlSessionFactory sqlSessionFactoryBean() throws Exception {  
  
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();  
        sqlSessionFactoryBean.setDataSource(dataSource());  
  
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();  
  
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath:/mybatis/*.xml"));//指定mapper文件所在目录  
  
        return sqlSessionFactoryBean.getObject();  
    }  
	
	//创建事务管理器
	@Bean  
    public PlatformTransactionManager transactionManager() {  
        return new DataSourceTransactionManager(dataSource());  
    }
	
}
