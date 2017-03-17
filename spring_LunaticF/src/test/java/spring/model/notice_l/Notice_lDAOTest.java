package spring.model.notice_l;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
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

public class Notice_lDAOTest {
	private static BeanFactory beans;
	private static Notice_lDAO ndao;

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
		ndao = (Notice_lDAO)beans.getBean("ndao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testCreate() {
		Notice_lDTO dto = new Notice_lDTO();
		dto.setNtitle("junitTestTitle");
		dto.setNcontent("junit Test Content");
		assertTrue(ndao.create(dto));
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("col", "ncontent");
		map.put("word", "t");
		map.put("sno", 1);
		map.put("eno", 5);
		List<Notice_lDTO> list = ndao.list(map);
		assertEquals(list.size(), 3);
	}

	@Test @Ignore
	public void testRead() {
		Notice_lDTO dto = (Notice_lDTO)ndao.read(1);
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testUpdate() {
		Notice_lDTO dto = new Notice_lDTO();
		dto.setNtitle("junit Test Update");
		dto.setNcontent("Update Success");
		dto.setNoticeno(1);
		
		assertTrue(ndao.update(dto));
	}

	@Test @Ignore
	public void testDelete() {
		assertTrue(ndao.delete(3));
	}

	@Test @Ignore
	public void testTotal() {
		Map map = new HashMap();
		map.put("col", "ntitle");
		map.put("word", "공");
		assertEquals(ndao.total(map), 3);
	}

	@Test @Ignore
	public void testUpviewcnt() {

	}

}
