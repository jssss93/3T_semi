package user.review;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class CommentWriteAction extends ActionSupport implements SessionAware {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private Review_CommentVO paramClass;
	private Review_CommentVO resultClass;

	private int REV_C_no;
	private int currentPage;

	private String REV_C_name;
	private String REV_C_passwd;
	private String REV_C_content;
	private int REV_C_originno;
	public Map session;

	Calendar today = Calendar.getInstance();

	public CommentWriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String form() throws Exception {
		return SUCCESS;

	}

	public String execute() throws Exception {

		session.get("M_ID");

		paramClass = new Review_CommentVO();
		resultClass = new Review_CommentVO();

		paramClass.setREV_C_originno(getREV_C_originno());
		paramClass.setREV_C_name(getREV_C_name());
		paramClass.setREV_C_passwd(getREV_C_passwd());

		paramClass.setREV_C_content(getREV_C_content());
		paramClass.setREV_C_date(today.getTime());

		sqlMapper.insert("insertComment", paramClass);

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CommentWriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CommentWriteAction.sqlMapper = sqlMapper;
	}

	public Review_CommentVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(Review_CommentVO paramClass) {
		this.paramClass = paramClass;
	}

	public Review_CommentVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(Review_CommentVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getREV_C_no() {
		return REV_C_no;
	}

	public void setREV_C_no(int REV_C_no) {
		this.REV_C_no = REV_C_no;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public int getREV_C_originno() {
		return REV_C_originno;
	}

	public void setREV_C_originno(int REV_C_originno) {
		this.REV_C_originno = REV_C_originno;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

}
