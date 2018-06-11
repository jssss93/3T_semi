package user.review;

import java.util.Date;

public class Review_CommentVO {

	private int REV_C_no;
	private int REV_C_originno;
	private String REV_C_name;
	private String REV_C_passwd;
	private String REV_C_content;
	private Date REV_C_date;

	public int getREV_C_no() {
		return REV_C_no;
	}

	public void setREV_C_no(int REV_C_no) {
		this.REV_C_no = REV_C_no;
	}

	public int getREV_C_originno() {
		return REV_C_originno;
	}

	public void setREV_C_originno(int REV_C_originno) {
		this.REV_C_originno = REV_C_originno;
	}

	public String getREV_C_name() {
		return REV_C_name;
	}

	public void setREV_C_name(String REV_C_name) {
		this.REV_C_name = REV_C_name;
	}

	public String getREV_C_passwd() {
		return REV_C_passwd;
	}

	public void setREV_C_passwd(String REV_C_passwd) {
		this.REV_C_passwd = REV_C_passwd;
	}

	public String getREV_C_content() {
		return REV_C_content;
	}

	public void setREV_C_content(String REV_C_content) {
		this.REV_C_content = REV_C_content;
	}

	public Date getREV_C_date() {
		return REV_C_date;
	}

	public void setREV_C_date(Date REV_C_date) {
		this.REV_C_date = REV_C_date;
	}

}
