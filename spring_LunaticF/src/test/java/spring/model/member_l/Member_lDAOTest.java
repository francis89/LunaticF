package spring.model.member_l;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;
import java.util.HashMap;
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



public class Member_lDAOTest {
	private static BeanFactory beans;
	private static Member_lDAO mdao;

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
		mdao = (Member_lDAO)beans.getBean("mdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testCreate() {
		Member_lDTO dto = new Member_lDTO();
		dto.setId("user11");
		dto.setPasswd("123");
		dto.setUsername("아이고");
		dto.setTel("010-1111-1111");
		dto.setZipcode(12345);
		dto.setAddress1("서울시");
		dto.setAddress2("종로구");
		assertTrue(mdao.create(dto));
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("col", "username");
		map.put("word", "관");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<Member_lDTO> list = mdao.list(map);
		assertEquals(list.size(),1);
	}


	@Test @Ignore
	public void testRead() throws Exception {
		Member_lDTO dto = mdao.read("admin");
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testUpdate() {
		Member_lDTO dto = new Member_lDTO();
		dto.setId("user11");
		dto.setTel("010-222-3333");
		dto.setZipcode(11111);
		dto.setAddress1("인천시");
		dto.setAddress2("북구");
		assertTrue(mdao.update(dto));
		
	}

	@Test @Ignore 
	public void testDelete() {
		String id = "user11";
		assertTrue(mdao.delete(id));
	}

	@Test @Ignore
	public void testTotal() {
		Map map = new HashMap();
		map.put("col", "username");
		map.put("word", "관");
		assertEquals(mdao.total(map), 1);
	}

	@Test @Ignore
	public void testPassCheck() {
		Map map = new HashMap();
		map.put("id", "user1");
		map.put("passwd", "1234");
		assertTrue(mdao.passCheck(map));
	}

	@Test @Ignore
	public void testIdCheck() {
		String id = "admin";
		assertTrue(mdao.idCheck(id));
	}

	@Test @Ignore
	public void testLoginCheck() {
		Map map = new HashMap();
		map.put("id", "admin");
		map.put("passwd", "123");
		assertTrue(mdao.loginCheck(map));
	}

	@Test @Ignore
	public void testGetGrade() {
		String id = "user1";
		assertEquals(mdao.getGrade(id), "H");
	}

}
