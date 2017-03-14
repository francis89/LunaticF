package srping.model.reserve_l;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.reserve_l.Reserve_lDAO;
import spring.model.reserve_l.Reserve_lDTO;

public class Reserve_lDAOTest {
	private static BeanFactory beans;
	private static Reserve_lDAO rdao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("junit/lfinder.xml");
		beans = new XmlBeanFactory(resource);
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		rdao = (Reserve_lDAO)beans.getBean("rdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore 
	public void testCreate() {
		Reserve_lDTO dto = new Reserve_lDTO();
		dto.setRetitle("junit테스트");
		dto.setRecontent("junit테스트");
		dto.setReterm("03-10");
		dto.setRestate("경기도 부천시");
		dto.setRetimnum(10);
		dto.setId("user1");
		assertTrue(rdao.create(dto));
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<Reserve_lDTO> list = rdao.list(map);
		assertEquals(list.size(), 5);
	}

	@Test @Ignore
	public void testRead() {
		Object dto = rdao.read(4);
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testUpdate() {
		Reserve_lDTO dto = new Reserve_lDTO();
		dto.setReserveno(3);
		dto.setRetitle("junit제목변경");
		dto.setRecontent("junit테스트 변경");
		dto.setReterm("2017-03-13");
		dto.setRetimnum(13);
		assertTrue(rdao.update(dto));
	}

	@Test @Ignore
	public void testDelete() {
		int reserveno = 3;
		assertTrue(rdao.delete(reserveno));
	}

	@Test @Ignore
	public void testUpViewcnt() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testAddAnsnum() {
		fail("Not yet implemented");
	}

	@Test
	public void testTotal() {
		Map map = new HashMap();
		String col = "retitle";
		String word = "j";
		map.put("col", col);
		map.put("word", word);
		assertEquals(rdao.total(map), 3);
	}

	@Test @Ignore
	public void testCheckRefno() {
		int reserveno = 5;
		assertTrue(rdao.checkRefno(reserveno));
	}

}
