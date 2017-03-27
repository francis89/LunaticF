package spring.model.notice_l;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Nreply_lDAO implements INreply_lDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int rcount(int noticeno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("nreply_l.rcount", noticeno);
	}

	@Override
	public boolean create(Object dto) {
		// TODO Auto-generated method stub
		boolean flag = false;

		int cnt = (Integer) sqlSession.insert("nreply_l.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public List list(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("nreply_l.list", map);
	}

	@Override
	public Object read(int nreplyno) {
		// TODO Auto-generated method stub
		return (Nreply_lDTO) sqlSession.selectOne("nreply_l.read", nreplyno);
	}

	@Override
	public boolean update(Object dto) {
		// TODO Auto-generated method stub
		boolean flag = false;

		int cnt = sqlSession.update("nreply_l.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public boolean delete(int nreplyno) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.delete("nreply_l.delete", nreplyno);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public int total(int noticeno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("nreply_l.total", noticeno);
	}

	@Override
	public int bdelete(int noticeno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("nreply_l.bdelete", noticeno);
	}

}
