package admin.faq.VO;

import java.util.Date;

public class FaqVO {

	private int faq_no;
	private String faq_writer;
	private String faq_subject;
	private String faq_content;
	private String faq_member_id;

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_writer() {
		return faq_writer;
	}

	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}

	public String getFaq_subject() {
		return faq_subject;
	}

	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_member_id() {
		return faq_member_id;
	}

	public void setFaq_member_id(String faq_member_id) {
		this.faq_member_id = faq_member_id;
	}

}