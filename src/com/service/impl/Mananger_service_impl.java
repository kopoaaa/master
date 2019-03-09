package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.Manager_dao;
import com.po.Food;
import com.po.Form;
import com.po.Manager;
import com.po.Table;
import com.service.Manager_service;

@Service
@Transactional
public class Mananger_service_impl implements Manager_service {
	@Autowired
	private Manager_dao manager_dao;

	@Override
	public Manager login(Manager manager) {
		// TODO Auto-generated method stub
		return manager_dao.login(manager);
	}

	@Override
	public List<Food> get_foodInfo() {
		// TODO Auto-generated method stub
		return manager_dao.get_foodInfo();
	}

	@Override
	public void delete_food(String food_id) {
		// TODO Auto-generated method stub
		manager_dao.delete_food(food_id);
	}

	@Override
	public void add_food(Food food) {
		// TODO Auto-generated method stub
		manager_dao.add_food(food);
	}

	@Override
	public void update_food(Food food) {
		// TODO Auto-generated method stub
		manager_dao.update_food(food);
	}

	@Override
	public List<Table> get_tableInfo() {
		// TODO Auto-generated method stub
		return manager_dao.get_tableInfo();
	}

	@Override
	public List<Form> get_FormInfo() {
		// TODO Auto-generated method stub
		return manager_dao.get_formInfo();
	}

	@Override
	public void delete_table(String table_id) {
		// TODO Auto-generated method stub
		manager_dao.delete_table(table_id);

	}

	@Override
	public void add_table(String table_id) {
		// TODO Auto-generated method stub
		manager_dao.add_table(table_id);
	}

	@Override
	public void delete_form_food(String order_id) {
		// TODO Auto-generated method stub
		manager_dao.delete_form_food(order_id);
	}

	@Override
	public void delete_form(String order_id) {
		// TODO Auto-generated method stub
		manager_dao.delete_form(order_id);
	}

}
