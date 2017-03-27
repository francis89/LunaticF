package spring.model.sharebbs_l;

import java.util.List;
import java.util.Map;

import spring.model.lfinder.ReDAOSTDInter;

public interface ISharebbs_lReplyDAO extends ReDAOSTDInter {
	
	public boolean create(Sharebbs_lReplyDTO dto) ;

	public Sharebbs_lReplyDTO read(int rnum);

	public boolean update(Sharebbs_lReplyDTO dto);

	public List<Sharebbs_lReplyDTO> list(Map map);

	public int total(int shareno) ;

	public boolean delete(int rnum);


}
