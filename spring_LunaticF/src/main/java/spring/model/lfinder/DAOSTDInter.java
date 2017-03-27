package spring.model.lfinder;

import java.util.List;
import java.util.Map;

public interface DAOSTDInter {
	public boolean create(Object dto) throws Exception;

	public List list(Map map) throws Exception;

	public Object read(Object pk) throws Exception;

	public boolean update(Object pk) throws Exception;

	public boolean delete(Object dto) throws Exception;

	public int total(Map map) throws Exception;

}