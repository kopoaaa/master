package com.po;

public class Food {
	int food_id;
	String food_name;
	float food_price;
	String food_img;
	String food_amount;
	

	public String getFood_amount() {
		return food_amount;
	}

	public void setFood_amount(String food_amount) {
		this.food_amount = food_amount;
	}

	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	
	public int getFood_id() {
		return food_id;
	}

	public String getFood_img() {
		return food_img;
	}

	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public float getFood_price() {
		return food_price;
	}

	public void setFood_price(float food_price) {
		this.food_price = food_price;
	}
}
