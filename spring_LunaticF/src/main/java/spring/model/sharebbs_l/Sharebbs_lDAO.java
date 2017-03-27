package spring.model.sharebbs_l;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class Sharebbs_lDAO implements ISharebbs_lDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//JUNIT 테스트
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List list(Map map){
		return sqlSession.selectList("sharebbs_l.list",map);
	}

	@Override
	public boolean create(Object dto){
		boolean flag = false;
		int cnt = sqlSession.insert("sharebbs_l.create", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public Sharebbs_lDTO read(Object shareno){
		return sqlSession.selectOne("sharebbs_l.read", shareno);
	}
	
	@Override
	public boolean update(Object dto){
		boolean flag = false;
		int cnt = sqlSession.update("sharebbs_l.update", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public boolean delete(Object shareno){
		boolean flag = false;
		int cnt = sqlSession.delete("sharebbs_l.delete", shareno);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public int total(Map map){
		return sqlSession.selectOne("sharebbs_l.total", map);
	}
	
	@Override
	public void upViewcnt(int shareno) {
		sqlSession.update("sharebbs_l.upViewcnt", shareno);
	}
	
}
