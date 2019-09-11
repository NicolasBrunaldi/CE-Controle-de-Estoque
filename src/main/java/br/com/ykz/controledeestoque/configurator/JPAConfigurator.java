package br.com.ykz.controledeestoque.configurator;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;

import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
public class JPAConfigurator {

	@Bean
	public DriverManagerDataSource getDataSource() {
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		
		dataSource.setUsername("root");
		dataSource.setPassword("CAI7257SP");
		dataSource.setUrl("jdbc:mysql://localhost:3306/controle-de-estoque?serverTimezone=UTC");
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		
		
		return dataSource;
	}
	
	@Bean
	public LocalContainerEntityManagerFactoryBean getEntityManagerFactory(DriverManagerDataSource dataSource) {
		
		LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
		
		factoryBean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		
		Properties properties = new Properties();
		
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
		properties.setProperty("hibernate.show_sql", "true");
		properties.setProperty("hibernate.hbm2ddl.auto", "update");

		
		factoryBean.setDataSource(dataSource);
		factoryBean.setPackagesToScan("br.com.ykz.controledeestoque.models");
		factoryBean.setJpaProperties(properties);
		
		return factoryBean;
	}
	
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
		
		return new JpaTransactionManager(emf);
	}
}
