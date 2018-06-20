package user.order;

import java.util.Date;

public class OrderVO {
	
	private int ORDER_NO;
	private String ORDER_NAME;
	private String ORDER_ZIPCODE;
	private String ORDER_ADDRESS1;
	private String ORDER_ADDRESS2;
	private String ORDER_PHONE1;
	private String ORDER_PHONE2;
	private String ORDER_PHONE3;
	private String ORDER_EMAIL1;
	private String ORDER_EMAIL2;
	
	private String RECIPIENT_NAME;
	private String RECIPIENT_ZIPCODE;
	private String RECIPIENT_PHONE1;
	private String RECIPIENT_PHONE2;
	private String RECIPIENT_PHONE3;
	private String RECIPIENT_ADDRESS1;
	private String RECIPIENT_ADDRESS2;

	private String PAYMENT;
	private String DEPOSIT_NAME;
	private String DEPOSIT_BANK;
	private Date ORDER_REGDATE;
	private String ORDER_IMG;
	private String ORDER_STATE;
	private String ORDER_TOTAL;
	private int ORDER_PRICE;
	private String ORDER_MEMBER_ID;
	private String ORDER_GOODS_NO;
	private String ORDER_GOODS_NAME;
	private String ORDER_GOODS_COUNT;
	

	public int getORDER_NO() {
		return ORDER_NO;
	}
	public void setORDER_NO(int oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
	public String getORDER_NAME() {
		return ORDER_NAME;
	}
	public void setORDER_NAME(String oRDER_NAME) {
		ORDER_NAME = oRDER_NAME;
	}
	public String getORDER_ZIPCODE() {
		return ORDER_ZIPCODE;
	}
	public void setORDER_ZIPCODE(String oRDER_ZIPCODE) {
		ORDER_ZIPCODE = oRDER_ZIPCODE;
	}


	public String getRECIPIENT_NAME() {
		return RECIPIENT_NAME;
	}
	public void setRECIPIENT_NAME(String rECIPIENT_NAME) {
		RECIPIENT_NAME = rECIPIENT_NAME;
	}
	public String getRECIPIENT_ZIPCODE() {
		return RECIPIENT_ZIPCODE;
	}
	public void setRECIPIENT_ZIPCODE(String rECIPIENT_ZIPCODE) {
		RECIPIENT_ZIPCODE = rECIPIENT_ZIPCODE;
	}

	public String getPAYMENT() {
		return PAYMENT;
	}
	public void setPAYMENT(String pAYMENT) {
		PAYMENT = pAYMENT;
	}
	public String getDEPOSIT_NAME() {
		return DEPOSIT_NAME;
	}
	public void setDEPOSIT_NAME(String dEPOSIT_NAME) {
		DEPOSIT_NAME = dEPOSIT_NAME;
	}
	public String getDEPOSIT_BANK() {
		return DEPOSIT_BANK;
	}
	public void setDEPOSIT_BANK(String dEPOSIT_BANK) {
		DEPOSIT_BANK = dEPOSIT_BANK;
	}
	public Date getORDER_REGDATE() {
		return ORDER_REGDATE;
	}
	public void setORDER_REGDATE(Date oRDER_REGDATE) {
		ORDER_REGDATE = oRDER_REGDATE;
	}
	public String getORDER_IMG() {
		return ORDER_IMG;
	}
	public void setORDER_IMG(String oRDER_IMG) {
		ORDER_IMG = oRDER_IMG;
	}
	public String getORDER_STATE() {
		return ORDER_STATE;
	}
	public void setORDER_STATE(String oRDER_STATE) {
		ORDER_STATE = oRDER_STATE;
	}

	public String getORDER_TOTAL() {
		return ORDER_TOTAL;
	}
	public void setORDER_TOTAL(String oRDER_TOTAL) {
		ORDER_TOTAL = oRDER_TOTAL;
	}
	public int getORDER_PRICE() {
		return ORDER_PRICE;
	}
	public void setORDER_PRICE(int oRDER_PRICE) {
		ORDER_PRICE = oRDER_PRICE;
	}
	public String getORDER_MEMBER_ID() {
		return ORDER_MEMBER_ID;
	}
	public void setORDER_MEMBER_ID(String oRDER_MEMBER_ID) {
		ORDER_MEMBER_ID = oRDER_MEMBER_ID;
	}

	public String getORDER_ADDRESS1() {
		return ORDER_ADDRESS1;
	}
	public void setORDER_ADDRESS1(String oRDER_ADDRESS1) {
		ORDER_ADDRESS1 = oRDER_ADDRESS1;
	}
	public String getORDER_ADDRESS2() {
		return ORDER_ADDRESS2;
	}
	public void setORDER_ADDRESS2(String oRDER_ADDRESS2) {
		ORDER_ADDRESS2 = oRDER_ADDRESS2;
	}
	public String getRECIPIENT_ADDRESS1() {
		return RECIPIENT_ADDRESS1;
	}
	public void setRECIPIENT_ADDRESS1(String rECIPIENT_ADDRESS1) {
		RECIPIENT_ADDRESS1 = rECIPIENT_ADDRESS1;
	}
	public String getRECIPIENT_ADDRESS2() {
		return RECIPIENT_ADDRESS2;
	}
	public void setRECIPIENT_ADDRESS2(String rECIPIENT_ADDRESS2) {
		RECIPIENT_ADDRESS2 = rECIPIENT_ADDRESS2;
	}
	public String getORDER_PHONE1() {
		return ORDER_PHONE1;
	}
	public void setORDER_PHONE1(String oRDER_PHONE1) {
		ORDER_PHONE1 = oRDER_PHONE1;
	}
	public String getORDER_PHONE2() {
		return ORDER_PHONE2;
	}
	public void setORDER_PHONE2(String oRDER_PHONE2) {
		ORDER_PHONE2 = oRDER_PHONE2;
	}
	public String getORDER_PHONE3() {
		return ORDER_PHONE3;
	}
	public void setORDER_PHONE3(String oRDER_PHONE3) {
		ORDER_PHONE3 = oRDER_PHONE3;
	}
	public String getORDER_EMAIL1() {
		return ORDER_EMAIL1;
	}
	public void setORDER_EMAIL1(String oRDER_EMAIL1) {
		ORDER_EMAIL1 = oRDER_EMAIL1;
	}
	public String getORDER_EMAIL2() {
		return ORDER_EMAIL2;
	}
	public void setORDER_EMAIL2(String oRDER_EMAIL2) {
		ORDER_EMAIL2 = oRDER_EMAIL2;
	}
	public String getRECIPIENT_PHONE1() {
		return RECIPIENT_PHONE1;
	}
	public void setRECIPIENT_PHONE1(String rECIPIENT_PHONE1) {
		RECIPIENT_PHONE1 = rECIPIENT_PHONE1;
	}
	public String getRECIPIENT_PHONE2() {
		return RECIPIENT_PHONE2;
	}
	public void setRECIPIENT_PHONE2(String rECIPIENT_PHONE2) {
		RECIPIENT_PHONE2 = rECIPIENT_PHONE2;
	}
	public String getRECIPIENT_PHONE3() {
		return RECIPIENT_PHONE3;
	}
	public void setRECIPIENT_PHONE3(String rECIPIENT_PHONE3) {
		RECIPIENT_PHONE3 = rECIPIENT_PHONE3;
	}
	public String getORDER_GOODS_NAME() {
		return ORDER_GOODS_NAME;
	}
	public void setORDER_GOODS_NAME(String oRDER_GOODS_NAME) {
		ORDER_GOODS_NAME = oRDER_GOODS_NAME;
	}

	public String getORDER_GOODS_COUNT() {
		return ORDER_GOODS_COUNT;
	}
	public void setORDER_GOODS_COUNT(String oRDER_GOODS_COUNT) {
		ORDER_GOODS_COUNT = oRDER_GOODS_COUNT;
	}
	public String getORDER_GOODS_NO() {
		return ORDER_GOODS_NO;
	}
	public void setORDER_GOODS_NO(String oRDER_GOODS_NO) {
		ORDER_GOODS_NO = oRDER_GOODS_NO;
	}
	
	
}