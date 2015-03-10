package com.king.dao;

import java.util.List;

import com.king.pojo.PmInfo;

public interface pmDao {
	public  List<PmInfo> query();
	public void insertPm();
}
