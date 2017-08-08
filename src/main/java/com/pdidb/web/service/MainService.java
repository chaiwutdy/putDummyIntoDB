package com.pdidb.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.pdidb.mapper.DBMapper;
import com.pdidb.model.Field;
import com.pdidb.model.RowData;

@Component
public class MainService {

	@Autowired
	private DBMapper dbMapper;

	public RowData getRowData(String tableName){
		List<Field> fields = dbMapper.getFieldByTableName2(tableName);
		RowData rowData = new RowData();
		rowData.setTableName(tableName);
		rowData.setFields(fields);
		return rowData;
	}
}
