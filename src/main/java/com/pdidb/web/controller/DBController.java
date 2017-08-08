package com.pdidb.web.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pdidb.constant.ViewResolverConstant;
import com.pdidb.model.Field;
import com.pdidb.model.RowData;
import com.pdidb.web.service.DBService;

@Controller
public class DBController {

	@Autowired
	private DBService dbService;
	
	@RequestMapping(value ="/addData" , method = RequestMethod.POST)
	public String addData(@ModelAttribute("rowData")RowData rowData, ModelMap model){
		String successMsg = null;
		String errorMsg = null;
		int rowInserted = 0;
		try{
			if(rowData.getFields() == null){
				throw new Exception("Insert noting");
			}
			
			rowInserted = dbService.addData(rowData);
			
			if(rowInserted>1){
				successMsg = rowInserted+" Rows";
			}else{
				successMsg = rowInserted+" Row";
			}
		}catch(Exception e){
			errorMsg = e.getMessage();
			e.printStackTrace();
		}
		
		dbService.setDataValueToDataDefault(rowData);
		model.addAttribute("rowData", rowData);
		model.addAttribute("successMsg", successMsg);
		model.addAttribute("errorMsg", errorMsg);
		return ViewResolverConstant.ADD_DATA;
	}
	
	
	@RequestMapping(value ="/getData" , method = RequestMethod.GET)
	public @ResponseBody List<RowData> getData(@RequestParam("tableName")String tableName) throws UnsupportedEncodingException{
		System.out.println(tableName);
		return dbService.getData(tableName);
	}
	
}
