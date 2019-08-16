package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Food;
import com.po.Form;
import com.po.Manager;
import com.po.Table;
import com.service.Manager_service;
import com.service.User_service;


@Controller
public class Manager_controller
{
	@Autowired
	private Manager_service manager_service;
	@Autowired
	private User_service user_service;

	@RequestMapping("/login")//管理员登录
	public String manager_login(Model model,Manager manager,HttpSession session)
	{
		//将管理员输入的账号和密码封装成manager对象访问数据库信息
		Manager manager1 = manager_service.login(manager);
			
		//访问数据库得到总菜谱信息，用于展示
		List<Food> food_list=manager_service.get_foodInfo();
		model.addAttribute("menuList", food_list);
		
		//判断登录信息是否正确，正确则登录，并设置session通知拦截器不用拦截此请求。错误则返回登录界面
		if (manager1 != null) {	
			session.setAttribute("LOGIN_USER", manager);			
			return "manage_menu";
		} else {
			return "redirect:/manager_login.jsp";
		}
	}
	
	@RequestMapping("/turn_manage_menu")//跳转至菜单管理界面
	public String turn_manage_menu(Model model)
	{
		//访问数据库得到总菜谱信息，用于展示hhhh
		List<Food> food_list=manager_service.get_foodInfo();
		model.addAttribute("menuList", food_list);
		
		return "manage_menu";
	}
	
	@RequestMapping("/turn_manage_table")//跳转至餐桌管理页面
	public String turn_manage_table(Model model)
	{
		//访问数据库得到所有餐桌信息，用于展示
		List<Table> table_list=manager_service.get_tableInfo();
		model.addAttribute("table_list", table_list);
		return  "manage_table";
	}
	
	@RequestMapping("/turn_manage_form")//跳转至订单管理页面
	public String turn_manage_form(Model model)
	{
		//得到所有订单信息
		List<Form> form_list1=manager_service.get_FormInfo();
		
		//将订单信息整合，用于展示
		Map<String,Form> map = new TreeMap<String, Form>();
		
		for (Form form : form_list1) {
			
			Form form1 = map.get(form.getOrder_id());
			if(form1 != null){
				Food food = new Food();
				food.setFood_id(form.getFood_id());
				food.setFood_name(form.getFood_name());
				food.setFood_amount(form.getAmount());
				form1.getList().add(food);
			}else{
				form1 = new Form();
				form1.setOrder_id(form.getOrder_id());
				form1.setPeople_number(form.getPeople_number());
				form1.setTable_id(form.getTable_id());
				form1.setEvaluate(form.getEvaluate());
				form1.setIs_accounted(form.getIs_accounted());
				form1.setTime(form.getTime());
				form1.setSum(form.getSum());
				Food food = new Food();
				food.setFood_id(form.getFood_id());
				food.setFood_name(form.getFood_name());
				food.setFood_amount(form.getAmount());
				List<Food> food_list = new ArrayList<Food>();
				food_list.add(food);
				form1.setList(food_list);
			}
			map.put(form.getOrder_id(), form1);
		}
		
		model.addAttribute("form_list", map);
		return "manage_form";
	}
	
	
	
	@RequestMapping("/delete_food")//删除菜式
	public String delete_food(Model model, String food_id)
	{
		manager_service.delete_food(food_id);
		return turn_manage_menu(model);
	}
	
	@RequestMapping("/add_food")//增加菜式
	public String add_food(Model model, Food food)
	{
		manager_service.add_food(food);
		return turn_manage_menu(model);
	}
	
	@RequestMapping("/update_food")//编辑更新菜式
	public String update_food(Model model, Food food)
	{
		manager_service.update_food(food);
		return turn_manage_menu(model);
	}
	
	@RequestMapping("/delete_table")//删除餐桌
	public String delete_table(Model model, String table_id)
	{
		manager_service.delete_table(table_id);
		return turn_manage_table(model);
	}
	
	@RequestMapping("/add_table")//增加餐桌	
	public String add_table(Model model, String table_id)
	{
		manager_service.add_table(table_id);
		return turn_manage_table(model);
	}
	
	@RequestMapping("/delete_form")//删除订单
	public String delete_forms(Model model, String order_id, String table_id)
	{
		manager_service.delete_form_food(order_id);
		manager_service.delete_form(order_id);
		user_service.change_table_free(table_id);
		
		return turn_manage_form(model);
	}
	
	
}