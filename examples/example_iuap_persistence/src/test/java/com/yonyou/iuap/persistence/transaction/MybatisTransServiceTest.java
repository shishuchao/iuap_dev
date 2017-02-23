package com.yonyou.iuap.persistence.transaction;

import java.util.Date;
import java.util.UUID;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.Assert;

import com.yonyou.iuap.entity.quotation.IpuQuotation;
import com.yonyou.iuap.service.trans.ComplexTransService;
import com.yonyou.iuap.service.trans.MybatisTransService;

public class MybatisTransServiceTest {
	
	public static ApplicationContext context;
	
	private MybatisTransService service;
	
	
	@Before
	public void setUp() throws Exception {
		context = new ClassPathXmlApplicationContext(new String[]{"classpath:applicationContext.xml","classpath:applicationContext-persistence.xml"});
		service = context.getBean(MybatisTransService.class);
	}
	
	@Test
	public void testComplexService() throws Exception {
		boolean flag=false;
		IpuQuotation entity = new IpuQuotation();
		entity.setIpuquotaionid(UUID.randomUUID().toString());
		entity.setDescription("test");
		entity.setBuyoffertime(new Date(System.currentTimeMillis()));
		
		int f=service.complexQuotationOperate(entity);
		if(f!=0){
			flag=true;
		}
		Assert.isTrue(flag);
	}
	
}
