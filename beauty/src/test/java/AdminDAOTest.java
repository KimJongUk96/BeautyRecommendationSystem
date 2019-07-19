import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brs.dto.LoginDTO;
import com.brs.persistence.AdminDAO;

import oracle.net.aso.d;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class AdminDAOTest {
	
	@Inject
	private  AdminDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(AdminDAOTest.class);
	
	@Test
	public void testLogin() throws Exception {
		
		LoginDTO dto = new LoginDTO();
		dto.setUsid("오상준");
		dto.setUpw("1234");
		
		dao.login(dto);
		
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
