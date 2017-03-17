package spring.model.notice_l;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	@Autowired
	private Notice_lDAO ndao;
	@Autowired
	private Nreply_lDAO nrdao;

	public void delete(int noticeno) throws Exception {
		nrdao.bdelete(noticeno);
		ndao.delete(noticeno);
	}
}
