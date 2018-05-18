package com.madis.www.services;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madis.www.common.mvc.model.vo.ResultVO;
import com.madis.www.model.dao.UserInfoDao;
import com.madis.www.model.dto.UserInfo;

@Service("joinService")
public class JoinService {

	@Autowired
	private UserInfoDao userInfoDao;

	public ResultVO checkValidation(UserInfo info) {
		int cntUserId = userInfoDao.checkId(info);
		System.out.println("checkValidation: " + cntUserId);
		JSONObject resultJson = new JSONObject();
		resultJson.accumulate("id", cntUserId == 0);
//		resultJson.accumulate("password", "fdsa");
		
		return new ResultVO(resultJson);
	}

}
