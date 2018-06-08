package admin.basket.VO;

import java.util.Date;

public class BasketVO {

	private int basket_no; // 상품 번호
	private String basket_member_id;// 고객ID
	private int basket_goods_amount;// 상품가격
	private String basket_goods_size;// 상품사이즈
	private String basket_goods_color;// 상품 색상
	private String basket_goods_img;// 상품 이미지
	private int basket_quantity;// 상품수량
	private String basket_name;// 상품 이름

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public String getBasket_member_id() {
		return basket_member_id;
	}

	public void setBasket_member_id(String basket_member_id) {
		this.basket_member_id = basket_member_id;
	}

	public int getBasket_goods_amount() {
		return basket_goods_amount;
	}

	public void setBasket_goods_amount(int basket_goods_amount) {
		this.basket_goods_amount = basket_goods_amount;
	}

	public String getBasket_goods_size() {
		return basket_goods_size;
	}

	public void setBasket_goods_size(String basket_goods_size) {
		this.basket_goods_size = basket_goods_size;
	}

	public String getBasket_goods_color() {
		return basket_goods_color;
	}

	public void setBasket_goods_color(String basket_goods_color) {
		this.basket_goods_color = basket_goods_color;
	}

	public String getBasket_goods_img() {
		return basket_goods_img;
	}

	public void setBasket_goods_img(String basket_goods_img) {
		this.basket_goods_img = basket_goods_img;
	}

	public int getBasket_quantity() {
		return basket_quantity;
	}

	public void setBasket_quantity(int basket_quantity) {
		this.basket_quantity = basket_quantity;
	}

	public String getBasket_name() {
		return basket_name;
	}

	public void setBasket_name(String basket_name) {
		this.basket_name = basket_name;
	}

}