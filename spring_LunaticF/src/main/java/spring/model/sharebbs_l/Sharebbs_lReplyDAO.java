package spring.model.sharebbs_l;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sharebbs_lReplyDAO implements ISharebbs_lReplyDAO {
	
	//JUNIT 테스트
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int rcount(int shareno) {
		return sqlSession.selectOne("shreply.rcount", shareno);
	}

	@Override
	public boolean create(Sharebbs_lReplyDTO dto) {
		boolean flag = false;

		int cnt = (Integer) sqlSession.insert("shreply.create", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public Sharebbs_lReplyDTO read(int shrnum) {
		return sqlSession.selectOne("shreply.read", shrnum);
	}

	@Override
	public boolean update(Sharebbs_lReplyDTO dto) {
		boolean flag = false;

		int cnt = sqlSession.update("shreply.update", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public List list(Map map) {
		return sqlSession.selectList("shreply.list", map);
	}

	@Override
	public int total(int shareno) {
		return (Integer) sqlSession.selectOne("shreply.total", shareno);
	}

	@Override
	public boolean delete(int shrnum) {
		boolean flag = false;
		int cnt = sqlSession.delete("shreply.delete", shrnum);
		if (cnt > 0)
			flag = true;

		return flag;
	}
	
	public int bdelete(int shareno){
		
		return sqlSession.delete("shreply.bdelete", shareno);
	}
}
