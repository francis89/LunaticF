package spring.model.member_l;

import java.util.Map;

import spring.model.lfinder.DAOSTDInter;

public interface IMember_lDAO extends DAOSTDInter {
	boolean passCheck(Map map);
	
	boolean idCheck(String id);

	boolean loginCheck(Map map);
	
	String getGrade(String id);
	

}
