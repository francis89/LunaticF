package spring.model.reserve_l;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Reserve_lDAO implements IReserve_lDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** junit test */
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public Reserve_lDTO readReply(int reserveno) {
		return sqlSession.selectOne("reserve_l.readReply", reserveno);
	}
	
	public boolean reply(Reserve_lDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("reserve_l.reply", dto);
		if(cnt > 0) flag = true;
		return flag;
	}

	@Override
	public boolean create(Object dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("reserve_l.create", dto);
		if(cnt > 0) flag = true;
		return flag;
	}


	@Override
	public List<Reserve_lDTO> list(Map map) {
		return sqlSession.selectList("reserve_l.list", map);
	}

	@Override
	public Object read(Object reserveno) {
		return sqlSession.selectOne("reserve_l.read", reserveno);
	}

	@Override
	public boolean update(Object dto) {
		boolean flag = false;
		int cnt = sqlSession.update("reserve_l.update", dto);
		if(cnt > 0) flag = true;
		return flag;
	}

	@Override
	public boolean delete(Object reserveno) {
		boolean flag = false;
		int cnt = sqlSession.delete("reserve_l.delete", reserveno);
		if(cnt > 0) flag = true;
		return flag;
	}

	@Override
	public void upViewcnt(int reserveno) {
		sqlSession.update("reserve_l.upViewcnt", reserveno);
	}

	@Override
	public void addAnsnum(Map map) {
		sqlSession.update("reserve_l.addAnsnum", map);
	}

	@Override
	public int total(Map map) {
			return sqlSession.selectOne("reserve_l.total", map);
	}

	@Override
	public boolean checkRefno(int reserveno) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("reserve_l.checkRefno", reserveno);
		if(cnt > 0) flag = true;
		return flag;
	}
}