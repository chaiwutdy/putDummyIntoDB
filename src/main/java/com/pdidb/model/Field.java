package com.pdidb.model;

public class Field implements Cloneable{
	private String columnName;
	private String dataType;
	private String dataLength;
	private String dataDefault;
	private String nullable;
	private String comments;
	private String dataValue;
	private String autoGenId;
	private String multiRow;
	
	@Override
	public Field clone() {
		try{
			return (Field)super.clone();
		}catch(CloneNotSupportedException e){
			e.printStackTrace();
			throw new Error("Something impossible just happened");
		}
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getDataLength() {
		return dataLength;
	}
	public void setDataLength(String dataLength) {
		this.dataLength = dataLength;
	}
	public String getDataDefault() {
		return dataDefault;
	}
	public void setDataDefault(String dataDefault) {
		this.dataDefault = dataDefault;
	}
	public String getNullable() {
		return nullable;
	}
	public void setNullable(String nullable) {
		this.nullable = nullable;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getDataValue() {
		return dataValue;
	}
	public void setDataValue(String dataValue) {
		this.dataValue = dataValue;
	}
	public String getAutoGenId() {
		return autoGenId;
	}
	public void setAutoGenId(String autoGenId) {
		this.autoGenId = autoGenId;
	}
	public String getMultiRow() {
		return multiRow;
	}
	public void setMultiRow(String multiRow) {
		this.multiRow = multiRow;
	}
}
