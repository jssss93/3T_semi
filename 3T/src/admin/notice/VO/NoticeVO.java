package admin.notice.VO;

import java.util.Date;

public class NoticeVO {
	private int notice_no;
	private String notice_state;
	private String notice_writer;
	private String notice_subject;
	private String notice_content;
	private String notice_file_orgname;
	private String notice_file_savname;
	private Date notice_regdate;
	
	public int getNotice_no() {
		return notice_no;
	}

	public Date getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_state() {
		return notice_state;
	}

	public void setNotice_state(String notice_state) {
		this.notice_state = notice_state;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_file_orgname() {
		return notice_file_orgname;
	}

	public void setNotice_file_orgname(String notice_file_orgname) {
		this.notice_file_orgname = notice_file_orgname;
	}

	public String getNotice_file_savname() {
		return notice_file_savname;
	}

	public void setNotice_file_savname(String notice_file_savname) {
		this.notice_file_savname = notice_file_savname;
	}

}
