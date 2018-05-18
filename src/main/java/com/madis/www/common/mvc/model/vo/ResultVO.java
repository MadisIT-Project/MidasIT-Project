package com.madis.www.common.mvc.model.vo;

import org.json.JSONObject;

public final class ResultVO {
	private String result;

	private JSONObject data;

	public ResultVO() {
		this.result = "1000";
	}

	public ResultVO(String result) {
		this.result = result;
	}

	public ResultVO(String result, JSONObject data) {
		this.result = result;
		this.data = data;
	}

	public ResultVO(JSONObject data) {
		this();
		this.data = data;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Object getData() {
		return data;
	}

	public void setData(JSONObject data) {
		this.data = data;
	}

	public void put(String key, Object value) {
		if (this.data == null) {
			this.data = new JSONObject();
		}

		this.data.put(key, value);
	}

	public Object get(String key) {
		return this.data.get(key);
	}

	@Override
	public String toString() {
		StringBuffer buff = new StringBuffer();
		buff.append("{").append("\"result\":\"").append(this.result).append("\",").append("\"data\":")
				.append(this.data == null ? "{}" : this.data.toString()).append("}");
		return buff.toString();
	}
}
