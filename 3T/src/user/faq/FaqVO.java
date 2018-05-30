package user.faq;

import java.util.Date;

public class FaqVO {
	
	private int FAQ_NO;
	private String FAQ_WRITER;
	private String FAQ_SUBJECT;
	private String FAQ_CONTENT;
	private String FAQ_MEMBER_ID;
	
	public int getFAQ_NO() {
		return FAQ_NO;
	}
	public void setFAQ_NO(int fAQ_NO) {
		FAQ_NO = fAQ_NO;
	}
	public String getFAQ_WRITER() {
		return FAQ_WRITER;
	}
	public void setFAQ_WRITER(String fAQ_WRITER) {
		FAQ_WRITER = fAQ_WRITER;
	}
	public String getFAQ_SUBJECT() {
		return FAQ_SUBJECT;
	}
	public void setFAQ_SUBJECT(String fAQ_SUBJECT) {
		FAQ_SUBJECT = fAQ_SUBJECT;
	}
	public String getFAQ_CONTENT() {
		return FAQ_CONTENT;
	}
	public void setFAQ_CONTENT(String fAQ_CONTENT) {
		FAQ_CONTENT = fAQ_CONTENT;
	}
	public String getFAQ_MEMBER_ID() {
		return FAQ_MEMBER_ID;
	}
	public void setFAQ_MEMBER_ID(String fAQ_MEMBER_ID) {
		FAQ_MEMBER_ID = fAQ_MEMBER_ID;
	}
	
	
}