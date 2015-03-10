package com.king.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.king.dao.pmDao;
import com.king.pojo.PmInfo;

public class pmDaoImpl extends SqlMapClientDaoSupport implements pmDao {
	public List<PmInfo> query() {
		System.out.println("dao");
		PmInfo vo = new PmInfo();
		List<PmInfo> pmList = getSqlMapClientTemplate().queryForList("query");
		System.out.println(pmList.size());
		return pmList;
	}
	public void insertPm(){
		PmInfo vo = new PmInfo();
		vo.setId("1");
		vo.setRq("2015-01-01");
		vo.setType("PM25");
		vo.setValue("300");
		Object flag = getSqlMapClientTemplate().insert("inpm", vo);
	}
}
