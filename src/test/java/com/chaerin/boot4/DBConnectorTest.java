package com.chaerin.boot4;

import static org.junit.jupiter.api.Assertions.*;


import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;



@SpringBootTest
class DBConnectorTest {
	@Autowired
	private DataSource dataSource;
	
	@Test
	void test() throws Exception{
		
		assertNotNull(dataSource.getConnection());
	}

}
