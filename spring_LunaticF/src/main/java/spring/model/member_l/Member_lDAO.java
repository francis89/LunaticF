package spring.model.member_l;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Member_lDAO implements IMember_lDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** junit */
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public boolean create(Object dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.insert("member_l.create", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public List list(Map map){
		// TODO Auto-generated method stub
		return sqlSession.selectList("member_l.list", map);
	}

	@Override
	public Member_lDTO read(Object id){
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member_l.read", id);
	}

	@Override
	public boolean update(Object dto){
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.update("member_l.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public boolean delete(Object id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.delete("member_l.delete", id);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("member_l.total", map);
	}

	@Override
	public boolean passCheck(Map map) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.selectOne("member_l.passCheck", map);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt = sqlSession.selectOne("member_l.idCheck", id);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public boolean loginCheck(Map map) {
		// TODO Auto-generated method stub
		boolean flag = false;

		int cnt = sqlSession.selectOne("member_l.loginCheck", map);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	@Override
	public String getGrade(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member_l.getGrade", id);
	}

}
