package spring.model.memo_l;

import java.util.Map;

import spring.model.lfinder.DAOSTDInter;

public interface IMemo_lDAO extends DAOSTDInter {
	boolean passCheck(Map map);
	void upViewcnt(int pk);
}
