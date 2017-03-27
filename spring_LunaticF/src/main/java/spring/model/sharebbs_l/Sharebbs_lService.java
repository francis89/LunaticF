package spring.model.sharebbs_l;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Sharebbs_lService {
	@Autowired
	private Sharebbs_lDAO dao;

	@Autowired
	private Sharebbs_lReplyDAO rdao;

	public void delete(int bbsno) throws Exception {

		rdao.bdelete(bbsno);
		dao.delete(bbsno);
	}
}
