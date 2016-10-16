package com.txsk.service.court;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.gson.JsonArray;
import com.txsk.dao.court.CourtDao;

@Service
public class CourtServiceImpl implements CourtService{

	@Autowired
	private CourtDao courtDao;
	
	@Override
	public JsonArray getData(String text) {
		return courtDao.getData(text);
		}

}
