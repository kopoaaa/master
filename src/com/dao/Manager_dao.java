package com.dao;

import java.util.List;

import com.po.Food;
import com.po.Form;
import com.po.Manager;
import com.po.Table;

public interface Manager_dao
{
	Manager login(Manager manager);

	List<Food> get_foodInfo();

	void delete_food(String food_id);

	void add_food(Food food);
	
	void update_food(Food food);

	List<Table> get_tableInfo();

	List<Form> get_formInfo();
	
	void delete_table(String table_id);
	
	void add_table(String table_id);
	
	void delete_form(String order_id);

	void delete_form_food(String order_id);
}
