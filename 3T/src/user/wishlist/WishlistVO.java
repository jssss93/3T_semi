package user.wishlist;

import java.util.Date;

public class WishlistVO {
	
	private int W_NO;
	private String W_MEMBER_ID;
	private String W_GOODS_NAME;
	private int  W_GOODS_AMOUNT;
	private String W_GOODS_IMG;
	private int  W_TOTAL;
	private String W_SELECT;
	
	public int getW_NO() {
		return W_NO;
	}
	public void setW_NO(int w_NO) {
		W_NO = w_NO;
	}
	public String getW_MEMBER_ID() {
		return W_MEMBER_ID;
	}
	public void setW_MEMBER_ID(String w_MEMBER_ID) {
		W_MEMBER_ID = w_MEMBER_ID;
	}
	public int getW_GOODS_AMOUNT() {
		return W_GOODS_AMOUNT;
	}
	public void setW_GOODS_AMOUNT(int w_GOODS_AMOUNT) {
		W_GOODS_AMOUNT = w_GOODS_AMOUNT;
	}
	public String getW_GOODS_IMG() {
		return W_GOODS_IMG;
	}
	public void setW_GOODS_IMG(String w_GOODS_IMG) {
		W_GOODS_IMG = w_GOODS_IMG;
	}
	public int getW_TOTAL() {
		return W_TOTAL;
	}
	public void setW_TOTAL(int w_TOTAL) {
		W_TOTAL = w_TOTAL;
	}
	public String getW_SELECT() {
		return W_SELECT;
	}
	public void setW_SELECT(String w_SELECT) {
		W_SELECT = w_SELECT;
	}
	public String getW_GOODS_NAME() {
		return W_GOODS_NAME;
	}
	public void setW_GOODS_NAME(String w_GOODS_NAME) {
		W_GOODS_NAME = w_GOODS_NAME;
	}
	
}