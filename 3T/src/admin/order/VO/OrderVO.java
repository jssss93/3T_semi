package admin.order.VO;

import java.util.Date;

public class OrderVO {

	private int order_no;
	private String order_name;
	private String order_zipcode;
	private String order_address1;
	private String order_address2;
	private String order_phone1;
	private String order_phone2;
	private String order_phone3;
	private String order_email1;
	private String order_email2;

	private String recipient_name;
	private String recipient_zipcode;
	private String recipient_phone1;
	private String recipient_phone2;
	private String recipient_phone3;
	private String recipient_email1;
	private String recipient_email2;
	private String recipient_address1;
	private String recipient_address2;

	private String payment;
	private String deposit_name;
	private String deposit_bank;
	private Date order_regdate;
	private String order_img;
	private String order_state;
	private int order_total;
	private int order_price;
	private String order_member_id;
	private String order_goods_no;
	private String order_goods_name;
	private int order_goods_count;

	public String getRecipient_email1() {
		return recipient_email1;
	}

	public void setRecipient_email1(String recipient_email1) {
		this.recipient_email1 = recipient_email1;
	}

	public String getRecipient_email2() {
		return recipient_email2;
	}

	public void setRecipient_email2(String recipient_email2) {
		this.recipient_email2 = recipient_email2;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_zipcode() {
		return order_zipcode;
	}

	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}

	public String getOrder_address1() {
		return order_address1;
	}

	public void setOrder_address1(String order_address1) {
		this.order_address1 = order_address1;
	}

	public String getOrder_address2() {
		return order_address2;
	}

	public void setOrder_address2(String order_address2) {
		this.order_address2 = order_address2;
	}

	public String getOrder_phone1() {
		return order_phone1;
	}

	public void setOrder_phone1(String order_phone1) {
		this.order_phone1 = order_phone1;
	}

	public String getOrder_phone2() {
		return order_phone2;
	}

	public void setOrder_phone2(String order_phone2) {
		this.order_phone2 = order_phone2;
	}

	public String getOrder_phone3() {
		return order_phone3;
	}

	public void setOrder_phone3(String order_phone3) {
		this.order_phone3 = order_phone3;
	}

	public String getOrder_email1() {
		return order_email1;
	}

	public void setOrder_email1(String order_email1) {
		this.order_email1 = order_email1;
	}

	public String getOrder_email2() {
		return order_email2;
	}

	public void setOrder_email2(String order_email2) {
		this.order_email2 = order_email2;
	}

	public String getRecipient_name() {
		return recipient_name;
	}

	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}

	public String getRecipient_zipcode() {
		return recipient_zipcode;
	}

	public void setRecipient_zipcode(String recipient_zipcode) {
		this.recipient_zipcode = recipient_zipcode;
	}

	public String getRecipient_phone1() {
		return recipient_phone1;
	}

	public void setRecipient_phone1(String recipient_phone1) {
		this.recipient_phone1 = recipient_phone1;
	}

	public String getRecipient_phone2() {
		return recipient_phone2;
	}

	public void setRecipient_phone2(String recipient_phone2) {
		this.recipient_phone2 = recipient_phone2;
	}

	public String getRecipient_phone3() {
		return recipient_phone3;
	}

	public void setRecipient_phone3(String recipient_phone3) {
		this.recipient_phone3 = recipient_phone3;
	}

	public String getRecipient_address1() {
		return recipient_address1;
	}

	public void setRecipient_address1(String recipient_address1) {
		this.recipient_address1 = recipient_address1;
	}

	public String getRecipient_address2() {
		return recipient_address2;
	}

	public void setRecipient_address2(String recipient_address2) {
		this.recipient_address2 = recipient_address2;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getDeposit_name() {
		return deposit_name;
	}

	public void setDeposit_name(String deposit_name) {
		this.deposit_name = deposit_name;
	}

	public String getDeposit_bank() {
		return deposit_bank;
	}

	public void setDeposit_bank(String deposit_bank) {
		this.deposit_bank = deposit_bank;
	}

	public Date getOrder_regdate() {
		return order_regdate;
	}

	public void setOrder_regdate(Date order_regdate) {
		this.order_regdate = order_regdate;
	}

	public String getOrder_img() {
		return order_img;
	}

	public void setOrder_img(String order_img) {
		this.order_img = order_img;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public int getOrder_total() {
		return order_total;
	}

	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public String getOrder_member_id() {
		return order_member_id;
	}

	public void setOrder_member_id(String order_member_id) {
		this.order_member_id = order_member_id;
	}

	public String getOrder_goods_no() {
		return order_goods_no;
	}

	public void setOrder_goods_no(String order_goods_no) {
		this.order_goods_no = order_goods_no;
	}

	public String getOrder_goods_name() {
		return order_goods_name;
	}

	public void setOrder_goods_name(String order_goods_name) {
		this.order_goods_name = order_goods_name;
	}

	public int getOrder_goods_count() {
		return order_goods_count;
	}

	public void setOrder_goods_count(int order_goods_count) {
		this.order_goods_count = order_goods_count;
	}

}