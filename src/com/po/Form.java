package com.po;

import java.util.List;

public class Form
{
	String order_id;
	String people_number;
	String table_id;
	String evaluate;
	String is_accounted;
	String time;
	Float sum;
	
	int food_id;
	String food_name;
	String amount;
	
	List<Food> list;
	
	public List<Food> getList() {
		return list;
	}
	public void setList(List<Food> list) {
		this.list = list;
	}
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getPeople_number() {
		return people_number;
	}
	public void setPeople_number(String people_number) {
		this.people_number = people_number;
	}
	public String getTable_id() {
		return table_id;
	}
	public void setTable_id(String table_id) {
		this.table_id = table_id;
	}
	public String getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}
	public String getIs_accounted() {
		return is_accounted;
	}
	public void setIs_accounted(String is_accounted) {
		this.is_accounted = is_accounted;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Float getSum() {
		return sum;
	}
	public void setSum(Float sum) {
		this.sum = sum;
	}
	
	
}
