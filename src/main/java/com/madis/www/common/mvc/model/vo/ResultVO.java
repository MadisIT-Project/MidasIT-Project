package com.madis.www.common.mvc.model.vo;

public final class ResultVO {
	private String result;

	private Object data;

	public ResultVO() {
		this.result = "1000";
	}

	public ResultVO(String result) {
		this.result = result;
	}

	public ResultVO(String result, Object data) {
		this.result = result;
	}

	public ResultVO(Object data) {
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

	public void setData(Object data) {
		this.data = data;
	}
}
