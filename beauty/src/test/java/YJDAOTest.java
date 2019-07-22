import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brs.domain.method.MethodSuggestVO;
import com.brs.persistence.method.MethodSuggestDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class YJDAOTest {
	
	@Inject
	private  MethodSuggestDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(YJDAOTest.class);
	
/*
	@Test
	public void testRead() throws Exception {
		
		MethodSuggestVO mVO = new MethodSuggestVO();
		mVO.setMethodNo("1001");
		mVO.setDust("1");
		mVO.setMakeUp("1");
		mVO.setSkinType("1");
		mVO.setWeather("1");
		
	}*/
	
	@Test
	public void testListCriteria() throws Exception{
		MethodSuggestVO mVO = new MethodSuggestVO();
		mVO.setDust("1");
		mVO.setMakeUp("1");
		mVO.setSkinType("1");
		mVO.setWeather("1");
	}
}
