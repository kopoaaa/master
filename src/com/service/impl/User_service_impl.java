package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.User_dao;
import com.po.Food;
import com.po.Form;
import com.po.Form_Food;
import com.service.User_service;


@Service
@Transactional
public class User_service_impl implements User_service {
	@Autowired
	private User_dao user_dao;
	
	public int[] get_tables_number() {
		// TODO Auto-generated method stub
		return user_dao.get_tables_number();
	}
	
	public void show_menu(Form form) 
	{
		// TODO Auto-generated method stub
		user_dao.show_menu(form);
	}

	public List<Food> get_foodInfo() {
		// TODO Auto-generated method stub
		return user_dao.get_foodInfo();
	}

	public List<Food> search(Food food) {
		// TODO Auto-generated method stub
		return user_dao.search(food);
	}

	public List<Form> turn_personInfo(Form form) {
		// TODO Auto-generated method stub
		return user_dao.turn_personInfo(form);
	}

	public void update_form(Form form) {
		// TODO Auto-generated method stub
		user_dao.update_form(form);
		
	}

	public void change_table_used(String table_id, String people_number) {
		// TODO Auto-generated method stub
		user_dao.change_table_used(table_id, people_number);
		
		
	}

	public void end_form(String order_id) {
		// TODO Auto-generated method stub
		user_dao.end_form(order_id);
		
	}

	public void change_table_free(String table_id) {
		// TODO Auto-generated method stub
		user_dao.change_table_free(table_id);
	}

	public void update_form_food(List<Form_Food> list) {
		// TODO Auto-generated method stub
		user_dao.update_form_food(list);
	}

}
