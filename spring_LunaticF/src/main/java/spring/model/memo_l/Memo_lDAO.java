package spring.model.memo_l;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.lfinder.DAOSTDInter;

@Repository
public class Memo_lDAO implements DAOSTDInter {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public boolean create(Object dto){
		boolean flag = false;
		int cnt = sqlSession.insert("memo_l.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public List list(Map map){
		return sqlSession.selectList("memo_l.list", map);
	}

	@Override
	public Object read(Object memono) {
		return sqlSession.selectOne("memo_l.read", memono);
	}

	@Override
	public boolean update(Object dto){
		boolean flag = false;

		int cnt = sqlSession.update("memo_l.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public boolean delete(Object memono)  {
		boolean flag = false;
		int cnt = sqlSession.delete("memo_l.delete", memono);

		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public int total(Map map) {

		return sqlSession.selectOne("memo_l.total", map);
	}

	public void upViewcnt(int memono) {

		sqlSession.update("memo_l.upViewcnt", memono);

	}

}
