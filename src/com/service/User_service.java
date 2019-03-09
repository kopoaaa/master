package com.service;

import java.util.List;

import com.po.Food;
import com.po.Form;
import com.po.Form_Food;

public interface User_service
{
	
	int[] get_tables_number();
	
	void show_menu(Form form);

	List<Food> get_foodInfo();

	List<Food> search(Food food);

	List<Form> turn_personInfo(Form form);

	void update_form(Form form);

	void change_table_used(String table_id, String people_number);

	void end_form(String order_id);

	void change_table_free(String table_id);

	void update_form_food(List<Form_Food> list);
}
