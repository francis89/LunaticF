package spring.model.notice_l;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Notice_lDAO implements INotice_lDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** junit test */
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public boolean create(Object dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.insert("notice_l.create", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public List list(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("notice_l.list", map);
	}

	@Override
	public Object read(Object pk) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice_l.read", pk);
	}

	@Override
	public boolean update(Object pk) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.update("notice_l.update", pk);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public boolean delete(Object pk) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.delete("notice_l.delete", pk);
		if(cnt > 0) flag = true;

		return flag;
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice_l.total", map);
	}

	@Override
	public void upviewcnt(int pk) {
		sqlSession.update("notice_l.upViewcnt", pk);

	}

}
