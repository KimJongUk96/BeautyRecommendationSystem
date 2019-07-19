import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brs.domain.method.MethodVO;
import com.brs.persistence.method.MethodDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class MethodDAOTest {
	
	@Inject
	private  MethodDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(MethodDAOTest.class);
	
	@Test
	public void testCreate() throws Exception {
		
		MethodVO board = new MethodVO();
		board.setAdminNo(1);
		board.setMethodNo(2);
		board.setMethodStep(3);
		board.setDust("c");
		board.setMakeUpDegree("d");
		board.setSeason("a");
		board.setSkinType("b");
		board.setWeather("f");
		dao.create(board);
		
	}
/*	
	@Test
	public void testRead() throws Exception {
		
		logger.info(dao.read(1).toString());
	}
	*/
/*	@Test
	public void testUpdate() throws Exception {
		
		BoardVO board = new BoardVO();
		board.setBno(1);
		board.setTitle("�닔�젙�젣紐�");
		board.setContent("�닔�젙�궡�슜");
		dao.update(board);
	}
	
	@Test
	public void testDelete() throws Exception {
		dao.delete(1);
	}*/

}
