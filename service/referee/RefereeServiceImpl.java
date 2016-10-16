package com.txsk.service.referee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.txsk.dao.referee.RefereeDao;

@Service
public class RefereeServiceImpl implements RefereeService{

	@Autowired
	private RefereeDao refereeDao;
	
	@Override
	public JsonArray getData(String text) {
		return refereeDao.getData(text);
		}

}
