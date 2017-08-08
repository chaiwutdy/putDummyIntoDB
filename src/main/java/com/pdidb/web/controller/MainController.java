package com.pdidb.web.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pdidb.constant.ViewResolverConstant;
import com.pdidb.model.RowData;
import com.pdidb.web.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;

	@RequestMapping(value ="/" , method = RequestMethod.GET)
	public String indexPage(ModelMap model){
		model.addAttribute("message", "Spring 3 MVC Hello World");
		return ViewResolverConstant.INDEX_PAGE;
	}
	
	@RequestMapping(value ="/getFields" , method = RequestMethod.GET)
	public String getFields(@RequestParam("tableName") String tableName, ModelMap model) throws UnsupportedEncodingException{
		RowData rowData = mainService.getRowData(tableName);
		model.addAttribute("rowData", rowData);
		return ViewResolverConstant.ADD_DATA;
	}
	
}
