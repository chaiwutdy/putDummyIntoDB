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
}
