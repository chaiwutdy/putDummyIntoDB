package com.pdidb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.pdidb.model.Field;
import com.pdidb.model.RowData;
import com.pdidb.sqlbuilder.SqlBuilder;

public interface DBMapper {
	static String getFieldByTableName = "SELECT COLUMN_NAME, DATA_TYPE, DATA_LENGTH, DATA_DEFAULT, NULLABLE FROM USER_TAB_COLUMNS WHERE TABLE_NAME = #{tableName} ORDER BY COLUMN_ID";
	
	@Results({
		@Result(property = "columnName",column = "COLUMN_NAME"),
		@Result(property = "dataType",column = "DATA_TYPE"),
		@Result(property = "dataLength",column = "DATA_LENGTH"),
		@Result(property = "dataDefault",column = "DATA_DEFAULT"),
		@Result(property = "nullable",column = "NULLABLE")
	})
	@Select(getFieldByTableName)
	public List<Field> getFieldByTableName(String tableName);
	
	@Results({
		@Result(property = "columnName",column = "COLUMN_NAME"),
		@Result(property = "dataType",column = "DATA_TYPE"),
		@Result(property = "dataLength",column = "DATA_LENGTH"),
		@Result(property = "dataDefault",column = "DATA_DEFAULT"),
		@Result(property = "nullable",column = "NULLABLE"),
		@Result(property = "comments",column = "COMMENTS")
	})
	@SelectProvider(type=SqlBuilder.class,method="getFieldByTableName")
	public List<Field> getFieldByTableName2(String tableName);
	
	@Results({
		@Result(property = "columnName",column = "COLUMN_NAME"),
//		@Result(property = "dataValue",column = "DATA_VALUE"),
		@Result(property = "dataType",column = "DATA_TYPE"),
		@Result(property = "dataLength",column = "DATA_LENGTH"),
		@Result(property = "dataDefault",column = "DATA_DEFAULT"),
		@Result(property = "nullable",column = "NULLABLE"),
		@Result(property = "comments",column = "COMMENTS")
	})
	@SelectProvider(type=SqlBuilder.class,method="getFieldValuesByTableName")
	public List<Field> getFieldValuesByTableName(String tableName, Field field);
	
	@InsertProvider(type=SqlBuilder.class,method="genInsertData")
	public int insertData(RowData rowData);
}
