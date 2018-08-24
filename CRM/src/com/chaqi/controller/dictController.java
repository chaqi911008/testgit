package com.chaqi.controller;

import com.chaqi.entity.Bas_Dict;
import com.chaqi.service.impl.DictserviceImpl;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class dictController {
	@Autowired
	private DictserviceImpl dictserviceImpl;

	/**
	 * 进入到数据字典页面
	 * @param req
	 * @param now        当前页面
	 * @param size        每页显示的条数
	 * @param dict_type   类别
	 * @param dict_item   条目
	 * @param dict_value   值
	 * @return
	 */
	@RequestMapping("/dictServer")
	public String dictServer(HttpServletRequest req, String pageNow, String size, String dict_type, String dict_item, String  dict_value ){
		Page<Bas_Dict> bas=dictserviceImpl.selectUserPage(pageNow, size, dict_type, dict_item, dict_value);
		req.setAttribute("bas",bas);
		req.setAttribute("dict_type",dict_type);
		req.setAttribute("dict_item",dict_item);
		req.setAttribute("dict_value",dict_value);
		return "dict";
	}

	/**
	 * 删除字典信息
	 * @param mo
	 * @param id   字典编号
	 * @return
	 */
	@RequestMapping("/dalete")
	public String  dictLook(Model mo,Long id){
		dictserviceImpl.dalete(id);
		System.out.println(id);
		return "redirect:dictServer";
	}
	@ResponseBody
	@RequestMapping("/selectDice")
	public Object selectDice(){
		List<Bas_Dict> bas_dicts = dictserviceImpl.selectAll();
		return bas_dicts;
	}
}
