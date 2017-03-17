package spring.model.notice_l;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

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

public class Nreply_lDAOTest {
	private static BeanFactory beans;
	private static Nreply_lDAO nrdao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("/junit/lfinder.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		nrdao = (Nreply_lDAO)beans.getBean("nrdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testRcount() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testCreate() {
		Nreply_lDTO dto = new Nreply_lDTO();
		dto.setId("admin");
		dto.setNoticeno(3);
		dto.setNrcontent("junit Nreply insert Test123");
		
		assertTrue(nrdao.create(dto));
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("noticeno", 7);
		map.put("sno", 1);
		map.put("eno", 3);
		List<Nreply_lDTO> list = nrdao.list(map);
		assertEquals(list.size(), 1);
	}

	@Test @Ignore
	public void testRead() {
		Nreply_lDTO dto = (Nreply_lDTO)nrdao.read(15);
		assertEquals(dto.getNoticeno(), 7);
		assertEquals(dto.getNreplyno(), 15);
		assertEquals(dto.getId(), "admin");
		
	}

	@Test @Ignore
	public void testUpdate() {
		Nreply_lDTO dto = new Nreply_lDTO();
		dto.setNoticeno(7);
		dto.setId("admin");
		dto.setNreplyno(16);
		dto.setNrcontent("junit Nreply update Test");
		assertTrue(nrdao.update(dto));
	}

	@Test @Ignore
	public void testDelete() {
		assertTrue(nrdao.delete(14));
	}

	@Test @Ignore
	public void testTotal() {
		int noticeno = 7;
		int cnt = (Integer)nrdao.total(7);
		assertEquals(cnt, 2);
	}

	@Test @Ignore
	public void testBdelete() {
		int noticeno = 3;
		assertEquals(nrdao.bdelete(noticeno), 1);
	}

}
