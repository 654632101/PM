package com.king.action;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.king.service.pmService;
import com.opensymphony.xwork2.ActionSupport;

public class queryAction extends ActionSupport {
	private String name;

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private Map<String, Map<String, List>> map;

	public Map<String, Map<String, List>> getMap() {
		return map;
	}

	public void setMap(Map<String, Map<String, List>> map) {
		this.map = map;
	}

	private pmService servicepm;

	public String gatQuery() {
		System.out.println("ddd");
		this.map = servicepm.queryPm();
		JSONArray jsonObject = JSONArray.fromObject(map);
		System.out.println("返回Action");
		System.out.println(map);
		// this.name = "p_l";
		this.name = jsonObject.toString();
		return SUCCESS;
	}

	public String gotoUrl() {
		System.out.println("传来的值 : " + this.title);
		return "SUCC";
	}

	// public pmService getServicepm() {
	// return servicepm;
	// }

	public void setServicepm(pmService servicepm) {
		this.servicepm = servicepm;
	}

}
