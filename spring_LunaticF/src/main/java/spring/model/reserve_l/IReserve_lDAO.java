package spring.model.reserve_l;

import java.util.Map;

import spring.model.lfinder.DAOSTDInter;

public interface IReserve_lDAO extends DAOSTDInter {
	
	void upViewcnt(int reserveno);
	void addAnsnum(Map map);
	boolean checkRefno(int reserveno);

}