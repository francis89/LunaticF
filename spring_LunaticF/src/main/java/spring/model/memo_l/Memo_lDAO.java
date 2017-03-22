package spring.model.memo_l;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Memo_lDAO implements IMemo_lDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public boolean create(Object dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.insert("memo_l.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public List list(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memo_l.list", map);
	}

	@Override
	public Object read(Object memono) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memo_l.read", memono);
	}

	@Override
	public boolean update(Object dto){
		// TODO Auto-generated method stub
		boolean flag = false;

		int cnt = sqlSession.update("memo_l.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public boolean delete(Object memono) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.delete("memo_l.delete", memono);

		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public int total(Map map){
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memo_l.total", map);
	}

	@Override
	public void upViewcnt(int memono) {
		// TODO Auto-generated method stub
		sqlSession.update("memo_l.upViewcnt", memono);
	}

	@Override
	public boolean passCheck(Map map) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.selectOne("memo_l.passCheck", map);
		if (cnt > 0)
			flag = true;

		return flag;
	}

}
