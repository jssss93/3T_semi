package user.basket;

import java.util.Date;

public class BasketVO {

	private int BASKET_NO; // 상품 번호
	private String BASKET_MEMBER_ID;// 고객ID
	private int BASKET_GOODS_AMOUNT;// 상품가격
	private String BASKET_GOODS_SIZE;// 상품사이즈
	private String BASKET_GOODS_COLOR;// 상품 색상
	private String BASKET_GOODS_img;// 상품 이미지
	private int BASKET_QUANTITY;// 상품수량
	private String BASKET_NAME;// 상품 이름

	public int getBASKET_NO() {
		return BASKET_NO;
	}

	public void setBASKET_NO(int bASKET_NO) {
		BASKET_NO = bASKET_NO;
	}

	public String getBASKET_MEMBER_ID() {
		return BASKET_MEMBER_ID;
	}

	public void setBASKET_MEMBER_ID(String bASKET_MEMBER_ID) {
		BASKET_MEMBER_ID = bASKET_MEMBER_ID;
	}

	public int getBASKET_GOODS_AMOUNT() {
		return BASKET_GOODS_AMOUNT;
	}

	public void setBASKET_GOODS_AMOUNT(int bASKET_GOODS_AMOUNT) {
		BASKET_GOODS_AMOUNT = bASKET_GOODS_AMOUNT;
	}

	public String getBASKET_GOODS_SIZE() {
		return BASKET_GOODS_SIZE;
	}

	public void setBASKET_GOODS_SIZE(String bASKET_GOODS_SIZE) {
		BASKET_GOODS_SIZE = bASKET_GOODS_SIZE;
	}

	public String getBASKET_GOODS_COLOR() {
		return BASKET_GOODS_COLOR;
	}

	public void setBASKET_GOODS_COLOR(String bASKET_GOODS_COLOR) {
		BASKET_GOODS_COLOR = bASKET_GOODS_COLOR;
	}

	public String getBASKET_GOODS_img() {
		return BASKET_GOODS_img;
	}

	public void setBASKET_GOODS_img(String bASKET_GOODS_img) {
		BASKET_GOODS_img = bASKET_GOODS_img;
	}

	public int getBASKET_QUANTITY() {
		return BASKET_QUANTITY;
	}

	public void setBASKET_QUANTITY(int bASKET_QUANTITY) {
		BASKET_QUANTITY = bASKET_QUANTITY;
	}

	public String getBASKET_NAME() {
		return BASKET_NAME;
	}

	public void setBASKET_NAME(String bASKET_NAME) {
		BASKET_NAME = bASKET_NAME;
	}

}