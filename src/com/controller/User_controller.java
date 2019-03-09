package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.po.Food;
import com.po.Form;
import com.po.Form_Food;
import com.service.User_service;

@Controller
public class User_controller
{
	@Autowired
	private User_service user_service;
	
	
	@RequestMapping("/user_choose")//用户选择就餐信息
	public String user_choose(Model model){
		
		//获取未被占用的餐桌
		int[] tablesNumber = user_service.get_tables_number();
		//可选择的人数
		int[] peopleNumber = {1,2,3,4,5,6};
		model.addAttribute("tableNumber", tablesNumber);
		model.addAttribute("peopleNumber", peopleNumber);
		return "user_choose";
	}
	
	
	@RequestMapping("/show_menu")//展示总菜谱
	public String show_menu(Model model, String people_number, String table_id, String order_id) 
	{	
		//将用户选择的就餐信息用form对象封装，初始化当前订单
		Form form = new Form();
		form.setPeople_number(people_number);
		form.setTable_id(table_id);
		form.setOrder_id(order_id);
		form.setIs_accounted("未结账");
		user_service.show_menu(form); 
		
		//将当前订单所占用的餐桌的状态从“未占用”改为“已占用”
		user_service.change_table_used(table_id, people_number); 
		
		//访问数据库得到总菜谱信息和用户选择信息，封装在model中传进jsp页面用于展示
		List<Food> food_list=user_service.get_foodInfo(); 
		model.addAttribute("menuList", food_list);
		model.addAttribute("people_number", form.getPeople_number());
		model.addAttribute("table_id", form.getTable_id());
		model.addAttribute("order_id",form.getOrder_id());
		model.addAttribute("is_accounted",form.getIs_accounted());
		
		//跳转到show_menu.jsp界面
		return "show_menu";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)//菜式搜索
	public String search(Model model, String food1, String order_id, String table_id, String sum, String menuListed) throws UnsupportedEncodingException
	{
		//将对要搜索的菜进行菜名的模糊搜索
		Food food = new Food();
		food.setFood_name(food1);
		List<Food> menuList=user_service.search(food); 
		
		//将已选菜单进行封装
		List<Food> list = formatListed(menuListed);
		
		//将菜单信息传至jsp页面用于展示
		model.addAttribute("menuList", menuList);
		model.addAttribute("order_id", order_id);
		model.addAttribute("table_id", table_id);
		model.addAttribute("sum",sum);
		model.addAttribute("menuListed",list);
		
		//跳转至show_menu.jsp页面
		return "show_menu";
	}


	
	@RequestMapping("/person_info")//个人中心
	public String turn_personInfo(Model model, String order_id, String table_id,String sum, String menuListed){
		//将页面传进来的个人信息用form对象进行封装，用于展示
		Form form=new Form();
		form.setOrder_id(order_id);
		List<Food> list = formatListed(menuListed);
		List<Form> form_list= user_service.turn_personInfo(form); 

		model.addAttribute("order_id", form_list.get(0).getOrder_id());
		model.addAttribute("people", form_list.get(0).getPeople_number());
		model.addAttribute("table", form_list.get(0).getTable_id());
		model.addAttribute("is_accounted", form_list.get(0).getIs_accounted());
		
		model.addAttribute("table_id", table_id);
		model.addAttribute("sum",sum);
		model.addAttribute("menuListed",list);
		
		return "person_info";
	}
	
	@RequestMapping("/return_show_menu")//返回展示菜单页面
	public String return_show_menu(Model model, String order_id, String table_id,String sum,String menuListed)
	{
		//重新加载总菜谱信息
		List<Food> food_list=user_service.get_foodInfo();
		//重新整合已选菜单信息
		List<Food> list = formatListed(menuListed);
		model.addAttribute("menuList", food_list);
		model.addAttribute("order_id", order_id);
		model.addAttribute("table_id", table_id);
		model.addAttribute("sum",sum);
		model.addAttribute("menuListed",list);
		
		return "show_menu";
	}
	
	@RequestMapping("/submit_form")//提交订单
	public String submit_form(Model model, Form form, String food_list)
	{
		//将传进来的已选菜单字符串封装成数组
		String [] food_list1=food_list.split(",");
		List<Form_Food> list = new ArrayList<Form_Food>();
		
		//将数组的元素使用对应的set方法将其赋值到相对应的Form_Food对象的属性中
		int i=0;
		while(i+1<food_list1.length)
		{
			Form_Food form_food=new Form_Food();
			form_food.setOrder_id(form.getOrder_id());
			form_food.setFood_id(Integer.parseInt(food_list1[i]));
			form_food.setAmount(food_list1[i+1]);
			list.add(form_food);
			i=i+2;
		}
		
		//根据封装好的list访问数据库并更新Form_Food表的数据
		user_service.update_form_food(list);
		
		//再更新form表数据
		user_service.update_form(form);
		model.addAttribute("sum", form.getSum());
		model.addAttribute("order_id", form.getOrder_id());
		model.addAttribute("table_id", form.getTable_id());
		return "wait_account";

	}

	@RequestMapping("/end_meal")//订单结束
	public String end_meal(String order_id, String table_id)
	{
		//订单结束，修改form表信息
		user_service.end_form(order_id);
		
		//订单结束，修改table表信息
		user_service.change_table_free(table_id);
		return "end";
	}
	
	private List<Food> formatListed(String menuListed) {
		String [] food_list1=menuListed.split(",");
		List<Food> list = new ArrayList<Food>();
		int i=0;
		while(i+5<food_list1.length)
		{
			Food fooded=new Food();
			fooded.setFood_id(Integer.parseInt(food_list1[i]));
			fooded.setFood_name(food_list1[i+1].replace("x", ""));
			Float price = Float.parseFloat(food_list1[i+2]);
			fooded.setFood_price(price);
			
			fooded.setFood_img(food_list1[i+3]+","+food_list1[i+4]);
			//int amount =Integer.parseInt(food_list1[i+5]);
			fooded.setFood_amount(food_list1[i+5]);
			list.add(fooded);
			i=i+6;
		}
		return list;
	}

}
