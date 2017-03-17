package spring.model.notice_l;

import java.util.List;
import java.util.Map;

import spring.model.lfinder.ReDAOSTDInter;

public interface INreply_lDAO extends ReDAOSTDInter {
	public boolean create(Object dto) throws Exception;

	public List list(Map map) throws Exception;

	public Object read(int pk) throws Exception;

	public boolean update(Object dto) throws Exception;

	public boolean delete(int pk) throws Exception;

	public int total(int pk) throws Exception;
	
	public int bdelete(int pk) throws Exception;
}
