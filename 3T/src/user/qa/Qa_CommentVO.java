package user.qa;

import java.util.Date;

public class Qa_CommentVO {

	private int QA_NO;
	private int QA_ORIGINNO;
	private String QA_NAME;
	private String QA_PASSWD;
	private String QA_CONTENT;
	private Date QA_REGDATE;

	public int getQA_NO() {
		return QA_NO;
	}

	public void setQA_NO(int qA_NO) {
		QA_NO = qA_NO;
	}

	public int getQA_ORIGINNO() {
		return QA_ORIGINNO;
	}

	public void setQA_ORIGINNO(int qA_ORIGINNO) {
		QA_ORIGINNO = qA_ORIGINNO;
	}

	public String getQA_NAME() {
		return QA_NAME;
	}

	public void setQA_NAME(String qA_NAME) {
		QA_NAME = qA_NAME;
	}

	public String getQA_PASSWD() {
		return QA_PASSWD;
	}

	public void setQA_PASSWD(String qA_PASSWD) {
		QA_PASSWD = qA_PASSWD;
	}

	public String getQA_CONTENT() {
		return QA_CONTENT;
	}

	public void setQA_CONTENT(String qA_CONTENT) {
		QA_CONTENT = qA_CONTENT;
	}

	public Date getQA_REGDATE() {
		return QA_REGDATE;
	}

	public void setQA_REGDATE(Date qA_REGDATE) {
		QA_REGDATE = qA_REGDATE;
	}

}
