package com.king.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.king.dao.pmDao;
import com.king.pojo.PmInfo;
import com.king.service.pmService;

public class pmServiceImpl implements pmService {
	private pmDao daoPm;

	public Map<String, Map<String, List>> queryPm() {
		System.out.println("Service");
		// daoPm.insertPm();
		List<PmInfo> list = daoPm.query();
		Map<String, Map<String, List>> map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			PmInfo vo = list.get(i);
			System.out.println(vo.getRq() + "||" + vo.getType() + "||"
					+ vo.getValue());

			Map<String, List> type = new HashMap();
			List<String> val = new ArrayList<String>();

			Map<String, List> old_rq = new HashMap();
			List<String> old_val = new ArrayList<String>();

			if (map.isEmpty()) {
				val.add(vo.getValue());
				type.put(vo.getType(), val);
				map.put(vo.getRq(), type);

				System.out.println("map is null :" + map.toString());
			} else {
				if (map.get(vo.getRq()) == null) {
					val.add(vo.getValue());
					old_rq.put(vo.getType(), val);
				} else {

					for (String datas : map.keySet()) {
						if (datas.equals(vo.getRq())) {
							// 获取map中的类型集合。
							old_rq = map.get(datas);
							if (!old_rq.isEmpty()) {
								old_val.add(vo.getValue());
								old_rq.put(vo.getType(), old_val);
							}
						}
					}
				}
				map.put(vo.getRq(), old_rq);
				old_rq = null;
				System.out.println("map is not :" + map.toString());
			}
		}
		System.out.println(" over :" + map.toString());
		return map;
	}

	public pmDao getDaoPm() {
		return daoPm;
	}

	public void setDaoPm(pmDao daoPm) {
		this.daoPm = daoPm;
	}

}
