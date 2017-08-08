package com.pdidb.sqlbuilder;

import java.util.UUID;

import com.pdidb.model.Field;
import com.pdidb.model.RowData;

public class SqlBuilder {

	@SuppressWarnings("static-access")
	public String genInsertData(RowData rowData){
		StringBuffer statment = new StringBuffer();
		statment.append("INSERT INTO "+rowData.getTableName()+" VALUES(");
		for(Field field:rowData.getFields()){
			
			if( "Y".equalsIgnoreCase(field.getAutoGenId()) ){
				field.setDataValue(new UUID(32, 32).randomUUID().toString());
			}
			
			if(field.getDataType().contains("VARCHAR")){
				statment.append("'"+field.getDataValue()+"'");
			}else{
				statment.append(field.getDataValue());
			}
			
			if(field != rowData.getFields().get(rowData.getFields().size()-1)){
				statment.append(",");
			}
		}
		statment.append(")");
		System.out.println(statment.toString());
		return statment.toString();
	}
	
	public String getFieldByTableName(String tableName){
		StringBuffer statment = new StringBuffer();
		statment.append("SELECT cl.COLUMN_NAME, ");
		statment.append("	cl.DATA_TYPE, ");
		statment.append("	cl.DATA_LENGTH, ");
		statment.append("	cl.DATA_DEFAULT, ");
		statment.append("	cl.NULLABLE, ");
		statment.append("	cm.COMMENTS ");
		statment.append("FROM USER_TAB_COLUMNS cl ");
		statment.append("LEFT JOIN USER_COL_COMMENTS cm  ");
		statment.append("ON cl.TABLE_NAME = cm.TABLE_NAME ");
		statment.append("AND cl.COLUMN_NAME = cm.COLUMN_NAME ");
		statment.append("WHERE cl.TABLE_NAME = '"+tableName+"'  ");
		statment.append("ORDER BY cl.COLUMN_ID ");
		System.out.println(statment.toString());
		return statment.toString();
	}
	
	public String getFieldValuesByTableName(String tableName, Field field){
		StringBuffer statment = new StringBuffer();
//		statment.append("SELECT COLUMN_NAME,  DATA_VALUE FROM( ");
		statment.append(" SELECT '"+field.getColumnName()+"' as obj.COLUMN_NAME, ");
		statment.append(field.getColumnName()+" as obj.DATA_VALUE ");
		statment.append("FROM  "+tableName+" obj  ORDER BY obj.ROWID DESC ");
//		statment.append(") WHERE ROWNUM <= 2 ");
		System.out.println(statment.toString());
		return statment.toString();
	}
	

}
