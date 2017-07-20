package com.pdidb.web.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.pdidb.mapper.DBMapper;
import com.pdidb.model.Field;
import com.pdidb.model.RowData;
import com.pdidb.util.Utils;

@Component
public class DBService {
	
	@Autowired
	private DBMapper dbMapper;

	public int addData(RowData rowData){
		int result = 0;
		if(checkCreateMultiRow(rowData.getFields())){
			result = insertMultiRow(rowData);
		}else{
			result = dbMapper.insertData(rowData);
		}
		return result;
	}
	
	private int insertMultiRow(RowData rowData){
		List<Field> cloneFields = Utils.cloneList(rowData.getFields());
		int result = 0;
		
		List<RowData> rowDatas =  new ArrayList<RowData>();
		for(Field field:cloneFields){
			if( "Y".equalsIgnoreCase(field.getMultiRow()) ){
				RowData row = null;
				String[] values =  field.getDataValue().split(",");
				for(String value:values){
					if(value!=null && !value.isEmpty()){
						field.setDataValue(value.replaceAll("\\s+", ""));
						field.setMultiRow(null);
						List<Field> cloneFields2 = new ArrayList<Field>();
						for(Field item:cloneFields){
							cloneFields2.add(item.clone());
						}
						row = new RowData();
						row.setFields(cloneFields2);
						row.setTableName(rowData.getTableName());
						rowDatas.add(row);
					}
				}
				
			}
		}
		
		for(RowData row:rowDatas){
			result += dbMapper.insertData(row);
		}
		return result;
	}
	
	private boolean checkCreateMultiRow(List<Field> fields){
		if(fields != null){
			for(Field field:fields){
				if( field != null && "Y".equalsIgnoreCase(field.getMultiRow()) ){
					return true;
				}
			}
		}
		return false;
	}
	
	public void setDataValueToDataDefault(RowData row){
		if(row.getFields()!=null){
			for(Field field:row.getFields()){
				field.setDataDefault(field.getDataValue());
			}
		}
	}
}
