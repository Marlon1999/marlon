package com.txsk.service.undertaker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.gson.JsonArray;
import com.txsk.dao.undertaker.HttpDao;

@Service
public class HttpServiceImpl implements HttpService{

	@Autowired
	private HttpDao httpDao;
	
	@Override
	public JsonArray getData(String queryNo) {
		return httpDao.getData(queryNo);
		}

}
