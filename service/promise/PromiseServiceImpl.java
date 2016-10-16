package com.txsk.service.promise;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.gson.JsonArray;
import com.txsk.dao.promise.PromiseDao;

@Service
public class PromiseServiceImpl implements PromiseService{

	@Autowired
	private PromiseDao promiseDao;
	
	@Override
	public JsonArray getData(String queryNo) {
		return promiseDao.getData(queryNo);
		}

}
